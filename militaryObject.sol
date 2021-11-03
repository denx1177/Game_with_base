pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObject.sol";

contract militaryObject is gameObject {

    int public _attack;
    address public _baseAddress;

    constructor (string _inputName, address _valueOwner, address _valueBase) gameObject(_inputName, _valueOwner) public {
        _baseAddress = _valueBase;
        gameObjectInterface(_valueBase).addMilitaryUnit(_valueOwner);
        
    }

    function getAttackPower(int _value)  public checkOwnAndValue(_value) {
        _attack = _value;
    }
    function attack(address _address) external override {
        require(msg.sender == _ownerAddress, 109);
        tvm.accept();
        gameObjectInterface(_address).takeAttack(_attack);
    }
    function baseDeath(address _attakingAddress) external override {
        require(msg.sender == _baseAddress);
        tvm.accept();
        selfDestroy(_attakingAddress);
    }
    function death() internal override {
        tvm.accept();
        gameObjectInterface(_baseAddress).deleteMilitaryUnit(_ownerAddress);
        selfDestroy(_attakingAddress);
    }
}
