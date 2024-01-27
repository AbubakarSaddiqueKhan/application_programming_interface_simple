import 'package:flutter/material.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/photos/photos_api_provider.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/photos/photos_data_model.dart';

class FetchPhotosDataDesign extends StatefulWidget {
  const FetchPhotosDataDesign({super.key});

  @override
  State<FetchPhotosDataDesign> createState() => _FetchPhotosDataDesignState();
}

class _FetchPhotosDataDesignState extends State<FetchPhotosDataDesign> {
  PhotosApiProvider _photosApiProvider = PhotosApiProvider();

  Future<List<PhotosAPIModel>>? photosDataModelList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Photos Data"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: photosDataModelList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    photosDataModelList = _photosApiProvider.fetchPhotos();
                  });
                },
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    "Fetch Photos",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
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
                    title: Text(
                      snapshot.data![index].thumbnailUrl.toString(),
                      style: TextStyle(color: Colors.yellow, fontSize: 20),
                    ),
                    // title: SizedBox(
                    //   // width: 500,
                    //   // height: 300,
                    //   child: Image.network(
                    //     snapshot.data![index].thumbnailUrl.toString(),
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    subtitle: Text(
                      snapshot.data![index].url.toString(),
                    ),
                    // subtitle: SizedBox(
                    //     // width: 400,
                    //     // height: 200,
                    //     child: Image.network(
                    //   snapshot.data![index].url.toString(),
                    //   fit: BoxFit.cover,
                    // )),
                    trailing: Text(snapshot.data![index].title.toString()),
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
