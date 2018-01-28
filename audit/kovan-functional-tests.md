# Functional tests
Tests are conducted on the Kovan test network.


## Roles

### Contract owner:

* Start Sale period by deploying contract with Start date and address of Beneficiary wallet

### Manager can:

* Add/remove Contributors to/from Whitelist during Pre-Sale and Sale periods
* Pause/unpause Sales during Sale period
* Transfer Ownership of contracts

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


## Accounts

* CrowdSaleController []()
* Manager []()
* Beneficiary (MultiSig Wallet) []()
* Contributors []()
* WhiteListed Contributors []()


## Expected behaviour tests
by roles

### Owner
 - [] Deploy contract []()
 
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



