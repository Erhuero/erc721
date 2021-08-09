pragma solidity >=0.4.22 <0.9.0;
//SPDX-License-Identifier:UNLICENSED

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract ERC721OpenZeppelin is ERC721 {
    constructor() ERC721('LYSERO', 'LSO'){}
}

//mint some NFTinthe constructor
contract ERC721OpenZeppelin2 is ERC721 {
    constructor() ERC721('LYSERO', 'LSO'){
        //safe check if the receiver is able to receive the NFT
        _safeMint(msg.sender, 0);
    }
}

//mint  in a dedicted function
contract ERC721OpenZeppelin3 is ERC721 {
    address public admin;

    constructor() ERC721('LYSERO', 'LSO'){
        //safe check if the receiver is able to receive the NFT
        admin = msg.sender;
    }
    //mint function
    function mint(address to, uint tokenId) external {
        //make sure only admin can call the function
        require(msg.sender == admin, 'only admin');
        _safeMint(to, tokenId);
    }
}

//faucet for ERC721
contract ERC721OpenZeppelin3 is ERC721 {
    address public admin;

    constructor() ERC721('LYSERO', 'LSO'){

    }
    //mint function
    function mint(address to, uint tokenId) external {
        
        _safeMint(to, tokenId);
    }
}