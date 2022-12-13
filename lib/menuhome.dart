import 'package:flutter/material.dart';
import 'gerakan.dart';
import 'niat.dart';
import 'doa.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: const Text(
            'Tata Cara Berwudhu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: GridView.count(
        childAspectRatio: 3,
        padding: const EdgeInsets.only(
          top: 100,
        ),
        crossAxisCount: 1,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              right: 5.0,
              left: 10.0,
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
              color: Colors.lightGreenAccent,
              margin: const EdgeInsets.all(
                5,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Niat(),
                    ),
                  );
                },
                splashColor: Colors.pinkAccent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.list_alt_outlined,
                        size: 70,
                      ),
                    ),
                    Text(
                      'Niat',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              right: 5.0,
              left: 10.0,
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
              color: Colors.redAccent,
              margin: const EdgeInsets.all(
                5,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Gerakan(),
                    ),
                  );
                },
                splashColor: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.list_alt_outlined,
                        size: 70,
                      ),
                    ),
                    Text(
                      'Gerakan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              right: 5.0,
              left: 10.0,
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
              color: Colors.lightBlueAccent,
              margin: const EdgeInsets.all(
                5,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Doa(),
                    ),
                  );
                },
                splashColor: Colors.lightBlueAccent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.list_alt_outlined,
                        size: 70,
                      ),
                    ),
                    Text(
                      'Doa',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
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
  }
}
