// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import { Fixture } from "../Fixture.t.sol";

contract C4PoC is Fixture {
    uint256 internal constant maxDistribForOOG = 1e4;
    uint256 internal constant nbrDistrib = 10;
    uint32 internal initStartTime;
    uint32 internal initEndTime;
    uint32 internal startTime;
    uint32 internal endTime;
    uint32 internal numEpoch;

    function setUp() public override {
        super.setUp();

        initStartTime = uint32(block.timestamp);
        numEpoch = 25;
        initEndTime = startTime + numEpoch * EPOCH_DURATION;

        vm.prank(governor);
        creator.setFeeRecipient(dylan);

        vm.startPrank(guardian);
        address[] memory tokens = new address[](1);
        uint256[] memory amounts = new uint256[](1);
        tokens[0] = address(angle);
        amounts[0] = 1e8;
        creator.setRewardTokenMinAmounts(tokens, amounts);
        vm.stopPrank();

        angle.mint(address(alice), 1e22);
        vm.prank(alice);
        angle.approve(address(creator), type(uint256).max);

        vm.stopPrank();
    }

    function test_submissionValidity() external {}
}
