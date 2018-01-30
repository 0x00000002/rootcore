const Managed = artifacts.require('Managed.sol');
// const 

contract('Contract: Managed--Burce Li',(accounts) => {
    beforeEach( async () => {
        let managed = Managed.new();
        let manager;
        let newManager;
    }
    it("Test constructor", async () => {
        manager = managed.managed.call();
        assert.equal(manager, accounts[0]);
    })

    it("transferManagement, new manager should be account[1]", async () => {
        managed.transferManagement.call(accounts[1]);
        newManager = managed.newManager.call();
        assert.equal(newManager, accounts[1]);
    })

    it("transferManagement, msg.sender is not controller, should throw.", async () => {
        managed.transferManagement.call({from: account[1]}, accounts[1]);
        newManager = managed.newManager.call();
        assert.equal(newManager, 0x0);
    })

    it("", async () => {
        managed.transferManagement.call(accounts[1]);
        managed.acceptManagement.call({from:accounts[1]});
    })
    )
})
