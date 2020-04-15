import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/pages/TodoTypeSelector.dart';
import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}
// TEAM: 
//        WILSON TOVAR
//        DAVID CUENTAS
class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String _dropSelected = "DEFAULT";
  String selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AlertDialog(
          backgroundColor: Colors.yellow[200],
          title: Text(
            'New todo',
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 20.0),
          ),
          content: Column(
            children: <Widget>[
              TextField(
                controller: controllerTitle,
              ),
              TextField(
                controller: controllerBody,
              ),
              TodoTypeSelector(
                selected: _dropSelected,
                onChangedValue: (value) => setState(() {
                  _dropSelected = value;
                }),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                Icon icon;
                switch (_dropSelected) {
                  case 'DEFAULT':
                    icon = Icon(Icons.check);
                    break;
                  case 'CALL':
                    icon = Icon(Icons.call);
                    break;
                  case 'HOME_WORK':
                    icon = Icon(Icons.contacts);
                    break;
                  default:
                    icon = Icon(Icons.dialpad);
                    break;
                }
                final todo = new Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                  icon: icon,
                );
                controllerTitle.clear();
                controllerBody.clear();
                Navigator.of(context).pop(todo);
              },
            ),
          ],
        ),
      ],
    );
  }
}
