// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.7.5;

import "./IERC20.sol";

// Old wsTSRY interface
interface IwsTSRY is IERC20 {
    function wrap(uint256 _amount) external returns (uint256);

    function unwrap(uint256 _amount) external returns (uint256);

    function wTSRYTosTSRY(uint256 _amount) external view returns (uint256);

    function sTSRYTowTSRY(uint256 _amount) external view returns (uint256);
}
