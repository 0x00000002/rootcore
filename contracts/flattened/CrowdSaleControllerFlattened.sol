pragma solidity ^0.4.15;

// File: contracts/Managed.sol

/*
    Provides support and utilities for contract management
*/
contract Managed {
    address public manager;
    address public newManager;

    event ManagerUpdate(address _prevManager, address _newManager);

    /**
        @dev constructor
    */
    function Managed() {
        manager = msg.sender;
    }

    // allows execution by the manager only
    modifier managerOnly {
        assert(msg.sender == manager);
        _;
    }

    /**
        @dev allows transferring the contract management
        the new manager still needs to accept the transfer
        can only be called by the contract manager

        @param _newManager    new contract manager
    */
    function transferManagement(address _newManager) public managerOnly {
        require(_newManager != manager);
        newManager = _newManager;
    }

    /**
        @dev used by a new manager to accept a management transfer
    */
    function acceptManagement() public {
        require(msg.sender == newManager);
        ManagerUpdate(manager, newManager);
        manager = newManager;
        newManager = 0x0;
    }
}

// File: contracts/Pausable.sol

/**
 * @title Pausable
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract Pausable is Managed {
  event Pause();
  event Unpause();

  bool public paused = false;


  /**
   * @dev modifier to allow actions only when the contract IS paused
   */
  modifier whenNotPaused() {
    require(!paused);
    _;
  }

  /**
   * @dev modifier to allow actions only when the contract IS NOT paused
   */
  modifier whenPaused {
    require(paused);
    _;
  }

  /**
   * @dev called by the Manager to pause, triggers stopped state
   */
  function pause() managerOnly whenNotPaused returns (bool) {
    paused = true;
    Pause();
    return true;
  }

  /**
   * @dev called by the Manager to unpause, returns to normal state
   */
  function unpause() managerOnly whenPaused returns (bool) {
    paused = false;
    Unpause();
    return true;
  }
}

// File: contracts/Utils.sol

/*
    Utilities & Common Modifiers
*/
contract Utils {
    /**
        constructor
    */
    function Utils() {
    }

    // verifies that an amount is greater than zero
    modifier greaterThanZero(uint256 _amount) {
        require(_amount > 0);
        _;
    }

    // validates an address - currently only checks that it isn't null
    modifier validAddress(address _address) {
        require(_address != 0x0);
        _;
    }

    // verifies that the address is different than this contract address
    modifier notThis(address _address) {
        require(_address != address(this));
        _;
    }

    // Overflow protected math functions

    /**
        @dev returns the sum of _x and _y, asserts if the calculation overflows

        @param _x   value 1
        @param _y   value 2

        @return sum
    */
    function safeAdd(uint256 _x, uint256 _y) internal returns (uint256) {
        uint256 z = _x + _y;
        assert(z >= _x);
        return z;
    }

    /**
        @dev returns the difference of _x minus _y, asserts if the subtraction results in a negative number

        @param _x   minuend
        @param _y   subtrahend

        @return difference
    */
    function safeSub(uint256 _x, uint256 _y) internal returns (uint256) {
        assert(_x >= _y);
        return _x - _y;
    }

    /**
        @dev returns the product of multiplying _x by _y, asserts if the calculation overflows

        @param _x   factor 1
        @param _y   factor 2

        @return product
    */
    function safeMul(uint256 _x, uint256 _y) internal returns (uint256) {
        uint256 z = _x * _y;
        assert(_x == 0 || z / _x == _y);
        return z;
    }
}

// File: contracts/interfaces/IERC20Token.sol

/*
    ERC20 Standard Token interface
*/
contract IERC20Token {
    // these functions aren't abstract since the compiler emits automatically generated getter functions as external
    function name() public constant returns (string name) { name; }
    function symbol() public constant returns (string symbol) { symbol; }
    function decimals() public constant returns (uint8 decimals) { decimals; }
    function totalSupply() public constant returns (uint256 totalSupply) { totalSupply; }
    function balanceOf(address _owner) public constant returns (uint256 balance) { _owner; balance; }
    function allowance(address _owner, address _spender) public constant returns (uint256 remaining) { _owner; _spender; remaining; }

    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
}

