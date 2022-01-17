// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract SignatureDemo {
    address owner;
    using ECDSA for bytes32;

    constructor() {
        owner = msg.sender;
    }

    function isMessageValid(bytes memory _signature)
        public
        view
        returns (address, bool)
    {
        bytes32 messagehash = keccak256(
            abi.encodePacked(address(this), msg.sender)
        );
        address signer = messagehash.toEthSignedMessageHash().recover(
            _signature
        );

        if (owner == signer) {
            return (signer, true);
        } else {
            return (signer, false);
        }
    }
}
