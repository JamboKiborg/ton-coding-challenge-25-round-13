// Wrong design: simulates user balances but never cleans old entries

contract TactStorageLeak {
    map<Address, Int> public balances;

    receive() {
        let caller = msg.sender;
        let prev = self.balances.get(caller) ?? 0;
        self.balances.set(caller, prev + 100);
    }
}
