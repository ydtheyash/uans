// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Uans {
    struct Parameters {
        string chainName;
        uint256 chainId;
        address nftContractAddress;
        uint256 tokenId;
    }

    Parameters public parameters;
    string public U;
    string public Ue;

    constructor(string memory _chainName, uint256 _chainId, address _nftContractAddress, uint256 _tokenId) {
        parameters = Parameters(_chainName, _chainId, _nftContractAddress, _tokenId);
        U = generateU();
        Ue = encrypt(U);
    }

    function xyz(string memory _chainName, uint256 _chainId, address _nftContractAddress, uint256 _tokenId) public {
        parameters = Parameters(_chainName, _chainId, _nftContractAddress, _tokenId);
        U = generateU();
        Ue = encrypt(U);
    }

    function generateU() internal view returns (string memory) {
        string memory chainName = parameters.chainName;
        uint256 chainId = parameters.chainId;
        address nftContractAddress = parameters.nftContractAddress;
        uint256 tokenId = parameters.tokenId;

        string memory Z = string(abi.encodePacked(chainName, uintToString(chainId), addressToString(nftContractAddress), "#", uintToString(tokenId)));
        return Z;
    }

    function encrypt(string memory input) internal pure returns (string memory) {
        bytes32 encrypted = keccak256(abi.encodePacked(input));
        return bytes32ToString(encrypted);
    }

    function decrypt(string memory input) internal pure returns (string memory) {
        bytes memory decrypted = abi.encodePacked("Decrypted:", input);
        return string(decrypted);
    }

    function uintToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }

        return string(buffer);
    }

    function addressToString(address value) internal pure returns (string memory) {
        bytes32 valueBytes = bytes32(uint256(uint160(value)));
        bytes memory alphabet = "0123456789abcdef";
        bytes memory result = new bytes(42);

        result[0] = "0";
        result[1] = "x";

        for (uint256 i = 0; i < 20; i++) {
            result[2 + i * 2] = alphabet[uint8(valueBytes[i + 12] >> 4)];
            result[3 + i * 2] = alphabet[uint8(valueBytes[i + 12] & 0x0f)];
        }

        return string(result);
    }

    function bytes32ToString(bytes32 value) internal pure returns (string memory) {
        bytes memory alphabet = "0123456789abcdef";
        bytes memory result = new bytes(64);

        for (uint256 i = 0; i < 32; i++) {
            result[i * 2] = alphabet[uint8(value[i] >> 4)];
            result[i * 2 + 1] = alphabet[uint8(value[i] & 0x0f)];
        }

        return string(result);
    }
}