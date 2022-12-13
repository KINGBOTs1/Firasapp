import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'api/api.dart';

class Detail extends StatefulWidget {
  String? gambar,
      deskripsi,
      judul,
      ayat,
      ayat2,
      latin,
      latin2,
      arti,
      arti2,
      artiayat,
      artiayat2,
      bagian1,
      bagian2;

  Detail({
    Key? key,
    this.gambar,
    this.deskripsi,
    this.judul,
    this.ayat,
    this.ayat2,
    this.latin,
    this.latin2,
    this.arti,
    this.arti2,
    this.artiayat,
    this.artiayat2,
    this.bagian1,
    this.bagian2,
  }) : super(key: key);
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
        title: Text(widget.judul!),
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
            left: 15,
            right: 15.0,
            bottom: 40.0,
          ),
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: Image(
                  image: NetworkImage(widget.gambar!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.deskripsi!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  widget.ayat!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 10.0,
                ),
                child: Text(
                  widget.latin!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Text(widget.artiayat!),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 10.0,
                ),
                child: Text(
                  widget.arti!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 20.0,
                ),
                child: Text(
                  widget.ayat2!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 10.0,
                ),
                child: Text(
                  widget.latin2!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Text(widget.artiayat2!),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 10.0,
                  bottom: 20.0,
                ),
                child: Text(
                  widget.arti2!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
