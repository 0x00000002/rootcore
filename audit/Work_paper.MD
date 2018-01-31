
| Contract |          Function           | Visibility | Constant | Returns |  Modifiers  | Static Analysis | Test Coverage | Functional Analysis |
|----------|-----------------------------|------------|----------|---------|-------------|-----------------|---------------|---------------------|
| Managed  | Managed()                   | public     | false    |         |             | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Managed  | transferManagement(address) | public     | false    |         | managerOnly | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Managed  | acceptManagement()          | public     | false    |         |             | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

# Rootcore Work paper
## ./contracts

[CrowdsaleController.sol](/contracts/CrowdsaleController.sol)


|      Contract       |               Function               | Visibility | Constant | Returns |                                  Modifiers                                   | Static Ana | Coverage | Func Ana |
|---------------------|--------------------------------------|------------|----------|---------|------------------------------------------------------------------------------|------------|----------|----------|
| CrowdsaleController | CrowdsaleController(uint256,address) | public     | false    |         | SmartTokenController,validAddress,earlierThan                                | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | computeReturn(uint256)               | public     | true     | uint256 |                                                                              | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | upadateContributorsCount(uint256)    | private    | false    |         |                                                                              | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | addToWhitelist(address)              | public     | false    | added   | managerOnly                                                                  | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | removeFromWhitelist(address)         | public     | false    | added   | managerOnly                                                                  | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | contributeETH()                      | public     | false    | amount  | payable,between,whenNotPaused,maxAccountContributionNotReached               | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | contributePreSale()                  | public     | false    | amount  | payable,between,whenNotPaused,validatePresaleMinPrice,validatePresaleAddress | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | contributeFiat(address,uint256)      | public     | false    | amount  | payable,managerOnly,between,whenNotPaused                                    | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | processContribution()                | private    | false    | amount  | active,etherSoftCapNotReached,etherCapNotReached,validGasPrice               | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |
| CrowdsaleController | ()                                   | public     | false    |         | payable                                                                      | :white_check_mark:        | :white_check_mark:      | :white_check_mark:      |


[ERC20Token.sol](/contracts/ERC20Token.sol)


|  Contract  |               Function                | Visibility | Constant | Returns |         Modifiers         | Static Analysis | Test Coverage | Functional Analysis |
|------------|---------------------------------------|------------|----------|---------|---------------------------|-----------------|---------------|---------------------|
| ERC20Token | ERC20Token(string,string,uint8)       | public     | false    |         |                           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| ERC20Token | transfer(address,uint256)             | public     | false    | success | validAddress              | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| ERC20Token | transferFrom(address,address,uint256) | public     | false    | success | validAddress,validAddress | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| ERC20Token | approve(address,uint256)              | public     | false    | success | validAddress              | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[Managed.sol](/contracts/Managed.sol)

| Contract |          Function           | Visibility | Constant | Returns |  Modifiers  | Static Analysis | Test Coverage | Functional Analysis |
|----------|-----------------------------|------------|----------|---------|-------------|-----------------|---------------|---------------------|
| Managed  | Managed()                   | public     | false    |         |             | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Managed  | transferManagement(address) | public     | false    |         | managerOnly | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Managed  | acceptManagement()          | public     | false    |         |             | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[Owned.sol](/contracts/Owned.sol)

| Contract |          Function          | Visibility | Constant | Returns | Modifiers | Static Analysis | Test Coverage | Functional Analysis |
|----------|----------------------------|------------|----------|---------|-----------|-----------------|---------------|---------------------|
| Owned    | Owned()                    | public     | false    |         |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Owned    | transferOwnership(address) | public     | false    |         | ownerOnly | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Owned    | acceptOwnership()          | public     | false    |         |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[Pausable.sol](/contracts/Pausable.sol)

| Contract | Function  | Visibility | Constant | Returns |         Modifiers         | Static Analysis | Test Coverage | Functional Analysis |
|----------|-----------|------------|----------|---------|---------------------------|-----------------|---------------|---------------------|
| Pausable | pause()   | public     | false    | bool    | managerOnly,whenNotPaused | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Pausable | unpause() | public     | false    | bool    | managerOnly,whenPaused    | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[SmartToken.sol](/contracts/SmartToken.sol)

