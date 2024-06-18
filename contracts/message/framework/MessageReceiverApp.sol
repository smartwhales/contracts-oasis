// SPDX-License-Identifier: GPL-3.0-only

pragma solidity >=0.8.0;

import "../interfaces/IMessageReceiverApp.sol";
import "../libraries/MsgDataTypes.sol";
import "./MessageBusAddress.sol";

abstract contract MessageReceiverApp is IMessageReceiverApp, MessageBusAddress {
    modifier onlyMessageBus() {
        require(msg.sender == messageBus, "caller is not message bus");
        _;
    }

    // Add abort prefix in the reason string for require or revert.
    // This will abort (revert) the message execution without markig it as failed state,
    // making it possible to retry later.
    function _abortReason(string memory reason) internal pure returns (string memory) {
        return MsgDataTypes.abortReason(reason);
    }

    /**
     * @notice Called by MessageBus to execute a message
     * @param _sender The address of the source app contract
     * @param _srcChainId The source chain ID where the transfer is originated from
     * @param _message Arbitrary message bytes originated from and encoded by the source app contract
     * @param _executor Address who called the MessageBus execution function
     */
    function executeMessage(
        address _sender,
        uint64 _srcChainId,
        bytes calldata _message,
        address _executor
    ) external payable virtual override onlyMessageBus returns (ExecutionStatus) {}

}