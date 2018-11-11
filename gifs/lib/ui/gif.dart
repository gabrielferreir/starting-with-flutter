import 'package:flutter/material.dart';

class Gif extends StatelessWidget {

  final Map _gifData;

  Gif(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._gifData['title']),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(this._gifData['images']['fixed_height']['url']),
      ),
    );
  }
}

