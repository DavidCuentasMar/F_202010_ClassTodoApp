import 'package:flutter/material.dart';

class TodoTypeSelector extends StatelessWidget {

  const TodoTypeSelector({
    this.selected,
    this.onChangedValue,
  });

  final String selected;
  final ValueChanged<String> onChangedValue;


  @override
  Widget build(BuildContext context) {
    print(selected);
    return DropdownButton<String>(
      value: selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: Colors.deepPurple
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue){
        onChangedValue(newValue);
      },
      items: <String>['DEFAULT', 'CALL', 'HOME_WORK']
      .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
      .toList(),
    );
  }
}