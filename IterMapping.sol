// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IterMapping {
    mapping(string => uint256) public ages;
    string[] public keys;
    mapping(string => bool) public isInserted;

    // Функция будет устанавливать значения для первого мэппинга
    function set(string memory _name, uint256 _age) public {
        ages[_name] = _age;

        // исключаем дублирование ключей
        if (!isInserted[_name]) {
            isInserted[_name] = true;
            keys.push(_name);
        }
    }

    //  Смотрим, какая длинна у нашего мэппинга
    function length() public view returns (uint256) {
        return keys.length;
    }

    // будет брать новый ключ из массива keys, и вытаскиваем возраст
    function get(uint256 _index) public view returns (uint256) {
        string memory key = keys[_index];
        return ages[key];
    }

    // будет вытаскивать все значения этого мэппинга и представлять значения в виде массива
    function values() public view returns (uint256[] memory) {
        uint[] memory vals = new uint[](keys.length);
        for(uint i = 0; i < keys.length; i++) {
            vals[i] = ages[keys[i]];
        }
        return vals;
    }
}