// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.10;

contract Bonding {
    /* ======== DEPENDENCIES ======== */

    // using SafeERC20 for IERC20;

    /* ======== STATE VARIABLES ======== */

    struct Bond { 
        uint created; // when this bond was created
        uint expiry; // when this bond will mature
        uint value; // number of mgmt tokens this bond is worth
    }

    //The contract will have variable bonding length, 
    //can change this to an array instantiated at deployment, 
    //with get/set functions to add and remove dates
    uint constant ONE_WEEK = 604800;
    uint constant TWO_WEEKs = 1209600;
    uint constant THREE_MONTHS = 7889238;
    uint constant SIX_MONTHS = 15778476;
    uint constant ONE_YEAR = 31556952;
    uint256 public number;

    mapping(address => Bond[]) public bonds; // bonds for each user

    /* ======== EVENTS ======== */

    event Bonded(address user, address token, uint256 amount, uint256 value, uint256 duration);
    event Redemption(address user, uint256 amount);
    event Tuned(uint256 indexed id, uint64 oldControlVariable, uint64 newControlVariable);

    /* ======== CONSTRUCTOR ======== */

    constructor(
        //can specify oracles and internal addresses here
    )
    {
        
    }

    /**
     * @notice                  compute a base price estimate for the LP tokens
     * @param _token            the address of the LP (or other) token
     * @param _amount           the amount of LP tokens to bond
     * @return value_           the amount of MGMT due
     */
    function get_market_val(
        address _token,
        uint256 _amount
    ) 
        internal 
        returns (
            uint256 value_
        )
    
    {
        //query liquidity reserves from the AMM pool
        //query oracle for stablecoin price
        //query core contract for TSRY price
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    /**
     * @notice                  compute the number of MGMT tokens to offer for the bond
     * @param _quote_price      the amount of quote token to spend
     * @param _discount_rate    the discount rate for bonding
     * @param _duration         the duration for which to bond
     * @return payout_          the amount of MGMT due
     */
    function get_bond_value(
        uint256 _quote_price, 
        uint256 _discount_rate,
        uint256 _duration
    ) 
        internal
        returns 
        (
            uint256 payout_
        ) 
    {
        //return payout according to:
        //payout_ = _quote_price / M_d
        //MGMT_discounted = M(1 − min(|liquidity_target + control_variable * _duration |, max_rate))
        //where M is current market price of MGMT
        
        //query liquidity_target from external contract

        
        //hardcode discount rate and control variable for testing:
        uint discount_rate = 0;
        uint control_variable = 0;

    }

    function create_bond(
        address _lp_address,
        uint _lp_amount,
        uint _duration
    )
        public
        returns
        (
            uint index
        )
    {
        // token_val = get_market_val(_lp_address, _lp_amount)
        // bond_value = get_bond_value(token_val, _discount_rate, _duration)
        // uint bond_value = _lp_amount;
        // Bond memory bond = Bond(block.timestamp, _duration, bond_value);
        // bonds[msg.sender].push(bond);

        return 1;
    }

    /**
     * @notice                  withdraw a bond if it has matured
     * @param _bond_index       the index of the bond to be withdrawn
     */
    function withdraw(
        address _user,
        uint _bond_index
    )
        public 
    {
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);
        Bond memory bond = bonds[_user][_bond_index];

        require(block.timestamp >= bond.expiry, "You can't withdraw yet");

        // emit Withdrawal(address(this).balance, block.timestamp);

        // owner.transfer(address(this).balance);
    }
}