// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title Counter
 * @dev Simple counter contract for demonstrating Hardhat 3 Beta features
 */
contract Counter {
    uint256 private count;

    event Incremented(uint256 newCount);
    event Decremented(uint256 newCount);

    constructor() {
        count = 0;
    }

    /**
     * @dev Increment the counter by 1
     */
    function increment() public {
        count += 1;
        emit Incremented(count);
    }

    /**
     * @dev Decrement the counter by 1
     */
    function decrement() public {
        require(count > 0, "Counter: cannot decrement below zero");
        count -= 1;
        emit Decremented(count);
    }

    /**
     * @dev Get the current count
     */
    function getCount() public view returns (uint256) {
        return count;
    }
}
