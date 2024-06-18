const { expect } = require('chai');
const { upgrades, ethers } = require('hardhat');
const { Contract } = require('hardhat/internal/hardhat-network/stack-traces/model');

require('dotenv');

describe("Test messaging functionality", async function(){
    let messagingContractInstance;

    beforeEach(async function(){
        const messaging = await ethers.getContractFactory('Messaging');
        messagingContractInstance = messaging.attach(process.env.MESSAGING_CONTRACT)
    })
    
    it("Send Message",async function(){
        console.log("lebth",process.env.TRADING_CONTRACT,process.env.CHAIN_ID)
        const tx =await messagingContractInstance.tradeSignal(process.env.TRADING_CONTRACT,process.env.CHAIN_ID,
            process.env.MESSAGE,{
            value: 100000000000000 + process.env.MESSAGE.length * 1000000000000
        })
        console.log("tx",tx)
    })
})