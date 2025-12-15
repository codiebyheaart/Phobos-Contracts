import { expect } from "chai";
import { ethers } from "hardhat";
import type { Counter } from "../typechain-types";

describe("Counter Contract", function () {
    let counter: Counter;

    beforeEach(async function () {
        const Counter = await ethers.getContractFactory("Counter");
        counter = await Counter.deploy();
        await counter.waitForDeployment();
    });

    describe("Deployment", function () {
        it("Should start with count of 0", async function () {
            expect(await counter.getCount()).to.equal(0);
        });
    });

    describe("Increment", function () {
        it("Should increment count by 1", async function () {
            await counter.increment();
            expect(await counter.getCount()).to.equal(1);
        });

        it("Should increment multiple times", async function () {
            await counter.increment();
            await counter.increment();
            await counter.increment();
            expect(await counter.getCount()).to.equal(3);
        });

        it("Should emit Incremented event", async function () {
            await expect(counter.increment())
                .to.emit(counter, "Incremented")
                .withArgs(1);
        });
    });

    describe("Decrement", function () {
        it("Should decrement count by 1", async function () {
            await counter.increment();
            await counter.increment();
            await counter.decrement();
            expect(await counter.getCount()).to.equal(1);
        });

        it("Should revert when trying to decrement below zero", async function () {
            await expect(counter.decrement()).to.be.revertedWith(
                "Counter: cannot decrement below zero"
            );
        });

        it("Should emit Decremented event", async function () {
            await counter.increment();
            await expect(counter.decrement())
                .to.emit(counter, "Decremented")
                .withArgs(0);
        });
    });

    describe("Complex Scenarios", function () {
        it("Should handle multiple increments and decrements", async function () {
            await counter.increment();
            await counter.increment();
            await counter.increment();
            expect(await counter.getCount()).to.equal(3);

            await counter.decrement();
            expect(await counter.getCount()).to.equal(2);

            await counter.increment();
            expect(await counter.getCount()).to.equal(3);

            await counter.decrement();
            await counter.decrement();
            expect(await counter.getCount()).to.equal(1);
        });
    });
});
