# Rootcore crowd Sale Audit Report

## Preamble
This audit report was undertaken by BlockchainLabs.nz for the purpose of providing feedback to Mothership. It has subsequently been shared publicly without any express or implied warranty.

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
- **use of constant is deprecated** - `Best practice` [rootcore/blob/master/contracts/CrowdsaleController.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) Line 21-26,31,32,35-37,125 ``` uint256 public constant DURATION = 14 days; uint256 public constant TOKEN_PRICE_N = 1; uint256 public constant TOKEN_PRICE_D = 1000; uint256 public constant MAX_GAS_PRICE = 50000000000 wei; uint256 public constant MAX_CONTRIBUTION = 40 ether; uint256 public constant SOFTCAP_GRACE_DURATION = 10;//86400; uint256 public TOTAL_ETHER_CAP ... [View on GitHub](https://github.com/tikonoff/rootcore/issues/16)
- **state mutibility can be restricted to pure** -  [rootcore/blob/master/contracts/Utils.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/Utils.sol) Line 55,68 ``` function safeSub(uint256 _x, uint256 _y) internal returns (uint256) { assert(_x >= _y); return _x - _y; } function safeMul(uint256 _x, uint256 _y) internal returns (uint256) { uint256 z = _x * _y; assert(_x == 0 || z / _x == _y); return z; } ```  [View on GitHub](https://github.com/tikonoff/rootcore/issues/15)
- **event and function names must be different** - `Best practice` [rootcore/blob/master/contracts/ERC20Token.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/ERC20Token.sol) Line 44 ``` function transfer(address _to, uint256 _value) public validAddress(_to) returns (bool success) { balanceOf[msg.sender] = safeSub(balanceOf[msg.sender], _value); balanceOf[_to] = safeAdd(balanceOf[_to], _value); Transfer(msg.sender, _to, _value); return true; } ``` [rootcore/blob/master/contracts/Pausable.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/Pausable.sol) ... [View on GitHub](https://github.com/tikonoff/rootcore/issues/14)
- **Possible spelling error** -  [rootcore/blob/master/contracts/CrowdsaleController.so](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) Line 133,247 ``` function upadateContributorsCount(uint256 _tokenAmount) private { if (token.balanceOf(msg.sender) == _tokenAmount ) numOfContributors++; } upadateContributorsCount(tokenAmount); ```  [View on GitHub](https://github.com/tikonoff/rootcore/issues/12)
- **comma must be separated from next element by space** - `Best practice` [rootcore/blob/master/contracts/CrowdsaleController.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) Line 196,215 ``` between(safeSub(startTime,PRESALE_DURATION), startTime) between(safeSub(startTime,PRESALE_DURATION), safeAdd(startTime, DURATION)) ```  [View on GitHub](https://github.com/tikonoff/rootcore/issues/9)
- **visibility is not specified, default to public** - `Security`, Best practice` [rootcore/blob/master/contracts/helpers/Migrations.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/Migrations.sol) Line 12 ``` function Migrations() { owner = msg.sender; } ``` [rootcore/blob/master/contracts/CrowdsaleController.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) Line 57 ``` function CrowdsaleController(uint256 _startTime, address _beneficiary) SmartTokenController(new SmartToken(TOKEN_NAME, TOKEN_SYM, TOKEN_DEC)) validAddress(_beneficiary) ... [View on GitHub](https://github.com/tikonoff/rootcore/issues/3)
- **should use "" for strings and import** - `Best practice` [rootcore/blob/master/contracts/helpers/TestCrowdsaleController.sol](https://github.com/tikonoff/rootcore/blob/master/contracts/helpers/TestCrowdsaleController.sol) Line 5 import '../CrowdsaleController.sol';  [View on GitHub](https://github.com/tikonoff/rootcore/issues/2)
- **var's should be in mixedCase** - `Best practice` [rootcore/blob/master/contracts/helpers/Migrations.sol](https://github.com/tikonoff/rootcore/blob/gabrieldojo/contracts/helpers/Migrations.sol) Line 5 uint public last_completed_migration;  [View on GitHub](https://github.com/tikonoff/rootcore/issues/1)
### Moderate
- None found
### Major
- **possible reentrancy vulnerabilities avoid state changes after transfer** - `Security`, Best practice` [rootcore/blob/master/contracts/CrowdsaleController.so](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) LIne 244 ``` totalEtherContributed = safeAdd(totalEtherContributed, msg.value); // update the total contribution amount ```  [View on GitHub](https://github.com/tikonoff/rootcore/issues/11)
### Critical
- None found

## Dynamic Analysis 
Coverage: 94.69%
Coverage screenshot

<img alt="coverage screenshot" src="http://www.brucelihunting4ajob.info/img/tmp/Coverage_screenshot.png">

build address : [Link](https://travis-ci.org/ryu9827/rootcore/builds/334233219)
## Conclusion

Overall we have been fully satisfied with the resulting contracts following the audit feedback period. We took part in carefully reviewing all source code provided, including deployment testing.

We are pleased to report that no potential vulnerabilities were uncovered during the audit. That the token complies with the recently finalised ERC20 Token Standards. The code has excellent testability and the developers have followed common best practices.

Of the issues we have raised all of them are minor. This crowdsale has a low risk of ethereum being hacked or stolen. 
