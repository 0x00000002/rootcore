# CLIENT Audit Report
## Preamble
This audit report was undertaken by BlockchainLabs.nz for the purpose of providing feedback to Rootcore. It has subsequently been shared publicly without any express or implied warranty.
Solidity contracts were sourced from the public Github repo [rootcore-crowdsale](https://github.com/lucywe/rootcore-crowdsale) prior to commit [9e11859](https://github.com/lucywe/rootcore-crowdsale/commit/9e118591b6f61d738effcb0a486c87bdad757b29) - we would encourage all community members and token holders to make their own assessment of the contracts.
## Scope
All Solidity code contained in [/contracts](CONTRACT-URL) was considered in scope along with the tests contained in [/tests](CONTRACT-TESTS-URL) as a basis for static and dynamic analysis.
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
#### Stylistic inadequacies
- **var should be in mixedCase** - `last_completed_migration`   [style guide](http://solidity.readthedocs.io/en/develop/style-guide.html)
migrations.sol lines 5, 20
- **should use ""** - `import '../CrowdsaleController.sol'`    [style guide](http://solidity.readthedocs.io/en/develop/style-guide.html)
TestCrowdsaleController.sol line 2, TestUtils.sol line 2 ISmartToken.sol lines 2,3
ITokenHolder.sol lines 2,3 CrowdsaleController.sol lines 2,3,4,5,6,7
ERC20Token.sol lines 2,3,9,11 Owned.sol line 2 Pausable.sol line 2
SmartToken.sol lines 2,3,4,5,13 SmartTokenController.sol lines 2,3
TokenHolder.sol lines 2,3,4,5
- **visibility is not specified default to public** - `Migrations()`          [github](https://github.com/ethereum/solidity/issues/2608)
migrations.sol line 12 CrowdsaleController.sol line 57 ERC20Token.sol line 27
Managed.sol line 15 Owned.sol line 16 SmartToken.sol lines 31 SmartTokenController.sol line 27 TokenHolder.sol line 18 Utils.sol line 10
- **restricted explicitly mark visibility in function** - `Migrations()`          [github](https://github.com/ethereum/solidity/issues/2608)
migrations.sol line 16, TestCrowdsaleController.sol line 11, TestERC20Token.sol line 9
CrowdsaleController.sol line 58,253 Pausable.sol line 34,43 SmartToken.sol lines 32
SmartTokenController.sol line 28
- **function shadows an existing declaration** - `name()`          [github](https://github.com/ethereum/solidity/issues/2608)
IERC20Token.sol lines 8,9,10,11 IOwned.sol line 8
- **state mutibility can be restricted to pure** - `name()`          [stackexchange](https://ethereum.stackexchange.com/questions/27181/remix-warnings-state-mutability-and-public-visibility)
IERC20Token.sol lines 8,9,10,11,12,13 IOwned.sol line 8
- **avoid time based decisions** - `now`          [stackexchange](https://ethereum.stackexchange.com/questions/31993/is-it-secure-to-rely-on-now-or-block-timestamp-for-the-deadline-of-an-ico)
CrowdsaleController.sol lines 76,82,89
- **function order is incorrect, public function cannot
  go after private function** - `addToWhitelist()`          [github](https://github.com/ethereum/solidity/issues/2608)
CrowdsaleController.sol lines 145,161,176,193,211
- **comma must be separated from next element
  by space** - `(startTime,PRESALE_DURATION)`          [style guide](http://solidity.readthedocs.io/en/develop/style-guide.html)
  CrowdsaleController.sol line 196
  - **check result of send** - `send`          [solidity docs](http://solidity.readthedocs.io/en/develop/common-patterns.html#withdrawal-pattern)
  CrowdsaleController.sol line 243
  - **possible reentrancy vulnerabilities avoid state changes after transfer** - `totalEtherContributed`          [github](https://github.com/ethereum/solidity/issues/2608)
  CrowdsaleController.sol line 244
  - **Spelling ?** - `upadateContributorsCount`          [github](https://github.com/ethereum/solidity/issues/2608)
  CrowdsaleController.sol line 247
  - **fallback function cannot go after private function** - `function()`          [github](https://github.com/ethereum/solidity/issues/2608)
  CrowdsaleController.sol line 253
  - **event and function names must be different** - `transfer()`          [github](https://github.com/ethereum/solidity/issues/2608)
  ERC20Token.sol line 44 Pausable.sol line 34,43
  - **state mutibility can be restricted to pure** - `safeSub()`          [stackexchange](https://ethereum.stackexchange.com/questions/27181/remix-warnings-state-mutability-and-public-visibility)
  Utils.sol lines 55,68

  - [ ] Not Fixed
### Moderate
- None found
### Major
  - None found
### Critical
- None found
## Testing
To further satisfy test coverage, both `CLIENTToken.sol` and `CLIENTTokenSale.sol` were deployed onto the Kovan Test Network to achieve simulation of a mock sale. This can be viewed in the [Kovan_Tests.md](https://github.com/CLIENT/blob/master/Kovan_Tests.md) checklist.
## Conclusion
Overall we have been fully satisfied with the resulting contracts following the audit feedback period. We took part in carefully reviewing all source code provided, including deployment testing.
We are pleased to report that no potential vulnerabilities were uncovered during the audit. That the token complies with the recently finalised ERC20 Token Standards. The code has excellent testability and the developers have followed common best practices.
Of the issues we have raised all of them are minor. This crowdsale has a low risk of ethereum being hacked or stolen.
