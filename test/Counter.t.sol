// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../contracts/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialCount() public view {
        assertEq(counter.getCount(), 0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.getCount(), 1);
        
        counter.increment();
        assertEq(counter.getCount(), 2);
    }

    function test_Decrement() public {
        counter.increment();
        counter.increment();
        counter.increment();
        
        counter.decrement();
        assertEq(counter.getCount(), 2);
        
        counter.decrement();
        assertEq(counter.getCount(), 1);
    }

    function test_DecrementRevertsOnZero() public {
        vm.expectRevert("Counter: cannot decrement below zero");
        counter.decrement();
    }

    function test_IncrementEmitsEvent() public {
        vm.expectEmit(true, true, true, true);
        emit Counter.Incremented(1);
        counter.increment();
    }

    function test_DecrementEmitsEvent() public {
        counter.increment();
        
        vm.expectEmit(true, true, true, true);
        emit Counter.Decremented(0);
        counter.decrement();
    }
}
