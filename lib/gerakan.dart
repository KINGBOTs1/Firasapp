import 'dart:convert';

import 'package:apitia/Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api/api.dart';

class Gerakan extends StatefulWidget {
  const Gerakan({Key? key}) : super(key: key);

  @override
  State<Gerakan> createState() => _GerakanPageState();
}

class _GerakanPageState extends State<Gerakan> {
  Future<List<dynamic>?> _fetchData() async {
    var resault = await http.get(
      Uri.parse(BaseURL.api!),
    );
    final res = json.decode(resault.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerakan Wudhu'),
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
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 15,
                          right: 15.0,
                          bottom: 1.0,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        gambar: snapshot.data![index]['gambar'],
                                        deskripsi: snapshot.data![index]
                                            ['deskripsi'],
                                        judul: snapshot.data![index]['judul'],
                                        ayat: snapshot.data![index]['ayat'],
                                        latin: snapshot.data![index]['latin'],
                                        arti: snapshot.data![index]['arti'],
                                        ayat2: snapshot.data![index]['ayat2'],
                                        latin2: snapshot.data![index]['latin2'],
                                        arti2: snapshot.data![index]['arti2'],
                                        artiayat: snapshot.data![index]
                                            ['artiayat'],
                                        artiayat2: snapshot.data![index]
                                            ['artiayat2'],
                                        bagian1: snapshot.data![index]
                                            ['bagian1'],
                                        bagian2: snapshot.data![index]
                                            ['bagian2'],
                                      )),
                            );
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Image(
                                  height: 125,
                                  image: NetworkImage(
                                      snapshot.data![index]['gambar']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    snapshot.data![index]['judul'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
      backgroundColor: Colors.red,
    );
  }
}
