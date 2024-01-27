import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/users/users_api_provider.dart';
import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/users/users_data_model.dart';

class UsersDataDesign extends StatefulWidget {
  const UsersDataDesign({super.key});

  @override
  State<UsersDataDesign> createState() => _UsersDataDesignState();
}

Random random = Random();

class _UsersDataDesignState extends State<UsersDataDesign> {
  final UsersApiProvider _usersApiProvider = UsersApiProvider();
  Future<List<UsersAPIModel>>? usersData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch User's Data"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: usersData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return InkWell(
                onTap: () {
                  setState(() {
                    usersData = _usersApiProvider.fetchUsersData();
                  });
                },
                child: Container(
                  width: 300,
                  height: 60,
                  alignment: Alignment.center,
                  color: Colors.brown,
                  child: Text(
                    "Fetch user's data",
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
                  return Container(
                    height: 600,
                    width: double.infinity,
                    color: Color.fromARGB(
                        random.nextInt(0xFF),
                        random.nextInt(0xFF),
                        random.nextInt(0xFF),
                        random.nextInt(0xFF)),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 250,
                          alignment: Alignment.center,
                          color: Color.fromARGB(
                              random.nextInt(0xFF),
                              random.nextInt(0xFF),
                              random.nextInt(0xFF),
                              random.nextInt(0xFF)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  snapshot.data![index].address!.city
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.brown)),
                              Container(
                                height: 80,
                                color: Color.fromARGB(
                                    random.nextInt(0xFF),
                                    random.nextInt(0xFF),
                                    random.nextInt(0xFF),
                                    random.nextInt(0xFF)),
                                child: Column(
                                  children: [
                                    Text(
                                        snapshot.data![index].address!.geo!.lat
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blueGrey)),
                                    Text(
                                        snapshot.data![index].address!.geo!.lng
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blueGrey)),
                                  ],
                                ),
                              ),
                              Text(
                                  snapshot.data![index].address!.street
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.amber)),
                              Text(
                                  snapshot.data![index].address!.suite
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.indigo)),
                              Text(
                                  snapshot.data![index].address!.zipcode
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.cyan)),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          color: Color.fromARGB(
                              random.nextInt(0xFF),
                              random.nextInt(0xFF),
                              random.nextInt(0xFF),
                              random.nextInt(0xFF)),
                          child: Column(
                            children: [
                              Text(snapshot.data![index].company!.bs.toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.amber)),
                              Text(
                                  snapshot.data![index].company!.catchPhrase
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.amber)),
                              Text(
                                  snapshot.data![index].company!.name
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.amber)),
                            ],
                          ),
                        ),
                        Text(
                          snapshot.data![index].id.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        Text(snapshot.data![index].email.toString(),
                            style:
                                TextStyle(fontSize: 22, color: Colors.green)),
                        Text(snapshot.data![index].name.toString(),
                            style:
                                TextStyle(fontSize: 25, color: Colors.amber)),
                        Text(
                          snapshot.data![index].phone.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ],
                    ),
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
