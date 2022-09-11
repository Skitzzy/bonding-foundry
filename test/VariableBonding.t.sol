pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../src/VariableBonding.sol";
contract VariableBondingTest is Test {
    VariableBonding public bonder;

    function setUp() public {
       bonder = new VariableBonding();
    }

    function testBond(address addr, uint amount, uint duration) public {
        vm.prank(address(1));
        vm.assume(addr != address(0));
        uint index = bonder.create_bond(addr, 1, 1);
        assertEq(index, 1);
    }
    
    function testWithdraw() public {
        vm.prank(address(1));
        uint index = bonder.create_bond(address(2), 1, 1);
        uint amount = bonder.withdraw(index);
    }
}