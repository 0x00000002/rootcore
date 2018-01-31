# Findings

<!-- Here goes a list of issues -->

## Minor

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
  [#L196](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/9)
- **check result of send** - `Security`
  [#L243](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/10)
- **possible reentrancy vulnerabilities avoid state changes after transfer** - `Security`
  [#L244](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/11)
- **Spelling ?** - `Style`
  [#L133,247](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/12)
- **fallback function cannot go after private function** - `Best practice`
  [#L133,247](https://github.com/tikonoff/rootcore/blob/master/contracts/CrowdsaleController.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/13)
  - **event and function names must be different** - `Best practice`
  [#L44](https://github.com/tikonoff/rootcore/blob/master/contracts/ERC20Token.sol), [#L33,43](https://github.com/tikonoff/rootcore/blob/master/contracts/Pausable.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/14)
  - **state mutibility can be restricted to pure** - `safeSub()`
  [#L55,68](https://github.com/tikonoff/rootcore/blob/master/contracts/Utils.sol) ..[View on Github](https://github.com/tikonoff/rootcore/issues/15)
  
