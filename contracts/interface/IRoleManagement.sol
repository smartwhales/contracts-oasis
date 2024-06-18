// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.20;

interface RoleManagementContract{
     function isTrader(address _account) external view returns (bool);
}