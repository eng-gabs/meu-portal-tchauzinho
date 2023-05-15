// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    struct S {
        uint256 waveCount;
        uint256[] wavesTimestamps;
    }
    mapping(address => S) addressData;

    constructor() {
        console.log("Prazer, eu sou Inteligente... Contrato Inteligente!");
    }

    function wave() public {
        totalWaves += 1;
        addressData[msg.sender].waveCount += 1;
        console.log("timestamp", block.timestamp);
        addressData[msg.sender].wavesTimestamps.push(block.timestamp);
        // msg.sender is the function caller wallet address
        // in order to call a smart contract function, you must be connected with a valid wallet
        console.log("%s deu tchauzinho!", msg.sender);
        console.log(
            "address total count is now",
            addressData[msg.sender].waveCount
        );
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("Temos um total de %d tchauzinhos!", totalWaves);
        return totalWaves;
    }
}
