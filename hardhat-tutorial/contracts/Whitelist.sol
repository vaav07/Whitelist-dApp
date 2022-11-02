// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    //Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    //if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    //numAddresseswhitelisted would be use to keep track of how many address have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted addresses
    //user will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //msg.sender is the address of the user wh called this function
        require(!whitelistedAddresses[msg.sender], "Sender already in the whitelisted");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Max limit reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

}