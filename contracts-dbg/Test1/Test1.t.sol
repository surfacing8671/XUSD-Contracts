// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.21 < 0.9.0;

import "../../contracts/TUSDRegistry.sol";
import "../../contracts/mockToken.sol";
contract DbgEntry {
    constructor() {
      //  TUSDRegistry lock = new TUSDRegistry();
        MyTokenMock token = new MyTokenMock("A", "A", "18", '10000000000000000000000');
    }
}
