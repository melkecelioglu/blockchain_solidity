pragma solidity ^0.4.17;
contract Mel {
    
    // Data
    //Structure to hold details of the item
    struct Item {
        uint itemId; // id of the item
        uint[] itemTokens;  //tokens bid in favor of the item
       
    }
    
   //Structure to hold the details of a persons
    struct Person {
        uint remainingTokens; // tokens remaining with bidder
        uint personId; // it serves as tokenId as well
        address addr;//address of the bidder
    }
 
    mapping(address => Person) tokenDetails; //address to person 
    Person [4] bidders;//Array containing 4 person objects
    
    Item [3] public items;//Array containing 3 item objects
    address[3] public winners;//Array for address of winners
    address public beneficiary;//owner of the smart contract
    
    uint bidderCount=0;//counter
    
    //functions

    function Mel() public payable{    //constructor
                
        //Part 1 Task 1. Initialize beneficiary with address of smart contract’s owner
        //Hint. In the constructor,"msg.sender" is the address of the owner.
        // ** Start code here. 1 line approximately. **/
        beneficiary = msg.sender;
          //** End code here. **/
        uint[] memory emptyArray;
        items[0] = Item({itemId:0,itemTokens:emptyArray});
        
        //Part 1 Task 2. Initialize two items with at index 1 and 2. 
        // ** Start code here. 2 lines approximately. **/
        items[1] = Item({itemId:1,itemTokens:emptyArray});
        items[2] = Item({itemId:2,itemTokens:emptyArray});
        //** End code here**/
    }
    

    function register() public payable{
        
        
        bidders[bidderCount].personId = bidderCount;
        
        //Part 1 Task 3. Initialize the address of the bidder 
        /*Hint. Here the bidders[bidderCount].addr should be initialized with address of the registrant.*/
        
        // ** Start code here. 1 line approximately. **/
        bidders[bidderCount].addr = msg.sender;
        //** End code here. **
        
        bidders[bidderCount].remainingTokens = 5; // only 5 tokens
        tokenDetails[msg.sender]=bidders[bidderCount];
        bidderCount++;
    }

////////////////////

pragma solidity >= 0.7.0 < 0.9.0;

  /**
   * @title WelcomeToSolidity
   * @dev ContractDescription
   */


contract WelcomeToSolidity {
    constructor() public {
    }
    function getResult() public view returns(uint){
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        return result;
    }

    uint oranges =4; 

    function validateoranges() public view returns (bool){
        if(oranges==5){
            return true;
        }else {
            return false;
        }
    }
    uint stakingWallet = 101;
    function airDrop() public view returns(uint){
        if(stakingWallet == 10){
            return stakingWallet +10;

        }else{
            return stakingWallet +1;
        }
    }
    uint public data = 10; // state variable. 
    // private olsaydı data yı göremezdik
    // internal da aynı şekilde
    // external olursa hata alırız 
    function x() public view returns(uint){
        //uint data =10; //local variable
        //ama mesela aşağıdaki gibi data=17 dersen o zaman genel diğer data da değişir
        
        return data;
    }
    function y() public view returns(uint){
        return data;
    }

    funcion hereX() external pure returns (uint){ //if it would be private then we could not be able to access this hereX function
        uint newData = 25;
        return newData;
    }

    // 5/7 yaparsan sonu 0.7 küsür çıkacağı için cevap aslında remix taarfından 0 olarak verilir







    contract ComparisonOperators {
        uint a = 4;
        uint b = 6;
        function compare() view public {
            require(a == b, 'That is false' );
            require(a<=b , 'This comparison is false!') // cevap = This comparison is false! olacak çünkü a, b'ye küçük eşit değildir dolasıyla virgülden sonraki işlem uygulanır


            // buradaki virgül "otherwise" anlamına geliyor gibi güşünebilirsin
        }
    }


    function checkMultiples(uint _num, uint _nums) pblic view returns(bool){
        if (_num % _nums ==0){
            return true;
        }
        else{
            return false;
        }
    }


    //here we have a list
    uint [] public numbersList = [1,2,3,4,5,6,7,8,9,10];

    function checkMultiplesInForLoop(uint _number) public view  returns(bool){
        uint count = 0;
        for(uint i = 1; i<numbersList.length; i++){
            if(checkMultiples(numbersList[i], _number)){
                count++;
            }
        }
        return count;
    }

contract myLoopingPracticeContract{
        uint [] public longList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
        uint [] public numbersList = [1,4,34,56];
        function validate(uint _number) public view returns(bool){
            for(uint i=1; i< longList; i++){
                if(list[i]== _number){
                    return true;
                }
            }
            return false;
        }

        function even(uint _number) public view returns(uint){
            uint count=0;
            for(uint i=1; i<longList; i++){
                if(longList[i]%2==0){
                    count++;
                    }
               }
               return count;
        }

}

string greetings = 'Hello';

    function sayHello() public view returns(string memory){
       return greetings;
    }

//memory is. a temporary place to store data

function changeGreeting(string memory _change) public {
    greetings = _change;

}

//this is too expensive computationally to get length in solidity so you can not do it like other languages

//to get length, convert string to bytes so we can retun the length
function getChar() public view returns(uint){
    //return greetings.length;
    bytes memory stringToBytes = bytes(greetings);
    return stringToBytes.length;

}
//             \      =       means that skip a character
string greetings = 'Hello! \nYou\'re here now!';
// means = Hello You're here now! yani buradaki boşluğu skip ediyor

}

