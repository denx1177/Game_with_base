pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "militaryObject.sol";

contract warrior is militaryObject {
    
    constructor(string _inputName, address _valueOwner, address _valueBase) militaryObject(_inputName, _valueOwner, _valueBase) public {
        _defence = 3;
        _attack = 7;
        _health = 12;
    }
}