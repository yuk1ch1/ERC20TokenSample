//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract MyToken is ERC20, Ownable {
    // トークン名
    string tokenName;
    // シンボル名(i.e. btc, ethみたいなの)
    string tokenSymbol;

    constructor(string memory _tokenName, string memory _tokenSymbol) ERC20(_tokenName, _tokenSymbol) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
    }

    /// トークンを発行するメソッド
    ///    * @param to 発行先アドレス
    ///    * @param amount 発行数
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function _mint(address to, uint256 amount) internal override {
        super._mint(to, amount);
    }

    ///    * トークンを償却する関数
    ///    * @param to 発行先アドレス
    ///    * @param amount 発行数
    function burn(address to, uint256 amount) public onlyOwner {
        _burn(to, amount);
    }

    function _burn(address to, uint256 amount) internal override {
        super._burn(to, amount);
    }
}