// File: contracts/ERC20Token.sol

/**
    ERC20 Standard Token implementation
*/
contract ERC20Token is IERC20Token, Utils {
    string public standard = 'Token 0.1';
    string public name = '';
    string public symbol = '';
    uint8 public decimals = 0;
    uint256 public totalSupply = 0;
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    /**
        @dev constructor

        @param _name        token name
        @param _symbol      token symbol
        @param _decimals    decimal points, for display purposes
    */
    function ERC20Token(string _name, string _symbol, uint8 _decimals) {
        require(bytes(_name).length > 0 && bytes(_symbol).length > 0); // validate input

        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }

    /**
        @dev send coins
        throws on any error rather then return a false flag to minimize user errors

        @param _to      target address
        @param _value   transfer amount

        @return true if the transfer was successful, false if it wasn't
    */
    function transfer(address _to, uint256 _value)
        public
        validAddress(_to)
        returns (bool success)
    {
        balanceOf[msg.sender] = safeSub(balanceOf[msg.sender], _value);
        balanceOf[_to] = safeAdd(balanceOf[_to], _value);
        Transfer(msg.sender, _to, _value);
        return true;
    }

    /**
        @dev an account/contract attempts to get the coins
        throws on any error rather then return a false flag to minimize user errors

        @param _from    source address
        @param _to      target address
        @param _value   transfer amount

        @return true if the transfer was successful, false if it wasn't
    */
    function transferFrom(address _from, address _to, uint256 _value)
        public
        validAddress(_from)
        validAddress(_to)
        returns (bool success)
    {
        allowance[_from][msg.sender] = safeSub(allowance[_from][msg.sender], _value);
        balanceOf[_from] = safeSub(balanceOf[_from], _value);
        balanceOf[_to] = safeAdd(balanceOf[_to], _value);
        Transfer(_from, _to, _value);
        return true;
    }

    /**
        @dev allow another account/contract to spend some tokens on your behalf
        throws on any error rather then return a false flag to minimize user errors

        also, to minimize the risk of the approve/transferFrom attack vector
        (see https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/), approve has to be called twice
        in 2 separate transactions - once to change the allowance to 0 and secondly to change it to the new allowance value

        @param _spender approved address
        @param _value   allowance amount

        @return true if the approval was successful, false if it wasn't
    */
    function approve(address _spender, uint256 _value)
        public
        validAddress(_spender)
        returns (bool success)
    {
        // if the allowance isn't 0, it can only be updated to 0 to prevent an allowance change immediately after withdrawal
        require(_value == 0 || allowance[msg.sender][_spender] == 0);

        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}

// File: contracts/interfaces/IOwned.sol

/*
    Owned contract interface
*/
contract IOwned {
    // this function isn't abstract since the compiler emits automatically generated getter functions as external
    function owner() public constant returns (address owner) { owner; }

    function transferOwnership(address _newOwner) public;
    function acceptOwnership() public;
}

// File: contracts/Owned.sol

/*
    Provides support and utilities for contract ownership
*/
contract Owned is IOwned {
    address public owner;
    address public newOwner;

    event OwnerUpdate(address _prevOwner, address _newOwner);

    /**
        @dev constructor
    */
    function Owned() {
        owner = msg.sender;
    }

    // allows execution by the owner only
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }

    /**
        @dev allows transferring the contract ownership
        the new owner still needs to accept the transfer
        can only be called by the contract owner

        @param _newOwner    new contract owner
    */
    function transferOwnership(address _newOwner) public ownerOnly {
        require(_newOwner != owner);
        newOwner = _newOwner;
    }

    /**
        @dev used by a new owner to accept an ownership transfer
    */
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnerUpdate(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }
}

// File: contracts/interfaces/ITokenHolder.sol

