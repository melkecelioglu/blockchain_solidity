pragma solidity >= 0.7.0 < 0.9.0;

/*

A contract can have only one constructor.
2. A constructor code is executed once when a contract is created and it is used to initialize contract state.
3. After a constructor code executed, the final code is deployed to blockchain.
This code include public functions and code reachable through public functions.
Constructor code or any internal method used only by constructor are not included in final code.
A constructor be either public or internal.
A internal constructor marks the contract as abstract.
In case, no constructor is defined, a default constructor is present in the contract.
*/


contract Member {
    string name;
    uint age;

    constructor(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }

}

// is an option to call the constructor

contract Teacher is Member // ('Rachel', 28)
{
    constructor(string memory n, uint a) Member(n,a) public {}

    function getName() public view return(string memory){
        return name;
    } 

}



/*
Exercise For Constructors:
I
1. Create a contract called Base which stores fully accessible (inside and outside) integer data upon deployment
2. Create another contract called Derived which derives the data from base and runs a
function that always outputs the data to the number 5 */

contract Base {
    uint data;
    
    consructor(uint _data) public {
        data = _data;
    }
    
    function getData() public view returns(uint){
    return data;
    }    
}
    contract Derived is Base (5) {
        function getBaseData() public view returns(uint) {
        return data;
    }
}



 // WHAT ARE ARRAYS? :) 
 // Array is a data structure, which stores a fixed-size sequential collection of elements of the same type. 
 //An array is used to store a collection of data, 
 // but it is often more useful to think of an array as a collection of variables of the same type.
 
 // 1. How To Write An Array
 // 2. pop, push, and length methods
 // 3. remove elements from array

contract learnArrays {
    
  uint[] public myArray; /// add 1 2 3 4 
  uint[] public myArray2;
  uint[200] public myFixedSizedArray;
  
  // The push() method adds one or more elements to the end of an array and returns the new length of the array.
    
    function push(uint number) public {
        myArray.push(number);
    }
    
    // The pop method removes the last element from an array and returns that value to the caller.
    function pop() public {
        myArray.pop();
    }
    
    // length is a string property that is used to determine the length of a string
    
    function getlength() public view returns (uint) {
        return myArray.length;
    }
    
    function remove(uint i) public {
        delete myArray[i];
        // when you delete in your array the length remains the same
        // i = 0 = 1, 2 = 1, 3 = 2  
        
    }
    
    // Exercise create a function that can fully remove an item from an array
    // 1. Create an Empty array called changeArray
    // 2. Create a function called removeElement which sets the index argument of the array to the last element in the array
    // 3. remove the last index from that function with the pop method
    // 4. Create a function called test which pushes 1 2 3 4 into changeArray
    // 5. remove the element 2 from the array when the contract is called
    
    uint[] public changeArray;
    
    function removeElement(uint i) public {
        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    } 
    
    function test() public {
        changeArray.push(1);
        changeArray.push(2);
        changeArray.push(3);
        changeArray.push(4);
    }
    
    function getArray() public view returns (uint) {
        return changeArray.length;
}
}




pragma solidity >= 0.7.0 < 0.9.0;

// Enums restrict a variable to have one of only a few predefined values. The values in this enumerated list are called enums.

// With the use of enums it is possible to reduce the number of bugs in your code.

// enum for our food app that offers either large medium or small options!

contract enumsLearn {
    enum frenchFriesSize {LARGE, MEDIUM, SMALL}
  //  frenchFriesSize choice;
    // frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;
    
    function setSmall() public {
     //   choice = frenchFriesSize.SMALL;
    }
    
    //function getChoice() public view returns(frenchFriesSize) {
        //    return choice;
   // }
    
   // function getDefaultChoice() public view returns (uint) {
    //        return uint(defaultChoice);
   // }
    
    enum shirtColor {RED, WHITE, BLUE}
    shirtColor choice;
    shirtColor constant defaultChoice = shirtColor.BLUE;
    
    function setWhite() public {
        choice = shirtColor.WHITE;
    }
    
    function getChoice() public view returns(shirtColor) {
        return choice;
    }
    
        function getDefaultChoice() public view returns(uint) {
        return uint(defaultChoice);
    }
}

pragma solidity >= 0.7.0 < 0.9.0;

//Struct are types that are used to represent a record. Suppose you want to keep track of your movies in a library. 
// You might want to track the following attributes about each movie −


contract learnStructs {
    
 struct Movie {
     // add director variable add movie title variable add movie id variable 
     
     string title;
     string director;
     uint movie_id;
 }

    Movie movie;
    Movie comedy;
    

    function setMovie() public {
       // movie = Movie('Blade Runner', 'Ridley Scott', 2);
       // movie = Movie('Escape From New York', 'John Carpenter', 3);
       comedy = Movie('Zoolander', 'Ben Stiller', 4);
    }

    function getMovieId() public view returns(uint) {
        //return movie.movie_id;
        return comedy.movie_id;
    }

}
pragma solidity >= 0.7.0 < 0.9.0;

// Mapping is a reference type as arrays and structs. Following is the syntax to declare a mapping type.
// Mapping allows you to save data and add a key that you specifiy and then retrieve that info later
// Similar to struct or an array  -  it is a reference typr 
// in Solidity you can't iterate through a map - you need to store the keys in an array and you can't give size

// get set and delete a value from mapping 

contract learnMapping {
    
    // key and value - key can be string uint or bool - value can be anything
    mapping(address => uint) public myMap;
    
    function getAddress(address _addr) public view returns (uint) {
        return myMap[_addr];
    }
    
    // similar to an array and similar how you'd update an array element
    
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }
    
    
        function remove(address _addr) public {
        delete myMap[_addr];
    }
    
    // Exercise 1. Deplay the mapping contract and create some keys as addresses and set those keys to unique values 
    // 2. Remove all the addresses and check to see their updated value.
    
     // Mapping Assignment:
    // 0. Create a unique data type as a struct called Movie and give it the string properties: title and diretor.
    // 1. Create a map called movie which takes a uint as a key and Movie as a value 
    // 2. create a function called addMovie which takes three inputs, movie id, title and director which 
    // assigns a value of an integer to a movie added back to the movie map. It should include a title and director name.
    // 3. Deploy the contract and update the movie information to the movie map with our favorite movies! 
    
    mapping(uint => Movie) movie;
    mapping(address => mapping(uint => Movie)) public myMovie;
    
    struct Movie {
      string title;
      string director;
    }
    
    function addMovie(uint id, string memory title, string memory director) public {
            movie[id] = Movie(title, director); 
    }
    
        function addMyMovie(uint id, string memory title, string memory director) public {
            myMovie[msg.sender][id] = Movie(title, director); 
            // msg.sender is a global variable accessible throughout solidity which captures the address that
            // is calling the contract
    }
    
  
}