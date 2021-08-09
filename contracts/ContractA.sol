pragma solidity >=0.4.22 <0.9.0;
//SPDX-License-Identifier:UNLICENSED

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721Holder.sol';

//new contract inheritd from Holder
contract ContractB is ERC721Holder {
    function deposit(uint tokenId) external;
    function withdraw(uint tokenId) external;
}


contract ContractA is ERC721Holder {
    IERC721 public token;
    //define the variable for the contract B above
    ContractB public ContractB;

    //pass the adress of the contract in the parameters
    constructor(address _token, address _contractB){
        token = IERC721(_token);
        contractB = ContractB(_contractB);
    }
    //before to call the function in javaScript we need to call the proof function
    function deposit(uint tokenId) external {
        //call the deposit function
        //safe the transfert from the address of the transaction to the smart contract
        token.safeTransferFrom(msg.sender, address(this), tokenId);
        //forward the token to the contractB
        token.approve(address(contractB), tokenId);
        contractB.deposit(tokenId);
    }

    function withdraw(uint tokenId) external {
        contractB.withdraw(tokenId);
        //not a delegate transfert but a direct one, cause the token is at the address of the token A
        //need specify our own address
        token.safeTransferFrom(address(this), msg.sender, tokenId);
    }
}