/*
    Token Holder interface
*/
contract ITokenHolder is IOwned {
    function withdrawTokens(IERC20Token _token, address _to, uint256 _amount) public;
}

// File: contracts/TokenHolder.sol

/*
    We consider every contract to be a 'token holder' since it's currently not possible
    for a contract to deny receiving tokens.

    The TokenHolder's contract sole purpose is to provide a safety mechanism that allows
    the owner to send tokens that were sent to the contract by mistake back to their sender.
*/
contract TokenHolder is ITokenHolder, Owned, Utils {
    /**
        @dev constructor
    */
    function TokenHolder() {
    }

    /**
        @dev withdraws tokens held by the contract and sends them to an account
        can only be called by the owner

        @param _token   ERC20 token contract address
        @param _to      account to receive the new amount
        @param _amount  amount to withdraw
    */
    function withdrawTokens(IERC20Token _token, address _to, uint256 _amount)
        public
        ownerOnly
        validAddress(_token)
        validAddress(_to)
        notThis(_to)
    {
        assert(_token.transfer(_to, _amount));
    }
}

// File: contracts/interfaces/ISmartToken.sol

/*
    Smart Token interface
*/
contract ISmartToken is ITokenHolder, IERC20Token {
    function disableTransfers(bool _disable) public;
    function issue(address _to, uint256 _amount) public;
    function destroy(address _from, uint256 _amount) public;
}

// File: contracts/SmartToken.sol

/*
    Smart Token v0.3

    'Owned' is specified here for readability reasons
*/
contract SmartToken is ISmartToken, Owned, ERC20Token, TokenHolder {
    string public version = '0.3';

    bool public transfersEnabled = true;    // true if transfer/transferFrom are enabled, false if not

    // triggered when a smart token is deployed - the _token address is defined for forward compatibility, in case we want to trigger the event from a factory
    event NewSmartToken(address _token);
    // triggered when the total supply is increased
    event Issuance(uint256 _amount);
    // triggered when the total supply is decreased
    event Destruction(uint256 _amount);

    /**
        @dev constructor

        @param _name       token name
        @param _symbol     token short symbol, minimum 1 character
        @param _decimals   for display purposes only
    */
    function SmartToken(string _name, string _symbol, uint8 _decimals)
        ERC20Token(_name, _symbol, _decimals)
    {
        NewSmartToken(address(this));
    }

    // allows execution only when transfers aren't disabled
    modifier transfersAllowed {
        assert(transfersEnabled);
        _;
    }

    /**
        @dev disables/enables transfers
        can only be called by the contract owner

        @param _disable    true to disable transfers, false to enable them
    */
    function disableTransfers(bool _disable) public ownerOnly {
        transfersEnabled = !_disable;
    }

    /**
        @dev increases the token supply and sends the new tokens to an account
        can only be called by the contract owner

        @param _to         account to receive the new amount
        @param _amount     amount to increase the supply by
    */
    function issue(address _to, uint256 _amount)
        public
        ownerOnly
        validAddress(_to)
        notThis(_to)
    {
        totalSupply = safeAdd(totalSupply, _amount);
        balanceOf[_to] = safeAdd(balanceOf[_to], _amount);

        Issuance(_amount);
        Transfer(this, _to, _amount);
    }

    /**
        @dev removes tokens from an account and decreases the token supply
        can be called by the contract owner to destroy tokens from any account or by any holder to destroy tokens from his/her own account

        @param _from       account to remove the amount from
        @param _amount     amount to decrease the supply by
    */
    function destroy(address _from, uint256 _amount) public {
        require(msg.sender == _from || msg.sender == owner); // validate input

        balanceOf[_from] = safeSub(balanceOf[_from], _amount);
        totalSupply = safeSub(totalSupply, _amount);

        Transfer(_from, this, _amount);
        Destruction(_amount);
    }

    // ERC20 standard method overrides with some extra functionality

    /**
        @dev send coins
        throws on any error rather then return a false flag to minimize user errors
        in addition to the standard checks, the function throws if transfers are disabled

        @param _to      target address
        @param _value   transfer amount

        @return true if the transfer was successful, false if it wasn't
    */
    function transfer(address _to, uint256 _value) public transfersAllowed returns (bool success) {
        assert(super.transfer(_to, _value));
        return true;
    }

    /**
        @dev an account/contract attempts to get the coins
        throws on any error rather then return a false flag to minimize user errors
        in addition to the standard checks, the function throws if transfers are disabled

        @param _from    source address
        @param _to      target address
        @param _value   transfer amount

        @return true if the transfer was successful, false if it wasn't
    */
    function transferFrom(address _from, address _to, uint256 _value) public transfersAllowed returns (bool success) {
        assert(super.transferFrom(_from, _to, _value));
        return true;
    }
}

