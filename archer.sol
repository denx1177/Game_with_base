pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "militaryObject.sol";

contract archer is militaryObject {

    constructor(string _input, address _valueOwner, address _valueBase) militaryObject(_input, _valueOwner, _valueBase) public {
        _defence = 2;
        _attack = 10;
        _health = 9;
    }
}
