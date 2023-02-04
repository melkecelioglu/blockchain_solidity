pragma solidity >= 0.7.0 < 0.9.0;



contract RestrictedAcces {
    
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;
    

    modifier onlyBy(address _account) {
        require(msg.sender == _account,
        'Sender not authorized!'
        );
        _;
    } 
    
    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time,
        'function is called too early!');
        _;
    }
    
    // write a function that will change the owner address
    function changeOwnerAddress(address _newAddress) onlyBy(owner) public {
        owner = _newAddress;
    }
    
    // write a function that can disown the current owner 
    // only run the function 3 weeks or 5 seconds after the creation of the contract 
    function disown() onlyBy(owner) onlyAfter(creationTime + 5 weeks) public {
        delete owner;
    } 
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount,
        'Not enough Ether provided');
        _;
    }
    
    function forceOwnerChange(address _newOwner) payable public costs(200 ether) {
        owner = _newOwner;
    }
}