// File: contracts/SmartTokenController.sol

/*
    The smart token controller is an upgradable part of the smart token that allows
    more functionality as well as fixes for bugs/exploits.
    Once it accepts ownership of the token, it becomes the token's sole controller
    that can execute any of its functions.

    To upgrade the controller, ownership must be transferred to a new controller, along with
    any relevant data.

    The smart token must be set on construction and cannot be changed afterwards.
    Wrappers are provided (as opposed to a single 'execute' function) for each of the token's functions, for easier access.

    Note that the controller can transfer token ownership to a new controller that
    doesn't allow executing any function on the token, for a trustless solution.
    Doing that will also remove the owner's ability to upgrade the controller.
*/
contract SmartTokenController is TokenHolder {
    ISmartToken public token;   // smart token

    /**
        @dev constructor
    */
    function SmartTokenController(ISmartToken _token)
        validAddress(_token)
    {
        token = _token;
    }

    // ensures that the controller is the token's owner
    modifier active() {
        assert(token.owner() == address(this));
        _;
    }

    // ensures that the controller is not the token's owner
    modifier inactive() {
        assert(token.owner() != address(this));
        _;
    }

    /**
        @dev allows transferring the token ownership
        the new owner still need to accept the transfer
        can only be called by the contract owner

        @param _newOwner    new token owner
    */
    function transferTokenOwnership(address _newOwner) public ownerOnly {
        token.transferOwnership(_newOwner);
    }

    /**
        @dev used by a new owner to accept a token ownership transfer
        can only be called by the contract owner
    */
    function acceptTokenOwnership() public ownerOnly {
        token.acceptOwnership();
    }

    /**
        @dev disables/enables token transfers
        can only be called by the contract owner

        @param _disable    true to disable transfers, false to enable them
    */
    function disableTokenTransfers(bool _disable) public ownerOnly {
        token.disableTransfers(_disable);
    }

    /**
        @dev withdraws tokens held by the token and sends them to an account
        can only be called by the owner

        @param _token   ERC20 token contract address
        @param _to      account to receive the new amount
        @param _amount  amount to withdraw
    */
    function withdrawFromToken(IERC20Token _token, address _to, uint256 _amount) public ownerOnly {
        token.withdrawTokens(_token, _to, _amount);
    }
}

// File: contracts/CrowdsaleController.sol

