pragma solidity ^0.5.0;

/**
ERC20 & TRC20 Token
Symbol          : nhancv
Name            : Eric Cao Token
Total supply    : 1000000000
Decimals        : 6
@ nhancv MIT license
 */

// ---------------------------------------------------------------------
// ERC-20 Token Standard Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ---------------------------------------------------------------------
contract ERC20Interface {
  /**
  Returns the name of the token - e.g. "MyToken"
   */
  string public name;
  /**
  Returns the symbol of the token. E.g. "HIX".
   */
  string public symbol;
  /**
  Returns the number of decimals the token uses - e. g. 8
   */
  uint8 public decimals;
  /**
  Returns the total token supply.
   */
  uint256 public totalSupply;
  /**
  Returns the account balance of another account with address _owner.
   */
  function balanceOf(address _owner) public view returns (uint256 balance);
  /**
  Transfers _value amount of tokens to address _to, and MUST fire the Transfer event. 
  The function SHOULD throw if the _from account balance does not have enough tokens to spend.
   */
  function transfer(address _to, uint256 _value) public returns (bool success);
  /**
  Transfers _value amount of tokens from address _from to address _to, and MUST fire the Transfer event.
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
  /**
  Allows _spender to withdraw from your account multiple times, up to the _value amount. 
  If this function is called again it overwrites the current allowance with _value.
   */
  function approve(address _spender, uint256 _value) public returns (bool success);
  /**
  Returns the amount which _spender is still allowed to withdraw from _owner.
   */
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
  /**
  MUST trigger when tokens are transferred, including zero value transfers.
   */
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  /**
  MUST trigger on any successful call to approve(address _spender, uint256 _value).
    */
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

/**
Owned contract
 */
contract Owned {
  address public owner;
  address public newOwner;

  event OwnershipTransferred(address indexed _from, address indexed _to);

  constructor () public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address _newOwner) public onlyOwner {
    newOwner = _newOwner;
  }

  function acceptOwnership() public {
    require(msg.sender == newOwner);
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
    newOwner = address(0);
  }
}

/**
Function to receive approval and execute function in one call.
 */
contract TokenRecipient { 
  function receiveApproval(address _from, uint256 _value, address _token, bytes memory _extraData) public; 
}

/**
Token implement
 */
contract Token is ERC20Interface, Owned {

  mapping (address => uint256) _balances;
  mapping (address => mapping (address => uint256)) _allowed;
  
  // This notifies clients about the amount burnt
  event Burn(address indexed from, uint256 value);
  
  function balanceOf(address _owner) public view returns (uint256 balance) {
    return _balances[_owner];
  }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    _transfer(msg.sender, _to, _value);
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(_value <= _allowed[_from][msg.sender]); 
    _allowed[_from][msg.sender] -= _value;
    _transfer(_from, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool success) {
    _allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
    return _allowed[_owner][_spender];
  }

  /**
  Owner can transfer out any accidentally sent ERC20 tokens
   */
  function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
  }

  /**
  Approves and then calls the receiving contract
   */
  function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
    TokenRecipient spender = TokenRecipient(_spender);
    approve(_spender, _value);
    spender.receiveApproval(msg.sender, _value, address(this), _extraData);
    return true;
  }

  /**
  Destroy tokens.
  Remove `_value` tokens from the system irreversibly
    */
  function burn(uint256 _value) public returns (bool success) {
    require(_balances[msg.sender] >= _value);
    _balances[msg.sender] -= _value;
    totalSupply -= _value;
    emit Burn(msg.sender, _value);
    return true;
  }

  /**
  Destroy tokens from other account.
  Remove `_value` tokens from the system irreversibly on behalf of `_from`.
    */
  function burnFrom(address _from, uint256 _value) public returns (bool success) {
    require(_balances[_from] >= _value);
    require(_value <= _allowed[_from][msg.sender]);
    _balances[_from] -= _value;
    _allowed[_from][msg.sender] -= _value;
    totalSupply -= _value;
    emit Burn(_from, _value);
    return true;
  }

  /**
  Internal transfer, only can be called by this contract
    */
  function _transfer(address _from, address _to, uint _value) internal {
    // Prevent transfer to 0x0 address. Use burn() instead
    require(_to != address(0x0));
    // Check if the sender has enough
    require(_balances[_from] >= _value);
    // Check for overflows
    require(_balances[_to] + _value > _balances[_to]);
    // Save this for an assertion in the future
    uint previousBalances = _balances[_from] + _balances[_to];
    // Subtract from the sender
    _balances[_from] -= _value;
    // Add the same to the recipient
    _balances[_to] += _value;
    emit Transfer(_from, _to, _value);
    // Asserts are used to use static analysis to find bugs in your code. They should never fail
    assert(_balances[_from] + _balances[_to] == previousBalances);
  }
  

}


contract CommonToken is Token {

  constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _initialSupply;
    _balances[msg.sender] = totalSupply;
  }

  /**
  If ether is sent to this address, send it back.
   */
  function () external payable {
    revert();
  }

}

contract Olacoin is CommonToken {
    
    address teamGroup = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address serviceGroup = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    address partnerGroup = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address bountyGroup = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    
    struct Lockstep {
        uint256  unlockDate;
        uint256  amount;
    }
    
    mapping (address => Lockstep[]) public lockList;
    mapping (uint => uint) public timeRelease;

    function startingTime() public returns (uint256){
        timeRelease[0] = now;
        return timeRelease[0];
    }
    
  constructor() CommonToken("Olacoin", "OLA", 0, 100000000000 ) public {
    // uint256 teamAmount =   9000000000;
    // uint256 serviceAmount =  80000000000;
    // uint256 partnerAmount = 9000000000;
    
//   timeRelease[0] = now;
  for( uint256 i = 1; i<=40; i++){
      timeRelease[i] = timeRelease[i-1] + 20;
       
  }
  for(uint256 i = 1; i<=12; i++){
        unlock(teamGroup, 750 * 10**6, timeRelease[i] );
        unlock(partnerGroup,750 * 10**6, timeRelease[i]);
  }
  for(uint256 i = 1; i<=40; i++){
        unlock(serviceGroup, 2*10**9, timeRelease[i] );
  }
  
  unlock(bountyGroup, 2*10**9, timeRelease[1]);
  }
    
    function unlock(address _account, uint256 _amount, uint256 _timeRelease) public returns (bool success)
	{
        _transfer(msg.sender,_account,_amount);
    	Lockstep memory item = Lockstep(_timeRelease,_amount);
		lockList[_account].push(item);
	
        return true;
        
	} 
	function timesOfUnlock(address _account) public view returns (uint256){
	    return lockList[_account].length;
	}
	function getAmountUnlock(address _account, uint256 _times) public view returns (uint256){
	    uint256 totalAmountUnlock = 0;
	    for(uint256 i = 0; i<=_times; i++){
	        uint256 amountUnlock = lockList[_account][i].amount;
	        totalAmountUnlock += amountUnlock;
	    }
	    return totalAmountUnlock;
	}
	function getCurrentUnlock() public view returns (uint256){
	    uint256 currentUnlock = (now - timeRelease[0])/20;
	    return currentUnlock;
	}
	function getCurrentAmountUnlock(address _account) public view returns (uint256){
	    uint256 totalCurentAmountUnlock = 0;
	    uint256 times = (now - timeRelease[0])/60;
	    for(uint256 i = 1; i<= times; i++){
	        uint256 currentAmountUnlock = lockList[_account][i].amount;
	        totalCurentAmountUnlock += currentAmountUnlock;
	    }
	    return totalCurentAmountUnlock;
	}
}









