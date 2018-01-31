/* global artifacts */
/* eslint-disable prefer-reflect */

const Utils = artifacts.require('Utils.sol');
const Owned = artifacts.require('Owned.sol');
const Managed = artifacts.require('Managed.sol');
const Pausable = artifacts.require('Pausable.sol');
const TokenHolder = artifacts.require('TokenHolder.sol');
const ERC20Token = artifacts.require('ERC20Token.sol');
const SmartToken = artifacts.require('SmartToken.sol');
const SmartTokenController = artifacts.require('SmartTokenController.sol');
const CrowdsaleController = artifacts.require('CrowdsaleController.sol');

module.exports = async (deployer) => {
    console.log("network: " + web3.version.network);
    // await deployer.deploy(Utils);
    // await deployer.deploy(Owned);
    // await deployer.deploy(Managed);
    // await deployer.deploy(Pausable);
    // await deployer.deploy(TokenHolder);
    // await deployer.deploy(ERC20Token, 'DummyToken', 'DUM', 0);
    // await deployer.deploy(SmartToken, 'Token1', 'TKN1', 18);
    // await deployer.deploy(SmartTokenController, SmartToken.address);
//    await deployer.deploy(CrowdsaleController, 1539537600, '0x125');  // Nov'19
//    await deployer.deploy(CrowdsaleController, 1483228800, '0x0030225451B263384Cf8400dff773c196E7eabE1'); // 01/01/2017
//    await deployer.deploy(CrowdsaleController, 1518220800, '0x006e13780f0C43c2446456581580Bae15DBe1f37'); // 10/02/2018
    await deployer.deploy(CrowdsaleController, 1517184000, '0x006e13780f0C43c2446456581580Bae15DBe1f37'); // 30/01/2018

};



