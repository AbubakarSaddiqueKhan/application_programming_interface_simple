import 'package:flutter/material.dart';

import 'universities_api_provider.dart';
import 'universities_data_model.dart';

class FetchUniversityDataDesign extends StatefulWidget {
  const FetchUniversityDataDesign({super.key});

  @override
  State<FetchUniversityDataDesign> createState() =>
      _FetchUniversityDataDesignState();
}

class _FetchUniversityDataDesignState extends State<FetchUniversityDataDesign> {
  final UniversitiesApiProvider _universitiesApiProvider =
      UniversitiesApiProvider();
  Future<List<UniversitiesDataModel>>? universities;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch University Data Design"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: universities,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    universities =
                        _universitiesApiProvider.fetchUniversitiesData();
                  });
                },
                child: Container(
                  width: 400,
                  height: 80,
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: Text(
                    "Fetch Universities Data",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(snapshot.data![index].name.toString()),
                      title: Text(snapshot.data![index].country.toString()),
                      subtitle:
                          Text(snapshot.data![index].alphaTwoCode.toString()),
                      trailing:
                          Text(snapshot.data![index].stateProvince.toString()),
                    );
                  },
                );
              } else {
                return Text(
                  "Oops !! No Data Found",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.purple.shade400),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
