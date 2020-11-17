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
    
    address public teamAddress = address(0x414376ee6cb104b92c3dd9c8afd2a3ca83219ee918);
    address public serviceAddress = address(0x41de26c4f5f0e2cee7dde5a5304bc4f5d1caaa08c0);
    address public partnerAddress = address(0x41f3721ef1372b754563edb06431e1382fc959bae2);
    address public bountyAddress = address(0x41773e849bcdd61b6223110e0d1fab9828d6b95272);
    
    // address public teamGroup = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    // address public serviceGroup = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    // address public partnerGroup = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    // address public bountyGroup = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2;
    // address public bountyGroup2 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint256 public teamAmount =   9000;
    uint256 public serviceAmount =  80000;
    uint256 public partnerAmount = 9000;
   
    // tronWeb.address.toHex('0x41773e849bcdd61b6223110e0d1fab9828d6b95272');
    
//     function convertFromTronInt(uint256 tronAddress) public pure returns(address){
//       return address(tronAddress);
// }
    // function setAddress(address _teamGroup, address _serviceGroup,address _partnerGroup, address _bountyGroup)public returns (address ){
    //     teamGroup = _teamGroup;
    //     serviceGroup = _serviceGroup;
    //     partnerGroup = _partnerGroup;
    //     bountyGroup = _bountyGroup;
    //     return teamGroup;
    // }
   
    struct UnlockStages {
        uint256  unlockDate;
        uint256  amount;
    }
    
    mapping (address => UnlockStages[]) public unlockList;
    mapping (uint => uint) public timeRelease;
    mapping (uint => uint) public Price;
    
    function setStartingTime() public returns (uint256){
        timeRelease[0] = now;
        return timeRelease[0];
    }
    
    // UnlockStages firstStage = UnlockStages(timeRelease[0],0);
    // unlockList[teamAddress].push(firstStage);
   constructor() CommonToken("Olacoin", "OLA", 0, 100000 ) public {
   
    // function setStartingTime() public returns (uint256){
    //     timeRelease[1] = now;
    //     return timeRelease[0];
    // }
    // timeRelease[1] = now;\
    // for(uint256 i = 2; i< 12; i++){
	   // Price[1] = uint(1/1000);
	   // Price[i] = Price[i-1] * 15/100;
    // }
    //  for(uint256 i = 13; i< 120; i++){
	   // Price[13] = uint(1/1000);
	   // Price[i] = Price[i-1] * 15/100;
    // }
    uint256 timeAdd = 10;
    for( uint256 i = 1; i<=120; i++){
      timeRelease[i] = timeRelease[i-1] + timeAdd;
       
    }
    for(uint256 i = 1; i<36; i++){
          if(i%3 == 1){
            unlock(teamAddress, 750 , timeRelease[i] );
            unlock(partnerAddress,750 , timeRelease[i]);
        }
    }
    for(uint256 i = 1; i<120; i++){
        if(i%3 == 1){
            unlock(serviceAddress, 2000, timeRelease[i] );
        }
    }
    unlock(bountyAddress, 2000, timeRelease[1]);
    
    UnlockStages memory _firstStage = UnlockStages(timeRelease[0], 0);
    unlockList[teamAddress].push(_firstStage);
    unlockList[serviceAddress].push(_firstStage);
    unlockList[partnerAddress].push(_firstStage);
}
  
    //  function firstStage()public {
    //   UnlockStages memory _firstStage = UnlockStages(timeRelease[0],0);
    //   unlockList[teamAddress].push(_firstStage);
    //   unlockList[serviceAddress].push(_firstStage);
    //   unlockList[partnerAddress].push(_firstStage);
    //   }
      
    
   
    
    function unlock(address _account, uint256 _amount, uint256 _timeRelease) public returns (bool success){
        _transfer(msg.sender,_account,_amount);
    	UnlockStages memory nextStages = UnlockStages(_timeRelease,_amount);
    // 	UnlockStages memory _firstStage = UnlockStages(timeRelease[0], 0);
    // 	unlockList[_account][1][0].push(_firstStage);
		unlockList[_account].push(nextStages);
        return true;
	} 
	function getNumberOfUnlockStage(address _account) public view returns (uint256){
	    return unlockList[_account].length;
	}
	
	function getTotalAmountUnlockAt(address _account, uint256 _times) public view returns (uint256){
	    uint256 totalAmountUnlock = 0;
	    for(uint256 i = 0; i<=_times; i++){
	        uint256 amountUnlock = unlockList[_account][i].amount;
	        totalAmountUnlock += amountUnlock;
	    }
	    return totalAmountUnlock;
	}
	
	function getCurrentUnlockStage() public view returns (uint256){
	    uint256 currentUnlockStage = (now - timeRelease[0])/10;
	    require(currentUnlockStage<41);
	    return currentUnlockStage;
	}
	
	function getCurrentTotalAmountUnlock(address _account) public view returns (uint256){
	    uint256 currentTotalAmountUnlocked = 0;
	    uint256 times = (now - timeRelease[0])/10;
	    for(uint256 i = 1; i<= times; i++){
	        uint256 currentAmountUnlock = unlockList[_account][i].amount;
	        currentTotalAmountUnlocked += currentAmountUnlock;
	    }
	    return currentTotalAmountUnlocked;
	}
	function getCurrentTotalAmountLocked(address _account) public view returns (uint256){
	  
	    uint256 totalAmountUnlocked = getCurrentTotalAmountUnlock(_account);
	    uint256 currentTotalAmountLock = 0;
	    if(_account == teamAddress){
	        currentTotalAmountLock = teamAmount - totalAmountUnlocked;
	    }
	    if(_account == serviceAddress){
	        currentTotalAmountLock = serviceAmount - totalAmountUnlocked;
	    }
	    if(_account == partnerAddress){
	        currentTotalAmountLock = partnerAmount - totalAmountUnlocked;
	    }
	    return currentTotalAmountLock;
	}
	function getCurrentTotalUnlockCoin()public view returns (uint256){
	    uint256 currentTotalUnlockCoin = getCurrentTotalAmountUnlock(teamAddress) + getCurrentTotalAmountUnlock(serviceAddress)
	                                    + getCurrentTotalAmountUnlock(partnerAddress) + 2000;
	   return currentTotalUnlockCoin;
	}
	
	
// 	function getPriceAt(uint256 _numberofStage) public view returns (uint256){
// 	    uint256 price = Price[_numberofStage];
// 	    return price;
//     }
}








