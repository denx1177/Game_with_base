pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObjectInterface.sol";

abstract contract gameObject is gameObjectInterface {

    string _name;
    int public _defence;
    int public _health;
    address public _attakingAddress;
    address public _ownerAddress;
 
    constructor(string _inputName, address _valueOwner) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        _name = _inputName;
        _ownerAddress = _valueOwner;
    }
    //gameObject external methods
    function takeAttack(int _valueAttack) external override {
        tvm.accept();
        _attakingAddress = msg.sender;
        int _damage = _valueAttack - _defence;
        if (_damage > 0) { _health = _health - _damage; }
        if (haveNoHealth()) { death(); }
    }
    // militaryObject external methods
    function attack(address) virtual external override {}
    function baseDeath(address _attakingAddress) virtual external override {}
    // stationObject external methods
    function addMilitaryUnit(address) virtual external override {}
    function deleteMilitaryUnit(address) virtual external override {}
    // gameObject internal methods
    function haveNoHealth() internal returns (bool) {
        tvm.accept();
        if (_health < 1) { return true; }
        else { return false; }
    }
    function death() virtual internal {}

    function selfDestroy(address _transferAddr) internal {
        tvm.accept();
        _transferAddr.transfer(10, false, 160);
    }
    modifier checkOwnAndValue (int _value) {
        //require(msg.sender == _ownerAddress, 122);
        require(_value >= 0, 110);
        tvm.accept();
        _;
    }
    function getProtection(int _value) public checkOwnAndValue(_value)  {
        _defence =  _value;
    }
        
}