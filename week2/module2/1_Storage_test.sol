// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

import "remix_tests.sol"; 
import "./1_Storage.sol";

contract testSuite {

    Storage myStorage;
    uint INT_MAX = 2**256 - 1;
    
    // to get a fresh instance of contract before each test
    function beforeEach() public {
        myStorage = new Storage();
    }

    // to check if value is stored correctly;
    function valueIsStored2000() public {
        myStorage.store(2000);
        Assert.equal(myStorage.retrieve(), 2000, "Value is not set to 2000");
    }

    function valueIsStoredINTMAX() public {
        myStorage.store(INT_MAX);
        Assert.equal(myStorage.retrieve(), INT_MAX, "Value is not set to INT_MAX");
    } 

    // to check if the stored value is not greater than INT_MAX
    function checkOverflow() public returns (bool) {      
        return Assert.lesserThan(myStorage.retrieve(), INT_MAX, "Overflow detected!");
    }

    // to check for negative values
    function checkNegativeValues() public returns (bool) {
        return Assert.greaterThan(myStorage.retrieve(), -1, "Negative value stored in unsigned integer!");
    }   
}
    