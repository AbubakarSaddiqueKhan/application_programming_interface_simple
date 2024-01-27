import 'package:flutter/material.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/todo/todo_api_provider.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/todo/todo_data_model.dart';

class FetchTodoDataDesign extends StatefulWidget {
  const FetchTodoDataDesign({super.key});

  @override
  State<FetchTodoDataDesign> createState() => _FetchTodoDataDesignState();
}

class _FetchTodoDataDesignState extends State<FetchTodoDataDesign> {
  final ToDoApiProvider _toDoApiProvider = ToDoApiProvider();
  Future<List<ToDoAPIModel>>? todoData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Todo's Data"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: todoData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    todoData = _toDoApiProvider.fetchTodos();
                  });
                },
                child: Container(
                  width: 400,
                  height: 80,
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: Text(
                    "Click to fetch Todo",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshot.data![index].id.toString()),
                    ),
                    title: Text(snapshot.data![index].title.toString()),
                    trailing: CircleAvatar(
                        child: Text(snapshot.data![index].userId.toString())),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
