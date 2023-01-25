// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IAllowlist.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTDrop is Ownable {
    struct Drop {
        uint256 startTime; // seconds
        uint256 ethPrice; // wei
        uint128 limitNFT; // if not limit, set to 0
        address allowlist; // whitelist address, if public, set to zero address

        // Mapping For Allowlist??
    }

    Drop[] public drops;
    IAllowlist allowlist;


    // constructor(address AllowlistContract) {
    //     allowlist = IAllowlist(AllowlistContract);
    // }

    // add offer
    function addDrop(
        uint256 startTime,
        uint256 ethPrice,
        uint128 limitNFT,
        address allowlist
    ) public onlyOwner {
        Drop memory _drop = Drop({
            startTime: startTime + block.timestamp,
            ethPrice: ethPrice * 1e18,
            limitNFT: limitNFT,
            allowlist: allowlist
        });
        drops.push(_drop);
    }

    function numberOfDrop() public view returns (uint) {
        return drops.length;
    }

    function PresaleMint() public payable {
        uint256 activeDropIndex;

        for (uint i=0; i<drops.length; i++) {
            Drop memory drop = drops[i];
            // require(block.timestamp >= drop.startTime, );


            if (block.timestamp < drop.startTime) {
                revert("not available");
                // continue;
            } else {
                activeDropIndex = i;
                break;
            }
            if (msg.value >= drop.ethPrice) {
                revert("Ether is not correct");
            } else {
                activeDropIndex = i;
                break;
            }

        }

        Drop memory current_drop = drops[activeDropIndex];

    }
}