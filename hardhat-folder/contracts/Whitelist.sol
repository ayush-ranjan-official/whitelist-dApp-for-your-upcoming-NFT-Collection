//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {

    // It is not necessary to use the public modifier for a state variable in Solidity.
    // Using the public modifier generates an automatic getter function for the state variable, allowing other contracts or external entities to read its value. 
    // Max number of whitelisted addresses allowed
    // uint8 as max value is 10
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false my default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // set maxWhitelistedAddresses in start
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
    */
   function addAddressToWhitelist() public {
    // check if the user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
    // Add the address which called the function to the whitelistedAddress array
    whitelistedAddresses[msg.sender] = true;
    // Increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;
   }


}
