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
* Manager [0x00488ad1711505eA3026DF19955052F1d87121d8](https://kovan.etherscan.io/address/0x00488ad1711505eA3026DF19955052F1d87121d8)
* Beneficiary (MultiSig Wallet) [0x006e13780f0C43c2446456581580Bae15DBe1f37](https://kovan.etherscan.io/address/0x006e13780f0C43c2446456581580Bae15DBe1f37)
* Contributors [0x007Ce47aBa1f6cfF4667C9Bf4cFF97d9A9796607](https://kovan.etherscan.io/address/0x007Ce47aBa1f6cfF4667C9Bf4cFF97d9A9796607)
* WhiteListed Contributors [0x009841Abc21A880Bf9e71C4cEfF7C93785CEb3C8](https://kovan.etherscan.io/address/0x009841Abc21A880Bf9e71C4cEfF7C93785CEb3C8)
* Complete Stranger [0x00a5F51aD0D357dAd9F899106f33b34436D445d4](https://kovan.etherscan.io/address/0x00a5F51aD0D357dAd9F899106f33b34436D445d4)



## Expected behaviour tests
by roles

### Owner
 - Deploy contracts:
 	- [x] in the Future (Pre-Sale has not started yet), beneficiary is RootCore [0xf7d0c6](https://kovan.etherscan.io/tx/0xf7d0c68527f3341de0aa9958b9ec9923d803e25a36d5c9de2d0ac61fbd7500ce)
 	- [x] PreSale period (NOW is today + 13 days), beneficiary is RootCore [0x19499d](https://kovan.etherscan.io/tx/0x19499dbdc0a87b75ed8b2b76688d45c6087664027eb96b4411b85ee47c4500d2) 
 	- [x] for the Sale (NOW is January 30, 2018), beneficiary is "Beneficiary account" [0xd436be](https://kovan.etherscan.io/tx/0xd436be5c7d4c8230d2601da6252faa903751c57a8e5cd4a824f8fb3d2bbfb1f2) 
 	- [x] in the past (sale has over) - <font color="red">deployed with ERROR</font> [0x9902b9](https://kovan.etherscan.io/tx/0x9902b9a52cdb57ef1a94d091548af90417420eaba5b4dcaed69ec1247961e4ac)
 
### Contributors
 - [] ContributeETH []()
 - [] ContributePreSale []()
 - [] PreSale period: GraceDuration is ON when SoftCap is reached
 - [] Sale period: GraceDuration is ON when SoftCap is reached


### Manager
 - [] Transfer management []()
 - [] Accept management []()
 - [] Add account to WhiteList []()
 - [] Remove account from WhiteList []()
 - [] Pause Sale []()
 - [] Unpause Sale []()
 - [] ContributeFiat  []()
 
### Token Owner
 - [] transfer() []()
 - [] transferFrom() []()
 - [] approve() []()
 - [] Enable / disable transfers []()
 - [] Withdraw

### Smart Token Contract controller
 - [] Enable / disable transfers []()
 - [] Issue token []()
 - [] Destroy tokens []()
 - [] Enable / disable transfers []()


### Contracts Owner
 - [] Transfer contracts' controller Ownership []()
 - [] Trying to accept Ownership []()


### System simulated events
 - [] Sale Soft cap 100.000 ETH has reached 
 - [] Sale Hard cap 110.000 ETH has reached 


<br>

## Unexpected behaviour tests


### Contributors
 - [] ContributePreSale when Sale is paused []()
 - [] ContributePreSale with less than MIN_CONTRIBUTION (200ETH) []()
 - [] ContributePreSale with gas price > 50 gWeis []()
 - [] ContributePreSale earlier than NOW() - 14 days []()
 - [] ContributePreSale later than NOW() []()
 - [] ContributePreSale from non-Whitelisted account []()
 - [] ContributePreSale when Soft MaxCap is reached []()
 - [] ContributePreSale when Hard MaxCap is reached []()
 - -
 - [] ContributeETH when Sale is paused []()
 - [] ContributeETH with amount exceeding the limit []()
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
 - [] Trying to accept management from unexpected account []()
 - [] Transfer contract(s) Ownership from unexpected account []()
 - [] Trying to accept Ownership from unexpected account []()
 - [] Add non-existing account to WhiteList []()
 - [] Add to WhiteList already WhiteListed account []()
 - [] Remove non-existing account from WhiteList []()
 - [] Remove from WhiteList account which is not listed there[]()
 - [] Pause already paused Sale []()
 - [] Unpause on-going Sale []()
 - [] ContributeFiat when Sale is paused []()
 - [] ContributeFiat before Pre-Sale of after Sale is finished []()



