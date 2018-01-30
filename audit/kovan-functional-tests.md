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


<br>

## Expected behaviour tests


### Rootcore (global owner)
 - Deploy contracts:
	 - [x] CrowdSaleController, PreSale (Start - Feb 10), beneficiary is "Beneficiary account" [0xc02bc9](https://kovan.etherscan.io/tx/0xc02bc95ada5b7f0fd47b287f26c6a2d97c04fe111c6dcd92215b8ce2ed64af9a) 
	 - [x] SmartToken from PreSale period [0xfA952eCDd36055A39b50eA8Ab46d11629994F9F8](https://kovan.etherscan.io/address/0xfa952ecdd36055a39b50ea8ab46d11629994f9f8#internaltx)
 	 - [x] CrowdSaleController, Sale (Start - Jan 30), beneficiary is "Beneficiary account" [0xd436be](https://kovan.etherscan.io/tx/0xd436be5c7d4c8230d2601da6252faa903751c57a8e5cd4a824f8fb3d2bbfb1f2) 
	 - [x] SmartToken from Sale period [0x2B334791160C5489219af9c043E6E4eea0B0590A](https://kovan.etherscan.io/address/0x2B334791160C5489219af9c043E6E4eea0B0590A)
	 - [x] CrowdSaleController, in the Future, beneficiary is "Main Account" [0xf7d0c6](https://kovan.etherscan.io/tx/0xf7d0c68527f3341de0aa9958b9ec9923d803e25a36d5c9de2d0ac61fbd7500ce)
   	 - [x] CrowdSaleController, in the past (sale has over), beneficiary is "Beneficiary account"  - expected ERROR [0x9902b9](https://kovan.etherscan.io/tx/0x9902b9a52cdb57ef1a94d091548af90417420eaba5b4dcaed69ec1247961e4ac) - <font color=coral> Contract deployed with Zero Start time and therefore it is possible to pass test "ContributeETH when Sale is over"</font>
   	 - [x] Mock Contract (see above) [0x4e28694D16d407c498986C4D8FA49b1AF80c151E](https://kovan.etherscan.io/address/0x4e28694D16d407c498986C4D8FA49b1AF80c151E) 
   	 	- Start time: Jan 30, 2018, 20:00 (UTC)
   	 	- PRESALE_MIN_CONTRIBUTION = 0.2 ether; 
 		- MAX_CONTRIBUTION = 0.4 ether; 
 
### Manager (as a role)
 - [x] Transfer management [0x72b77d](https://kovan.etherscan.io/tx/0x72b77d80264760a3a84775b49a33a6be57a3aaab99f5e3fe4a693989c4fbdaa5)
 - [x] Accept management [0x5eee6b](https://kovan.etherscan.io/tx/0x5eee6ba00896bebcdc943bfb12f2f0ca48b3d455ceaa5c3a784a9e29eda61a20)
 - [x] Add account to WhiteList [0x4ed0a2](https://kovan.etherscan.io/tx/0x4ed0a25319f20ce4c1d289158595e676a231aef69cbd5b1c81a340f9b7b986fb)
 - [x] Add to WhiteList already WhiteListed account [0x3b25d1](https://kovan.etherscan.io/tx/0x3b25d10613b43b694532ec84545806ff25605d585a1e0092e6b8614eef6c4b00)
 - [x] Remove account from WhiteList [0x4ee67f](https://kovan.etherscan.io/tx/0x4ee67fc4598e3d5614a5eaeb37568ab3a5a4375b7421c0a9c8bbea5c8b46f9aa)
 - [x] Remove from WhiteList account which is not listed there [0x149919](https://kovan.etherscan.io/tx/0x149919a5b8fc1bbdfc825c85a9431f3857a1776bd016fde876150033f96f5e4b)
 - [x] Pause Sale [0x91751f](https://kovan.etherscan.io/tx/0x91751f8edb026302164d4d29ac952642e746790c672cab249d440ca08aaeb8df)
 - [x] Unpause Sale [0x12f81d](https://kovan.etherscan.io/tx/0x12f81d578d3e76be43912cc9cdec958c2805372253c29057a7a0887cf1eb4bc3)
 - [x] ContributeFiat  [0x78a745](https://kovan.etherscan.io/tx/0x78a745c16b27e843e2cd173a37c4dca31649ae9b698bb85945aa4fb4b21fa2d4)
 
### Contract controller
 - [x] Transfer contracts Ownership [0x735f3b](https://kovan.etherscan.io/tx/0x735f3bfcfa336f83c986a4d213d1fa734f0d41eebce8ab3e33fc95aa1e9778cd)
 - [x] Accepting Ownership [0x0a18d5](https://kovan.etherscan.io/tx/0x0a18d57799aaa2e10ad6b7e507a07506ffa34c8592aa9fe2370ff611fee47619)
 - [x] Disable tokens transfer [0xf34fb4](https://kovan.etherscan.io/tx/0xf34fb413b5bf71093fba728fafa1e57bb0a0379a4bf5706ae2695024cadd7c87)
 - [x] Enable tokens transfer [0x59ef13](https://kovan.etherscan.io/tx/0x59ef13664829da513e52db860e6d1dccf0aaa2295bbd6ed41505efa5c1c9493f)


### Contributors
 - [x] ContributeETH [0xfd7923](https://kovan.etherscan.io/tx/0xfd7923dafd1c5dba33768217bff7aec493502b622d16d7da345ec801adb119d8)
 - [x] ContributeETH with amount exceeding MAX_CONTRIBUTION from Whitelisted account [0x3a93a4](https://kovan.etherscan.io/tx/0x3a93a43f8c231e905db71cfe77f7b02017b1858e33508da8c46b463da921dba4) 
 - [x] ContributeETH when Soft MaxCap is reached [0xac7dcc](https://kovan.etherscan.io/tx/0xac7dcce385445c8460b22ecdc2d8e9c8ce0330e53ba75eb81391032f6965812b)

### System events
- PreSale contract [0x4e28694D16d407c498986C4D8FA49b1AF80c151E](https://kovan.etherscan.io/address/0x4e28694D16d407c498986C4D8FA49b1AF80c151E)
	- [x] SoftCap has reached [0x4becf0](https://kovan.etherscan.io/tx/0x4becf0f5c64f24ecd5de05b7a04e89103caf253a19e71dd7b061f67f877edafc)
	- [x] HardCap has reached [0xb3f28f](https://kovan.etherscan.io/tx/0xb3f28f5825a0472cbc6006e039cb4c32c8b2cddb7318407b19f2c43b9caa59f3)

- Sale contract [0x40D4eC3ad4C8e4636088C4A08791922aeca9e4E4](https://kovan.etherscan.io/address/0x40D4eC3ad4C8e4636088C4A08791922aeca9e4E4) 
	- [x] SoftCap has reached [0x1a19a8](https://kovan.etherscan.io/tx/0x1a19a8bcd64dcd35bb76fed447d15412f37a5b49e7544cf99fb6d249e36bc584)
	- [x] HardCap has reached [0xd4a617](https://kovan.etherscan.io/tx/0xd4a617dca83acef27d9a563dc89bf818a0c88db3cd37ebf05fef22c816753a0a)

<br>

## Unexpected behaviour tests (reverted)


### Contributors
 - [x] ContributePreSale when Sale is paused [0x77bd64](https://kovan.etherscan.io/tx/0x77bd64cacb2af60f24013660929367bca7119040f6532a7edff759557e3e6559)
 - [x] ContributePreSale with less than MIN_CONTRIBUTION [0xecd6d3](https://kovan.etherscan.io/tx/0xecd6d3d4535120d50dd8424e1917501646d59c0ec0683675d5aa7454e1132b0a)
 - [x] ContributePreSale with gas price > 50 gWeis [0x52c4e7](https://kovan.etherscan.io/tx/0x52c4e7073164f8da91a691a17550c007c7095f475a980c81fbc94c8ed0b671b2)
 - [x] ContributePreSale later than NOW() [0xf56613](https://kovan.etherscan.io/tx/0xf566132a3df8cd8225f1708f631849ec530d38a1f1671f4643793d4edc6bb7d0)
 - [x] ContributePreSale from non-Whitelisted account [0xa451d7d](https://kovan.etherscan.io/tx/0xa451d7d9ebebebc4a407392b6b4e5633b7c5153bdb376d34b11876137364df23)
 - [x] ContributePreSale when Soft MaxCap is reached [0xd92758](https://kovan.etherscan.io/tx/0xd9275819b718844c653aa2692acd00da42a7efbcd2d7282854924eaf366f59f1) 
 - [x] ContributePreSale when Hard MaxCap is reached [0x8790a2](https://kovan.etherscan.io/tx/0x8790a2217ad8ddc4d2016bbf192e38bf283e704f00cad8e38da1126f9875e632)
 - -
 - [x] ContributeETH when Sale is paused [0xbf7862](https://kovan.etherscan.io/tx/0xbf7862710e125f55f89118adafa5dd5b9553016225a24783612e8d7746b1e486)
 - [x] ContributeETH with gas price > 50 gWeis [0xf8fd80](https://kovan.etherscan.io/tx/0xf8fd80f8684f3da44026be29cbe87caece23610e945fed50fef08fc5f3631e75)
 - [x] ContributeETH later than NOW() + 14 days [0xcf6bde](https://kovan.etherscan.io/tx/0xcf6bdee079dd2ff59c12f0c8e557decdd6102021eadde2d78aab9f454d9291d1) <font color=coral>"contract from the past" was deployed with zero start time. Probably that was a reason why this test didn't return an error. </font>
 - [x] ContributeETH earlier than NOW() [0xa451d7](https://kovan.etherscan.io/tx/0xa451d7d9ebebebc4a407392b6b4e5633b7c5153bdb376d34b11876137364df23)
 - [x] ContributeETH with amount exceeding MAX_CONTRIBUTION from non-Whitelisted account [0xfe18f1](https://kovan.etherscan.io/tx/0xfe18f1954bd791b12ee2b9bfb9ccb8fde8cf7469e5ab81f634af4550dbcbcfc4) 
 - [x] ContributeETH when Hard MaxCap is reached [0xc7dca1](https://kovan.etherscan.io/tx/0xc7dca1aec423f63e2c435998694aee39ee6993a503e67e4b93f61a2250d6bde0)


### Contracts Owner
 - [x] Transfer contract(s) Ownership from unexpected account [0x4af550](https://kovan.etherscan.io/tx/0x4af5503de3b647931a0517d5b1c83841c92a10c2f02a1858c3f604d8f795192b)
 - [x] Trying to accept Ownership from unexpected account [0x3c8b57](https://kovan.etherscan.io/tx/0x3c8b578f12473ed5091e52bcd3041ea04bf4e61a3da4b382886892ab277bcd45)


### Manager
 - [x] Transfer management from unexpected account [0x2bb6c9](https://kovan.etherscan.io/tx/0x2bb6c9bacc07b2d0a65f42e1c5cbaa32528a00488390c28fb15e93cea70cf1b0)
 - [x] Trying to accept management from unexpected account [0x3e2953](https://kovan.etherscan.io/tx/0x3e2953b6ac480b856036499cf88acf0de4401adf9a0f3ca601d710c39c4b9d46)
 - [x] Transfer contract(s) Ownership from unexpected account [0xfaeaed](https://kovan.etherscan.io/tx/0xfaeaede9bfdf89da95eb9371f8fa387d53f8ecc7c1e2e092960c66c2ef8d8408)
 - [x] Trying to accept Ownership from unexpected account [0x1cb72d](https://kovan.etherscan.io/tx/0x1cb72d35a38f1ff1aa8627737b9d1ed250139848078d18de822c99042c69f17c)
 - [x] Add invalid account to WhiteList - <font color=coral>Parity doesn't allow. Shall we write additional tests?</font>
 - [x] Add to WhiteList from unexpected account [0xfbf402](https://kovan.etherscan.io/tx/0xfbf402761ed4e1b6cb3d6efc18d0519cfdc0c4ecf83d4de675ae1474d2e770ed)
 - [x] Remove non-existing account from WhiteList [0x149919a5](https://kovan.etherscan.io/tx/0x149919a5b8fc1bbdfc825c85a9431f3857a1776bd016fde876150033f96f5e4b)
 - [x] Pause already paused Sale [0xf9aac8](https://kovan.etherscan.io/tx/0xf9aac81be04e2496a9b0111f4014e432dd07e70fbb8686cead2c0fdd61fbff87)
 - [x] Unpause on-going Sale [0x6f1265](https://kovan.etherscan.io/tx/0x6f126548875e199ab2acc574aa3b6f39b5d8ae36e7ebb9c00746a2306d19f949)
 - [x] ContributeFiat to Beneficiary account [0x84f42e](https://kovan.etherscan.io/tx/0x84f42ee51554933ced0dd572a77278de59d5b282424cbdd3392639a6e80c4795)
 - [x] ContributeFiat when Sale is paused [0x57deff](https://kovan.etherscan.io/tx/0x57deff4d6d047cf11e1dd09412137bdf120e5f61f72a48a2ac57c0d801e57d38)
 - [x] ContributeFiat before Sale or after Sale is finished [0xf29e5f8](https://kovan.etherscan.io/tx/0xf29e5f82c2d395209e02684079594b88631afc974f55a4477d411065b45f8a47)

