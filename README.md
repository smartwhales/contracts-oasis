# README #

Smart Whale smart contract code base.  


# Deploy contracts

---
- Compile your contract
before doing the actual test you need to compile the contract to see any error in compilation.

```
npm run compile
```

---
- Deploy Role Management contract

```
npm run deploy-role-management
```
---

---
- Deploy  Messaging contract

```
npm run deploy-messaging
```



### Explanation:

Required:

- `RPC_URL` - Saphire RPC URL eg. https://testnet.sapphire.oasis.io or https://1rpc.io/oasis/sapphire
- `DEPLOYER_PRIVATE_KEY` -
- `SUPER_ADMIN_ADDRESS` - 
- `CHAIN_ID` - Saphire chain ID eg. 23294
- `MESSAGE_BUS` - Address came from OASIS doc.
- `ROLE_MANAGEMENT_CONTRACT` - This contract is used for maintaining access control on contracts deployed on sapphire i.e Message contract

Optional (for local debug):
- `MESSAGE` - Is the encoded data for swapping that backend creates (needed only for test)
- `MESSAGING_CONTRACT` - Deployed messaging contract address


First we deploy role management for that we need above.
To deploy these contracts to mainnet we need to have ROSE token in deployer wallet.


### Links
- [Documentation](https://docs.oasis.io/dapp/sapphire/)
- [Explorer](https://explorer.oasis.io/mainnet/sapphire/search)