|  Contract  |               Function                | Visibility | Constant | Returns |           Modifiers            | Static Analysis | Test Coverage | Functional Analysis |
|------------|---------------------------------------|------------|----------|---------|--------------------------------|-----------------|---------------|---------------------|
| SmartToken | SmartToken(string,string,uint8)       | public     | false    |         | ERC20Token                     | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartToken | disableTransfers(bool)                | public     | false    |         | ownerOnly                      | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartToken | issue(address,uint256)                | public     | false    |         | ownerOnly,validAddress,notThis | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartToken | destroy(address,uint256)              | public     | false    |         |                                | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartToken | transfer(address,uint256)             | public     | false    | success | transfersAllowed               | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartToken | transferFrom(address,address,uint256) | public     | false    | success | transfersAllowed               | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[SmartTokenController.sol](/contracts/SmartTokenController.sol)

|       Contract       |                    Function                    | Visibility | Constant | Returns |  Modifiers   | Static Analysis | Test Coverage | Functional Analysis |
|----------------------|------------------------------------------------|------------|----------|---------|--------------|-----------------|---------------|---------------------|
| SmartTokenController | SmartTokenController(ISmartToken)              | public     | false    |         | validAddress | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartTokenController | transferTokenOwnership(address)                | public     | false    |         | ownerOnly    | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartTokenController | acceptTokenOwnership()                         | public     | false    |         | ownerOnly    | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartTokenController | disableTokenTransfers(bool)                    | public     | false    |         | ownerOnly    | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| SmartTokenController | withdrawFromToken(IERC20Token,address,uint256) | public     | false    |         | ownerOnly    | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[TokenHolder.sol](/contracts/TokenHolder.sol)

|  Contract   |                  Function                   | Visibility | Constant | Returns |                  Modifiers                  | Static Analysis | Test Coverage | Functional Analysis |
|-------------|---------------------------------------------|------------|----------|---------|---------------------------------------------|-----------------|---------------|---------------------|
| TokenHolder | TokenHolder()                               | public     | false    |         |                                             | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| TokenHolder | withdrawTokens(IERC20Token,address,uint256) | public     | false    |         | ownerOnly,validAddress,validAddress,notThis | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |


[Utils.sol](/contracts/Utils.sol)

| Contract |         Function         | Visibility | Constant | Returns | Modifiers | Static Analysis | Test Coverage | Functional Analysis |
|----------|--------------------------|------------|----------|---------|-----------|-----------------|---------------|---------------------|
| Utils    | Utils()                  | public     | false    |         |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Utils    | safeAdd(uint256,uint256) | internal   | false    | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Utils    | safeSub(uint256,uint256) | internal   | false    | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Utils    | safeMul(uint256,uint256) | internal   | false    | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

## ./contracts/helpers
[Migrations.sol](/contracts/helpers/Migrations.sol) 

|  Contract  |      Function      | Visibility | Constant | Returns | Modifiers  | Static Analysis | Test Coverage | Functional Analysis |
|------------|--------------------|------------|----------|---------|------------|-----------------|---------------|---------------------|
| Migrations | Migrations()       | public     | false    |         |            | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Migrations | setCompleted(uint) | public     | false    |         | restricted | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| Migrations | upgrade(address)   | public     | false    |         | restricted | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |

[TestCrowdsaleController.sol](/contracts/helpers/TestCrowdsaleController.sol) 

|        Contract         |                     Function                     | Visibility | Constant | Returns |      Modifiers      | Static Analysis | Test Coverage | Functional Analysis |
|-------------------------|--------------------------------------------------|------------|----------|---------|---------------------|-----------------|---------------|---------------------|
| TestCrowdsaleController | TestCrowdsaleController(uint256,address,uint256) | public     | false    |         | CrowdsaleController | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |


[TestERC20Token.sol](/contracts/helpers/TestERC20Token.sol) 

|    Contract    |               Function                | Visibility | Constant | Returns | Modifiers  | Static Analysis | Test Coverage | Functional Analysis |
|----------------|---------------------------------------|------------|----------|---------|------------|-----------------|---------------|---------------------|
| TestERC20Token | TestERC20Token(string,string,uint256) | public     | false    |         | ERC20Token | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |


[TestUtils.sol](/contracts/helpers/TestUtils.sol) 

| Contract  |           Function           | Visibility | Constant | Returns | Modifiers | Static Analysis | Test Coverage | Functional Analysis |
|-----------|------------------------------|------------|----------|---------|-----------|-----------------|---------------|---------------------|
| TestUtils | TestUtils()                  | public     | false    |         |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| TestUtils | testSafeAdd(uint256,uint256) | public     | true     | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| TestUtils | testSafeSub(uint256,uint256) | public     | true     | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
| TestUtils | testSafeMul(uint256,uint256) | public     | true     | uint256 |           | :white_check_mark:             | :white_check_mark:           | :white_check_mark:                 |
