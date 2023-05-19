// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    // Do not modify these variables
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime = 1;

    // Optimize this function
    function purchaseToken() external payable {
     if (block.timestamp < lastPurchaseTime) {
            revert();
        } else {
            if (msg.value != 0.1 ether) revert();
            uint256 updatedPurchaseTime;
            uint256 blockTime = block.timestamp;
            assembly {
                updatedPurchaseTime := add(blockTime, 60)
            }
            lastPurchaseTime = updatedPurchaseTime;
        }
}

}
