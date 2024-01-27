import 'package:flutter/material.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/posts/post_api_provider.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/posts/post_data_model.dart';

class FetchPostsDesign extends StatefulWidget {
  const FetchPostsDesign({super.key});

  @override
  State<FetchPostsDesign> createState() => _FetchPostsDesignState();
}

class _FetchPostsDesignState extends State<FetchPostsDesign> {
  final PostAPiProvider _postAPiProvider = PostAPiProvider();
  Future<List<PostsAPIModel>>? postsdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Posts Data Design"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: postsdata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    postsdata = _postAPiProvider.fetchPosts();
                  });
                },
                child: Container(
                  width: 300,
                  height: 70,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    "Click to Fetch Albums",
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
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
                    subtitle: Text(snapshot.data![index].body.toString()),
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
