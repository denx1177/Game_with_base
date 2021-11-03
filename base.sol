pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObject.sol";

contract base is gameObject {

    uint public _indexGlobal = 0;
    mapping (uint => address) public _unitList;
    
    constructor(string _input, address _valueOwner) gameObject(_input, _valueOwner) public {
        _defence = 5;
        _health = 20;
    }
    function addMilitaryUnit(address _passKey) external override {
        require(_passKey == _ownerAddress, 109);
        tvm.accept();
        _indexGlobal ++;
        _unitList[_indexGlobal] = msg.sender;
    }
    function deleteMilitaryUnit(address _passKey) external override {
        require(_passKey == _ownerAddress, 132);
        tvm.accept();
        for((uint _key, address _value) : _unitList){
            if (_unitList[_key] == msg.sender) {
                delete _unitList[_key];
                return;
            }
        }
    }
    function death() internal override {
        tvm.accept();
        for((uint _key, address _value) : _unitList) {
            gameObjectInterface(_unitList[_key]).baseDeath(_attakingAddress);
            delete _unitList[_key];
        }
        selfDestroy(_attakingAddress);
    }
}