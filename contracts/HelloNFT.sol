// SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract HelloNFT is ERC721URIStorage {
    uint tokenId;
    mapping(address=>tokenMetaData[]) public ownershipRecord;
    event MintedToken(address indexed owner, uint256 indexed tokenId);

    struct tokenMetaData {
        uint tokenId;
        uint timeStamp;
        string tokenURI;
    }

    constructor() ERC721 ("HelloNFT", "HNFT") {
        console.log("The contract is now up!");
        tokenId = 1;   
    }

    // Minting token to the address the function is called from
    function mintToken() public {
        // mint a new token
        _safeMint(msg.sender, tokenId);

        // the metadata json of my NFT
        string memory url = 'https://jsonkeeper.com/b/OTPQ';
        
        // this is from the course. 
        ownershipRecord[msg.sender].push(tokenMetaData(tokenId, block.timestamp, url));

        // Setting the NFT metadata
        _setTokenURI(tokenId, url);
        tokenId = tokenId + 1;

        // Emitting the event
        emit MintedToken(msg.sender, tokenId);
    }

    // Transfer the NFT from the address which the NFT is minted to the address specified
    function transferToken(address to, uint256 tokenID) public {
        safeTransferFrom(msg.sender, to, tokenID);
    }
}