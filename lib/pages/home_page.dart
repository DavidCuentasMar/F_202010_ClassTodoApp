import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';

import 'new_todo_dialog.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Add task',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return Dismissible(
          child: _item(element, posicion),
          background: Container(
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      'DELETE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(),
                  )
                ],
              ),
            ),
            color: Colors.red,
          ),
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              todos.removeAt(posicion);
            });
          },
        );
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    //return Text('$posicion');
    return GestureDetector(
      onTap: () {
        setState(() {
      		if (element.completed == 0) {
        		element.completed = 1;
          }
        });
      },
      child: Card(
        color: element.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: element.icon,
              title: Text(element.title),
              subtitle: Text(element.body),
            ),
          ],
        ),
      ),
    );
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }
}
