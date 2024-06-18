// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.20;

import "./message/framework/MessageApp.sol";
import "./interface/IRoleManagement.sol";

contract Messaging is MessageApp {
    address public roleManagementContract;

    constructor(address _messageBus, address _roleManagementContract ) MessageApp(_messageBus) {
     roleManagementContract = _roleManagementContract;
    }

 /**
     * @notice Function to send trading signal on cross chain trading contarct.
     * @param _dstContract Trading Contract address.
     * @param _dstChainId Trading Contract chain id.
     * @param _message Message to be sent on trading contract.
     */
    function tradeSignal(
        address _dstContract,
        uint64 _dstChainId,
        bytes calldata _message
    ) external payable {
        require(RoleManagementContract(roleManagementContract).isTrader(msg.sender), "Not Authorized");
        bytes memory message = abi.encode(msg.sender, _message);
        sendMessage(_dstContract, _dstChainId, message, msg.value);
    }

}