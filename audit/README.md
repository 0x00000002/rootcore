# Rootcore crowd Sale Audit Report

## Preamble
This audit report was undertaken by BlockchainLabs.nz for the purpose of providing feedback to Rootcore. It has subsequently been shared publicly without any express or implied warranty.

Solidity contracts were sourced from the public Github repo [lucywe/rootcore-crowdsale](https://github.com/lucywe/rootcore-crowdsale) prior to commit [9e118591b6f61d738effcb0a486c87bdad757b29](https://github.com/lucywe/rootcore-crowdsale/commit/9e118591b6f61d738effcb0a486c87bdad757b29) - we would encourage all community members and token holders to make their own assessment of the contracts.

## Scope
All Solidity code contained in [/contracts](https://github.com/lucywe/rootcore-crowdsale/tree/master/solidity/contracts) was considered in scope along with the tests contained in [/tests](https://github.com/lucywe/rootcore-crowdsale/tree/master/solidity/test) as a basis for static and dynamic analysis.

## Focus Areas
The audit report is focused on the following key areas - though this is not an exhaustive list.
### Correctness
- No correctness defects uncovered during static analysis?
- No implemented contract violations uncovered during execution?
- No other generic incorrect behaviour detected during execution?
- Adherence to adopted standards such as ERC20?
### Testability
- Test coverage across all functions and events?
- Test cases for both expected behaviour and failure modes?
- Settings for easy testing of a range of parameters?
- No reliance on nested callback functions or console logs?
- Avoidance of test scenarios calling other test scenarios?
### Security
- No presence of known security weaknesses?
- No funds at risk of malicious attempts to withdraw/transfer?
- No funds at risk of control fraud?
- Prevention of Integer Overflow or Underflow?
### Best Practice
- Explicit labeling for the visibility of functions and state variables?
- Proper management of gas limits and nested execution?
- Latest version of the Solidity compiler?

## Focus Areas
The audit report is focused on the following key areas - though this is not an exhaustive list.
### Correctness
- No correctness defects uncovered during static analysis?
- No implemented contract violations uncovered during execution?
- No other generic incorrect behaviour detected during execution?
- Adherence to adopted standards such as ERC20?
### Testability
- Test coverage across all functions and events?
- Test cases for both expected behaviour and failure modes?
- Settings for easy testing of a range of parameters?
- No reliance on nested callback functions or console logs?
- Avoidance of test scenarios calling other test scenarios?
### Security
- No presence of known security weaknesses?
- No funds at risk of malicious attempts to withdraw/transfer?
- No funds at risk of control fraud?
- Prevention of Integer Overflow or Underflow?
### Best Practice
- Explicit labeling for the visibility of functions and state variables?
- Proper management of gas limits and nested execution?
- Latest version of the Solidity compiler?

## Classification
### Defect Severity
- Minor - A defect that does not have a material impact on the contract execution and is likely to be subjective.
- Moderate - A defect that could impact the desired outcome of the contract execution in a specific scenario.
- Major - A defect that impacts the desired outcome of the contract execution or introduces a weakness that may be exploited.
- Critical - A defect that presents a significant security vulnerability or failure of the contract across a range of scenarios.
## Findings

<!-- Here goes a list of issues -->
### Minor
### Minor
- **var's should be in mixedCase** - `Best practice` Examples: [#L5, 20](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/Migrations.sol) .. [View on Github](https://github.com/tikonoff/rootcore/issues/1)
- **should use "" for stings and import** - `Best practice` Examples: [#L2](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestCrowdsaleController.sol),[#L2](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestUtils.sol),[#L2,3](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/ISmartToken.sol),[#L2,3](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/ITokenHolder.sol),[#2-7](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol),[#L2,3,9,11](https://github.com/tikonoff/rootcore/blob/master/contracts/ERC20Token.sol),[#L2](https://github.com/tikonoff/rootcore/blob/master/contracts/Owned.sol),[#L2](https://github.com/tikonoff/rootcore/blob/master/contracts/Pausable.sol),[#L2-5,13](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartToken.sol),[#L2,3](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartTokenController.sol),[#L2-5](https://github.com/tikonoff/rootcore/blob/master/contracts/TokenHolder.sol).. [View on Github](https://github.com/tikonoff/rootcore/issues/2)
- **visibility is not specified default to public** - `Best practice/Security` Examples: [#L12](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/Migrations.sol),[#L57](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol),[#L27](https://github.com/tikonoff/rootcore/blob/master/contracts/ERC20Token.sol),[#L15](https://github.com/tikonoff/rootcore/blob/master/contracts/Managed.sol),[#L16](https://github.com/tikonoff/rootcore/blob/master/contracts/Owned.sol),[#L31](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartToken.sol),[#L27](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartTokenController.sol),[#L18](https://github.com/tikonoff/rootcore/blob/master/contracts/TokenHolder.sol),[#L10](https://github.com/tikonoff/rootcore/blob/master/contracts/Utils.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/3)
- **restricted explicitly mark visibility in function** - `Best practice/Security` Examples: [#L16](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/Migrations.sol), [#L11](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestCrowdsaleController.sol), [#L9](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestERC20Token.sol), [#L58,253](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol), [#L34,43](https://github.com/tikonoff/rootcore/blob/master/contracts/Pausable.sol), [#L32](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartToken.sol), [#L28](https://github.com/tikonoff/rootcore/blob/master/contracts/SmartTokenController.sol) ..[View on GitHub](https://github.com/tikonoff/rootcore/issues/4)
- **function shadows an existing declaration** - `Best practice` Examples: [#L8-11](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IERC20Token.sol), [#L8](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IOwned.sol) ..[View on GitHub](https://github.com/tikonoff/rootcore/issues/5)
- **state mutibility can be restricted to pure** - ` v` Examples:
[#L8-13](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IERC20Token.sol), [#L8](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IOwned.sol) ..[View on GitHub](https://github.com/tikonoff/rootcore/issues/6)
- **avoid time based decisions** - `Security` Examples:
[#L76,82,89](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/7)
- **function order is incorrect, public function cannot
  go after private function** - `Best practice`  
[#L145,161,176,193,211](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/8)
- **comma must be separated from next element
  by space** - `Best practice`
  [#L196,215](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/9)
- **check result of send** - `Security`
  [#L243](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/10)
- **Spelling ?** - `Style`
  [#L133,247](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/12)
- **fallback function cannot go after private function** - `Best practice`
  [#L133,247](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/13)
- **event and function names must be different** - `Best practice`
  [#L44](https://github.com/tikonoff/rootcore/blob/master/contracts/ERC20Token.sol), [#L33,43](https://github.com/tikonoff/rootcore/blob/master/contracts/Pausable.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/14)
- **state mutibility can be restricted to pure** - `Best practice`
  [#L55,68](https://github.com/tikonoff/rootcore/blob/master/contracts/Utils.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/15)
- **use of constant is deprecated** - `Best practice`
  [#L21-26,31,32,35-37,125](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol), [#L12,16,20](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestUtils.sol), [#L8-13](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IERC20Token.sol), [#L8](https://github.com/tikonoff/rootcore/blob/master/contracts/interfaces/IOwned.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/16),
- **Version of pragma is not latest** - `Best practice`
  ..[View on Github](https://github.com/tikonoff/rootcore/issues/18),
- **modifier greaterThanZero not used** - `Best practice`
  [#L14](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestUtils.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/22),
- **expression-indent** - `Best practice`
  [#L114](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/22)
  
### Moderate
- None found
-
### Major
- **possible reentrancy vulnerabilities avoid state changes after transfer** - `Security`
  [#L244](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/11)

### Critical
- None found


## Dynamic Analysis
Coverage: 94.69%
Coverage screenshot

<img alt="coverage screenshot" src="http://www.brucelihunting4ajob.info/img/tmp/Coverage_screenshot.png">

build address : [Link](https://travis-ci.org/ryu9827/rootcore/builds/334233219)

## Gas Consumption

Upon finalization of the contracts to be used by Rootcore, the contracts were assessed on the gas usage of each function to ensure there aren't any unforeseen issues with exceeding the block size GasLimit. A detailed report can be found in [Gas_Consumption.md](https://github.com/tikonoff/rootcore/blob/master/audit/Gas_consumption_report.md).


## Functional tests

Functions were tested according the business scenario and available here [./kovan-functional-tests.md](https://github.com/tikonoff/rootcore/blob/master/audit/kovan-functional-tests.md)


## Conclusion
Of the issues we have raised all of them are minor. This crowdsale has a low risk of ethereum being hacked or stolen.
