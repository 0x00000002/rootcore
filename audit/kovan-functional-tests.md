# Functional tests
Tests are conducted on the Kovan test network.


## Roles

### Contract owner:

* Start Sale period by deploying contract with Start date and address of Beneficiary wallet.

### Manager can:

* Add/remove Contributors to/from Whitelist during Pre-Sale and Sale periods.
* Pause/unpause Sales during Sale period.

## Periods

### Presale, 14 days
* Started automatically 14 days before <i>Sales</i>
* Only Whitelisted can contribute
* Minimum contribution: 200 ETH
* No account max cap <u>( MAX contribution cap? )</u>

### Sale
* Started by deploying contract with <i>Start date</i> and <i>Beneficiary account</i>
* Maximum contribution: 40 ETH
* Whitelisted maximum contributors: no limits
* Tokens are not transferable

### Grace period
* Only if Hard Cap in Sales has not reached. 
* Duration: 24 hrs


## Accounts

* CrowdSaleController []()
* Manager
* Beneficiary (MultiSig Wallet)
* Contributors
* Contributors White Listed


## Expected behaviour tests
by roles

### Owner
 - [x] Deploy contract [0xda697](https://kovan.etherscan.io/tx/0xda697ed8f79f88ca0dbaf3dcbb59e42f88b9283082eff0377ab16bd558c42cbd)

### Contributors
 - [x] ContributeETH []()
 - [x] ContributePreSale []()

### Management
 - [x] Transfer management []()
 - [x] Accept management []()
 - [x] Add account to WhiteList []()
 - [x] Remove account from WhiteList []()
 - [x] Pause Sale []()
 - [x] Unpause Sale []()
 - [x] ContributeFiat []()

### System simulated events
 - [x] Sale Soft cap 100.000 ETH has reached 
 - [x] Sale Hard cap 110.000 ETH has reached 


## Unexpected behaviour tests


### Pre-sale
 - [x] ContributeETH with insufficient amount []()


### Sale
 - [x] ContributeETH with amount exceeding the limit []()


### Management
 - [x] Transfer management from unexpected account []()
 - [x] Accept management from unexpected account []()
 - [x] Transfer contract(s) Ownership from unexpected account []()
 - [x] Accept contract(s) Ownership from unexpected account []()
 - [x] Add non-existing account to WhiteList []()
 - [x] Add to WhiteList already WhiteListed account []()
 - [x] Remove non-existing account from WhiteList []()
 - [x] Remove from WhiteList account which is not listed there[]()
 - [x] Pause already paused Sale []()
 - [x] Unpause on-going Sale []()

