// @ts-check

/** @type {import('@wagmi/cli').Config} */
import { defineConfig } from '@wagmi/cli'
import { hardhat } from '@wagmi/cli/plugins'
export default defineConfig({
  plugins: [
    hardhat({
      artifacts: 'out/', 
      project: '../hello_hardhat',
    }),
  ],
})