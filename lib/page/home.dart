import 'package:flutter/material.dart';
import '../model/todo.dart';

var todoList = [
  Todo(state: true, task: 'ทำการบ้านครั้งที่ 4 วิชา Mobile App Dev'),
  Todo(state: false, task: 'ทำการบ้านครั้งที่ 5 วิชา Mobile App Dev'),
  Todo(state: false, task: 'ทำโปรเจค วิชา Mobile App Dev'),
];

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Row(
        children: [
          Icon(Icons.check_box),
          Text(' My ToDo'),
        ],
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, i) {
                  var value = todoList[i].state;
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 8.0, right: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        todoList[i].state = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${todoList[i].task}',
                                      style: TextStyle(
                                          decoration: value
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              onTap: () {
                                setState(() {
                                  todoList.removeAt(i);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: input,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter new ToDo',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      child: InkWell(
                        hoverColor: Colors.blue[100],
                        onTap: () {
                          if (input.text.length > 0)
                            setState(
                              () {
                                todoList.add(Todo(
                                  state: false,
                                  task: input.text,
                                ));
                                input.clear();
                              },
                            );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ADD',
                            style: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
