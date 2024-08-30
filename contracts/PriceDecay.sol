// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceSlowDecay {
    uint256 public immutable initialPrice;  // Initial high price
    uint256 public immutable minPrice;      // Minimum price after full decay
    uint256 public immutable startTime;     // Time when decay starts
    uint256 public immutable duration;      // Duration over which the price decays

    constructor(uint256 _initialPrice, uint256 _minPrice, uint256 _duration) {
        require(_initialPrice > _minPrice, "Initial price must be greater than minimum price.");
        require(_duration > 0, "Duration must be greater than 0.");
        
        initialPrice = _initialPrice;
        minPrice = _minPrice;
        duration = _duration * 86400;
        startTime = block.timestamp; // Decay starts when the contract is deployed
    }

    // Function to get the current price with a slow decay
    function getCurrentPrice() public view returns (uint256) {
        // Calculate time passed since start
        uint256 elapsedTime = block.timestamp - startTime;

        // If time exceeds duration, return the minimum price
        if (elapsedTime >= duration) {
            return minPrice;
        }

        // Calculate decay factor: (1 - (elapsedTime / duration)^2)
        uint256 timeFactor = (elapsedTime * 1e18 / duration);  // Scale up for precision
        uint256 decayFactor = 1e18 - (timeFactor * timeFactor / 1e18); // (1 - (t/d)^2) scaled

        // Compute the current price using the decay factor
        uint256 priceRange = initialPrice - minPrice;
        uint256 decayedAmount = (priceRange * decayFactor) / 1e18;  // Adjust for scaling
        return minPrice + decayedAmount;
    }
}