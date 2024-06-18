// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RoleManagement is AccessControl {

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant TRADER_ROLE = keccak256("TRADER_ROLE");

  /**
     * @notice  Provides _superAdmin wallet address DEFAULT_ADMIN and
     * ADMIN role and sets role ADMIN as a role admin for TRADER_ROLE.
     * @param   _superAdmin Wallet address which will have both DEFAULT_ADMIN and ADMIN Role  .
     */
    constructor(address _superAdmin) {
        _grantRole(DEFAULT_ADMIN_ROLE, _superAdmin);
        _grantRole(ADMIN_ROLE, _superAdmin);
        _setRoleAdmin(TRADER_ROLE, ADMIN_ROLE);
    }

    /**
     * @notice Function to provide functionality for checking if the given account has Admin role.
     * @param   _account  Address of the account to check the ADMIN_ROLE for.
     * @return  bool.
     */
    function isAdmin(address _account) external view returns (bool) {
        return hasRole(ADMIN_ROLE, _account);
    }

    /**
     * @notice Function to provide functionality for checking if the given account has TRADER_ROLE role.
     * @param   _account  Address of the account to check the TRADER_ROLE for.
     * @return  bool.
     */
    function isTrader(address _account) external view returns (bool) {
        return hasRole(TRADER_ROLE, _account);
    }
}
