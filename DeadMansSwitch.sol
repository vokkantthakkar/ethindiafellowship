pragma solidity ^0.5.0 ;



contract DeadMansSwitch{
    
    
    address admin ;
    address payable receiver ;
    uint currentblocknumber ;
    uint amount ;
    
    
    function () payable external onlyAdmin {
    }
    
    modifier onlyAdmin() {
        require(admin == msg.sender) ;
        currentblocknumber = block.number ;
        _ ;
    }
    modifier onlyReceiver() {
        require(receiver == msg.sender) ;
        _ ;
    }
    
    constructor (address payable _receiver) public {
        admin = msg.sender ;
        receiver = _receiver ;
        currentblocknumber = block.number ;
    }

    function StillAlive() public onlyAdmin {}
    
    function process() public onlyReceiver {
        require(block.number >= currentblocknumber + 10) ;
        
        selfdestruct(receiver) ;
    }
}
