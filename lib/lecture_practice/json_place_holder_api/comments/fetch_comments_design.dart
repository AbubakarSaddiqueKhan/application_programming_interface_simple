import 'package:flutter/material.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/comments/comments_api_provider.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/comments/comments_data_model.dart';

class FetchCommentsDesign extends StatefulWidget {
  const FetchCommentsDesign({super.key});

  @override
  State<FetchCommentsDesign> createState() => _FetchCommentsDesignState();
}

CommentsAPIProvider _commentsAPIProvider = CommentsAPIProvider();
Future<List<CommentsAPIModel>>? commentsDataList;

class _FetchCommentsDesignState extends State<FetchCommentsDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Comments Data"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: commentsDataList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    commentsDataList = _commentsAPIProvider.fetchComments();
                  });
                },
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  color: Colors.purple,
                  child: Text(
                    "Fetch Comments",
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshot.data![index].id.toString()),
                    ),
                    title: Text(snapshot.data![index].name.toString()),
                    subtitle: Text(snapshot.data![index].body.toString()),
                    trailing: Text(snapshot.data![index].email.toString()),
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
