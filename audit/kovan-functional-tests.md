# Functional tests
Tests are conducted on the Kovan test network, January 29 - 31, 2018, @tikonoff

<br>

## Roles

### Contract owner:

* Start Sale period by deploying contract with Start date and address of Beneficiary wallet

### Manager can:

* Add/remove Contributors to/from Whitelist during Pre-Sale and Sale periods
* Pause/unpause Sales during Sale period
* Transfer Ownership of contracts

<br>

## Periods
### Presale – 14 days
* Started automatically 14 days before <i>Sales</i>
* Only Whitelisted can contribute
* Minimum contribution: 200 ETH
* No Account MaxCap (if overall Hard/Soft MaxCap has not reached)

### Sale – 14 days
* Started by deploying contract with <i>Start date</i> and <i>Beneficiary account</i>
* Maximum contribution for usual accounts: 40 ETH
* Whitelisted maximum contributors: no limits
* Tokens are not transferable

### Grace period – 24 hrs
* Is ON when Soft Cap has reached (the exact period does not matter)
* Set End Time for Sale as NOW + 24hrs
* Does matter only when Hard Cap has not reached
* Duration: 24 hrs

<br>

## Accounts

* Main [0x0030225451B263384Cf8400dff773c196E7eabE1](https://kovan.etherscan.io/address/0x0030225451B263384Cf8400dff773c196E7eabE1)
* Manager [0x0043B7f4e75d12EA27c83eF4A8344A6B392397A5](https://kovan.etherscan.io/address/0x0043B7f4e75d12EA27c83eF4A8344A6B392397A5)
* Beneficiary (MultiSig Wallet) [0x006e13780f0C43c2446456581580Bae15DBe1f37](https://kovan.etherscan.io/address/0x006e13780f0C43c2446456581580Bae15DBe1f37)
* Contributors [0x007Ce47aBa1f6cfF4667C9Bf4cFF97d9A9796607](https://kovan.etherscan.io/address/0x007Ce47aBa1f6cfF4667C9Bf4cFF97d9A9796607)
* WhiteListed Contributors [0x009841Abc21A880Bf9e71C4cEfF7C93785CEb3C8](https://kovan.etherscan.io/address/0x009841Abc21A880Bf9e71C4cEfF7C93785CEb3C8)
* Complete Stranger [0x00488ad1711505eA3026DF19955052F1d87121d8](https://kovan.etherscan.io/address/0x00488ad1711505eA3026DF19955052F1d87121d8)



## Expected behaviour tests
by roles

### Owner
 - Deploy contracts:
 	- [x] in the Future (Pre-Sale has not started yet), beneficiary is "Main Account" [0xf7d0c6](https://kovan.etherscan.io/tx/0xf7d0c68527f3341de0aa9958b9ec9923d803e25a36d5c9de2d0ac61fbd7500ce)
 	- [x] PreSale period (NOW is today + 13 days), beneficiary is "Beneficiary account" [0xc02bc9](https://kovan.etherscan.io/tx/0xc02bc95ada5b7f0fd47b287f26c6a2d97c04fe111c6dcd92215b8ce2ed64af9a) 
 	- [x] for the Sale (NOW is January 30, 2018), beneficiary is "Beneficiary account" [0xd436be](https://kovan.etherscan.io/tx/0xd436be5c7d4c8230d2601da6252faa903751c57a8e5cd4a824f8fb3d2bbfb1f2) 
 	- [x] in the past (sale has over), beneficiary is "Beneficiary account"  - <font color="red">deployed with ERROR</font> [0x9902b9](https://kovan.etherscan.io/tx/0x9902b9a52cdb57ef1a94d091548af90417420eaba5b4dcaed69ec1247961e4ac)
 
### Contributors
 - [] ContributeETH []()
 - [] ContributePreSale - <font color=red>can't test, don't have 200ETH on Kovan</font>
 - [] PreSale period: GraceDuration is ON when SoftCap is reached
 - [] Sale period: GraceDuration is ON when SoftCap is reached


### Manager
 - [x] Transfer management [0x72b77d](https://kovan.etherscan.io/tx/0x72b77d80264760a3a84775b49a33a6be57a3aaab99f5e3fe4a693989c4fbdaa5)
 - [x] Accept management [0x5eee6b](https://kovan.etherscan.io/tx/0x5eee6ba00896bebcdc943bfb12f2f0ca48b3d455ceaa5c3a784a9e29eda61a20)
 - [x] Add account to WhiteList [0x4ed0a2](https://kovan.etherscan.io/tx/0x4ed0a25319f20ce4c1d289158595e676a231aef69cbd5b1c81a340f9b7b986fb)
 - [x] Remove account from WhiteList [0x4ee67f](https://kovan.etherscan.io/tx/0x4ee67fc4598e3d5614a5eaeb37568ab3a5a4375b7421c0a9c8bbea5c8b46f9aa)
 - [x] Pause Sale [0x91751f](https://kovan.etherscan.io/tx/0x91751f8edb026302164d4d29ac952642e746790c672cab249d440ca08aaeb8df)
 - [x] Unpause Sale [0x12f81d](https://kovan.etherscan.io/tx/0x12f81d578d3e76be43912cc9cdec958c2805372253c29057a7a0887cf1eb4bc3)
 - [] ContributeFiat  []()  - <b>CAN'T</b> Why? 
 
### Token Owner
 - [] transfer() []()
 - [] transferFrom() []()
 - [] approve() []()
 - [] Enable / disable transfers []()

### Smart Token Contract controller
 - [] Enable / disable transfers []()
 - [] Issue token []()
 - [] Destroy tokens []()
 - [] Enable / disable transfers []()
 - [] Withdraw


### Contracts Owner
 - [] Transfer contracts' controller Ownership []()
 - [] Trying to accept Ownership []()


### System simulated events
 - [] Sale Soft cap 100.000 ETH has reached 
 - [] Sale Hard cap 110.000 ETH has reached 


<br>

## Unexpected behaviour tests (reverts expected)


### Contributors
 - [] ContributePreSale when Sale is paused []()
 - [x] ContributePreSale with less than MIN_CONTRIBUTION (200ETH) [0xecd6d3](https://kovan.etherscan.io/tx/0xecd6d3d4535120d50dd8424e1917501646d59c0ec0683675d5aa7454e1132b0a)
 - [] ContributePreSale with gas price > 50 gWeis []()
 - [] ContributePreSale earlier than NOW() - 14 days []()
 - [] ContributePreSale later than NOW() []()
 - [] ContributePreSale from non-Whitelisted account []()
 - [] ContributePreSale when Soft MaxCap is reached []()
 - [] ContributePreSale when Hard MaxCap is reached []()
 - -
 - [] ContributeETH when Sale is paused []()
I - [] ContributeETH with amount exceeding the limit []()
 - [] ContributeETH with gas price > 50 gWeis []()
 - [] ContributeETH later than NOW() + 14 days []()
 - [] ContributeETH earlier than NOW() []()
 - [] ContributeETH with amount exceeding MAX_CONTRIBUTION (40ETH) from non-Whitelisted account []()
 - [] ContributeETH when Soft MaxCap is reached []()
 - [] ContributeETH when Hard MaxCap is reached []()


 
### Token Owner
 - [] transfer() tokens when transfers are not allowed []()
 - [] transfer() tokens to invalid address []()
 - [] transfer() tokens from account with insufficient funds []()
 - [] transferFrom() to invalid address []()
 - [] transferFrom() invalid address []()
 - [] transferFrom() tokens from account with insufficient funds []()
 - [] approve() (should be called twice)[]()
 - [] Withdraw from .... after .... before ...
 - 

### Smart Token Contract controller
 - [] Issue tokens from unexpected account []()
 - [] Issue tokens to the owner account []()
 - [] Issue token to invalid (0x0) address []()
 - [] Destroy tokens from other's account []()
 - [] Destroy tokens from account with insufficient funds []()

### Contracts Owner
 - [] Transfer contract(s) Ownership from unexpected account []()
 - [] Trying to accept Ownership from unexpected account []()


### Manager
 - [] Transfer management from unexpected account []()
 - [x] Trying to accept management from unexpected account [0x3e2953](https://kovan.etherscan.io/tx/0x3e2953b6ac480b856036499cf88acf0de4401adf9a0f3ca601d710c39c4b9d46)
 - [] Transfer contract(s) Ownership from unexpected account []()
 - [] Trying to accept Ownership from unexpected account []()
 - [] Add non-existing account to WhiteList []()
 - [] Add to WhiteList already WhiteListed account []()
 - [] Remove non-existing account from WhiteList []()
 - [] Remove from WhiteList account which is not listed there[]()
 - [x] Pause already paused Sale [0xf9aac8](https://kovan.etherscan.io/tx/0xf9aac81be04e2496a9b0111f4014e432dd07e70fbb8686cead2c0fdd61fbff87)
 - [x] Unpause on-going Sale [0x6f1265](https://kovan.etherscan.io/tx/0x6f126548875e199ab2acc574aa3b6f39b5d8ae36e7ebb9c00746a2306d19f949)
 - [] ContributeFiat when Sale is paused []()
 - [] ContributeFiat before Pre-Sale of after Sale is finished []()


