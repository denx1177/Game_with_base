
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface gameObjectInterface {
    function takeAttack(int _valueAttack)  external;
    function attack(address _address)  external;
    function baseDeath(address _attakingAddress)  external;
    function addMilitaryUnit(address _passKey)  external;
    function deleteMilitaryUnit(address _passKey)  external;
}
