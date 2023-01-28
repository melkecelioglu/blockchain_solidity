pragma solidity >= 0.7.0 < 0.9.0;

// WHAT ARE UINTS ???

// The uint data type is an unsigned integer, meaning its value must be non-negative. 
// There’s also an int data type for signed integers.

// Note: In Solidity, uint is actually an alias for uint256, a 256-bit unsigned integer. 
// You can declare uints with less bits — uint8, uint16, uint32, etc.. 
// But in general you want to simply use uint except in specific cases

// Impress your interviewer - smart contracts that are cost efficient - 

contract learnConversions {

// uint defaults uint256 
//  uint (alist for uint256) is a unsigned integer which has:
//    minimum value of 0
//    maximum value of 2^16-1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935 //78 decimal digits
 uint number = 2;
    
// Conversion to smaller type costs higher order bits.    
uint32 a = 0x12345678;
uint16 b = uint16(a); // b = 0x5678

// Conversion to higher type adds padding bits to the left.
uint16 c = 0x1234;
uint32 d = uint32(c); // d = 0x00001234 

// What is the cost? 
// Conversion to smaller bytes costs higher order data 
bytes2 e = 0x1234;
bytes1 f = bytes1(e); // f = 0x12

// What does this add? 
// Conversion to larger bytes adds padding bits to the right
bytes2 g = 0x1234;
bytes4 h = bytes4(g); // h = 0x12340000
}



// Ether Units
// Ethereum is the blockchain and Ether is the currency for Ethereum 

contract learnEtherUnits {
    
    function test() public {
    
    // wei is the smallest denomination of ether    
    assert(1000000000000000000 wei == 1 ether); // 10^18 wei = 1 eth
    assert(1 wei == 1); // 1 wei = 1 
    
    assert(1 ether == 1e18);
    // 1 ether == 1e18
    // create an assertion for 2 eths to be equivalent to weis
    assert(2 ether == 2000000000000000000 wei); 
    }
    
    
    function exercise() public {
        
        assert(1 minutes == 60 seconds);
        assert(24 hours == 1440 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);
        
        assert(10 == 9 + 2);
    }  
}


// Similar to currency, Solidity has time units where lowest unit is second and we can use seconds, 
// minutes, hours, days and weeks as suffix to denote time.

// Exercise - Create the following assertions in a function called exercise:
// Assert equivalencies for minutes to seconds, hours to minutes, days to hours, and weeks to days






//Special variables (global variables) are globally available variables and provides information about the blockchain. 
// Ex: 
// msg.sender: Sender of the message (current call), msg.value (uint): Number of wei sent with the message., 
// block.timestamp: Current block timestamp as seconds since unix epoch, block.number (uint): current block number

contract LedgerBalance {
// create a map of wallets with amounts
// set up a function that can update the amount of the person call the contract - current address - msg.Sender

mapping(address => uint) balance;

function updatesBalance(uint newBalance) public {
    balance[msg.sender] = newBalance;
}
}


contract Updated {
    
    function updatesBalance() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updatesBalance(30);
    }
    
}

// Other Global Variable Examples 

contract SimpleStorage {
    
    uint storedData;
    
    function set(uint x) public {
        //storedData = x;
        // storedData = block.difficulty;
        // storedData = block.timestamp;
        storedData = block.number;
    }
    
    function get() public view returns (uint) {
        return storedData;
    }
    
}