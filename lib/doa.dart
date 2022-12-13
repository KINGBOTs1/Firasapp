import 'dart:convert';

import 'package:flutter/material.dart';
import 'api/api.dart';
import 'package:http/http.dart' as http;

class Doa extends StatefulWidget {
  const Doa({Key? key}) : super(key: key);
  _DoaState createState() => _DoaState();
}

class _DoaState extends State<Doa> {
  Future<List<dynamic>?> _fetchData() async {
    var resault = await http.get(
      Uri.parse(BaseURL.apidoa!),
    );
    final res = json.decode(resault.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa'),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>?>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 90.0,
                    left: 20.0,
                    right: 20.0,
                    bottom: 90.0,
                  ),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            top: 10.0,
                          ),
                          child: Text(
                            snapshot.data![index]['judul'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 50.0,
                          ),
                          child: Text(
                            snapshot.data![index]['ayat'],
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            left: 10.0,
                          ),
                          child: Text(
                            snapshot.data![index]['latin'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                            left: 10.0,
                          ),
                          child: Text(
                            'Artinya :',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            left: 10.0,
                            bottom: 30.0,
                          ),
                          child: Text(
                            snapshot.data![index]['arti'],
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