/*

    The CrowdsaleController allows contributing ether in exchange for Rootcoin tokens
    The price remains fixed for the entire duration of the crowdsale
    Presale contributes are allocated (manually) with additional 20% tokens from the beneficiary tokens.
    Presale contribute mst use pre-verified addresses. (KYC)
*/
contract CrowdsaleController is SmartTokenController, Managed, Pausable {

    

    uint256 public constant DURATION = 14 days;                 // crowdsale duration  
    uint256 public constant TOKEN_PRICE_N = 1;                  // initial price in wei (numerator)
    uint256 public constant TOKEN_PRICE_D = 1000;               // initial price in wei (denominator) (1000 wei equals 1 token)
    uint256 public constant MAX_GAS_PRICE = 50000000000 wei;    // maximum gas price for contribution transactions
    uint256 public constant MAX_CONTRIBUTION = 40 ether;        // maximum ether allowed to contribute by an unauthorized single account
    uint256 public constant SOFTCAP_GRACE_DURATION = 10;//86400;     // crowdsale softcap reached grace duration in seconds (24 hours) (use 8 seconds for tests)
    uint256 public TOTAL_ETHER_CAP = 110000 ether;             // overall ether contribution cap. use 1100000 for test 
    uint256 public TOTAL_ETHER_SOFT_CAP = 100000 ether;         // overall ether contribution soft cap. use 1000000 for test 
    
    //Presale constants
    uint256 public constant PRESALE_DURATION = 14 days;               // pressale duration
    uint256 public constant PRESALE_MIN_CONTRIBUTION = 200 ether;     // pressale min contribution
    
    //Token constants
    string public constant TOKEN_NAME = "Rootcoin"; //Token name
    string public constant TOKEN_SYM = "RCT";       //Token symbol
    uint8 public constant TOKEN_DEC = 18;           //Token decimals
    
    
    //State variables
    uint256 public startTime = 0;                   // crowdsale start time (in seconds)
    uint256 public endTime = 0;                     // crowdsale end time (in seconds)
    uint256 public totalEtherContributed = 0;       // ether contributed so far
    address public beneficiary = 0x0;               // address to receive all ether contributions
    mapping(address => bool) public whiteList;  //whitelist of accounts that can participate in presale and also contribute more than MAX_CONTRIBUTION
    uint256 public numOfContributors = 0;                   // public contributors counter
     

    // triggered on each contribution
    event Contribution(address indexed _contributor, uint256 _amount, uint256 _return);

    /**
        @dev constructor
        @param _startTime      crowdsale start time
        @param _beneficiary    address to receive all ether contributions
    */
    function CrowdsaleController(uint256 _startTime, address _beneficiary)
        SmartTokenController(new SmartToken(TOKEN_NAME, TOKEN_SYM, TOKEN_DEC))
        validAddress(_beneficiary)
        earlierThan(_startTime)
    {
        startTime = _startTime;
        endTime = startTime + DURATION;
        beneficiary = _beneficiary;
        token.disableTransfers(true);
    }

    // verifies that the gas price is lower than 50 gwei
    modifier validGasPrice() {
        assert(tx.gasprice <= MAX_GAS_PRICE);
        _;
    }

    // ensures that it's earlier than the given time
    modifier earlierThan(uint256 _time) {
        assert(now < _time);
        _;
    }

    // ensures that the current time is between _startTime (inclusive) and _endTime (exclusive)
    modifier between(uint256 _startTime, uint256 _endTime) {
        assert(now >= _startTime && now < _endTime);
        _;
    }

    // ensures that we didn't reach the soft ether cap, and sets the end time time when we do. Must be placed before the etherCapNotReached.
    modifier etherSoftCapNotReached(uint256 _contribution) {
        if (safeAdd(totalEtherContributed, _contribution) >= TOTAL_ETHER_SOFT_CAP) {
            endTime = now + SOFTCAP_GRACE_DURATION;
        }
        _;
    }

    // ensures that we didn't reach the ether cap
    modifier etherCapNotReached(uint256 _contribution) {
        assert(safeAdd(totalEtherContributed, _contribution) <= TOTAL_ETHER_CAP);
        _;
    }

    // verifies that the presale contribution is more than presale minimum
    modifier validatePresaleMinPrice() {
        require(msg.value >= PRESALE_MIN_CONTRIBUTION);
        _;
    }

    // verifies that the presale contribution is from predefined address - TBD (not in use unless we decide to make a whitelist.)
    modifier validatePresaleAddress() {
         require(whiteList[msg.sender] == true);
        _;
    }

    // verifies that the total contributions from contributing account do not reach max alloewed unless it is on the whitelist.
    modifier maxAccountContributionNotReached() {   
        assert(safeAdd(msg.value, safeMul(token.balanceOf(msg.sender), TOKEN_PRICE_N) / TOKEN_PRICE_D) <= MAX_CONTRIBUTION || whiteList[msg.sender]==true);
        _;
    }

    /**
        @dev computes the number of tokens that should be issued for a given contribution

        @param _contribution    contribution amount

        @return computed number of tokens
    */
    function computeReturn(uint256 _contribution) public constant returns (uint256) {
        // return safeMul(_contribution, TOKEN_PRICE_D) / TOKEN_PRICE_N;
        return safeMul(_contribution, TOKEN_PRICE_D) / TOKEN_PRICE_N;
    }

    /**
        @dev updates the number of contributors
    */
    function upadateContributorsCount(uint256 _tokenAmount) private {
        if (token.balanceOf(msg.sender) == _tokenAmount ) 
            numOfContributors++;
    }

    /**
        @dev adds a whitelist address for which there is no max contribution and is alloewed to participate in the presale.

        @param _address    verified contributor address

        @return true
    */
    function addToWhitelist(address _address)
    public
    managerOnly
    returns (bool added)
    {
        whiteList[_address] = true;
        return true;
    }

    /**
        @dev disables an existing whitelist address from participating presale.

        @param _address    verified contributor address to be removed

        @return true
    */
    function removeFromWhitelist(address _address)
    public
    managerOnly
    returns (bool added)
    {
        whiteList[_address] = false;
        return true;
    }

    /**
        @dev ETH contribution
        can only be called during the crowdsale

        @return tokens issued in return
    */
    function contributeETH()
        public
        payable
        between(startTime, endTime)
        whenNotPaused
        maxAccountContributionNotReached
        returns (uint256 amount)
    {
        return processContribution();
    }

     /**
        @dev handles contribution during presale (min 200 ether)
        can only be called 14 days before the crowdsale start date

        @return tokens issued in return
    */
    function contributePreSale()
        public
        payable
        between(safeSub(startTime,PRESALE_DURATION), startTime)
        whenNotPaused
        validatePresaleMinPrice
        validatePresaleAddress
        returns (uint256 amount)
    {
        return processContribution();
    }

     /**
        @dev handles contribution with Fiat - for 
        can only be called by manager 

        @return tokens issued in return
    */
    function contributeFiat(address _contributor, uint256 _amount)
        public
        payable
        managerOnly
        between(safeSub(startTime,PRESALE_DURATION), safeAdd(startTime, DURATION))
        whenNotPaused
        returns (uint256 amount)
    {
        uint256 tokenAmount = computeReturn(_amount);
    
        totalEtherContributed = safeAdd(totalEtherContributed, _amount); // update the total contribution amount
        token.issue(_contributor, tokenAmount); // issue new funds to the contributor's address, provided by the manager, in the smart token
        token.issue(beneficiary, tokenAmount); // issue tokens to the beneficiary

        Contribution(_contributor, msg.value, tokenAmount);
        return tokenAmount;
    }

    /**
        @dev handles contribution logic
        note that the Contribution event is triggered using the sender as the contributor, regardless of the actual contributor

        @return tokens issued in return
    */
    function processContribution() private
        active
        etherSoftCapNotReached(msg.value)
        etherCapNotReached(msg.value)
        validGasPrice
        returns (uint256 amount)
    {
        uint256 tokenAmount = computeReturn(msg.value);
        assert(beneficiary.send(msg.value)); // transfer the ether to the beneficiary account
        totalEtherContributed = safeAdd(totalEtherContributed, msg.value); // update the total contribution amount
        token.issue(msg.sender, tokenAmount); // issue new funds to the contributor in the smart token
        token.issue(beneficiary, tokenAmount); // issue tokens to the beneficiary
        upadateContributorsCount(tokenAmount);
        Contribution(msg.sender, msg.value, tokenAmount);
        return tokenAmount;
    }

    // fallback
    function() payable {
        contributeETH();
    }
}
