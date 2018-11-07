import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _search;
  int offset = 0;

  _getGifs() async {
    http.Response response;
    if(_search == null)
      response = await http.get('https://api.giphy.com/v1/gifs/trending?api_key=q54ujXX29NGmy5y03B5ACMr5jtx2Cqtz&limit=20&rating=G');
    else
      response = await http.get('https://api.giphy.com/v1/gifs/search?api_key=q54ujXX29NGmy5y03B5ACMr5jtx2Cqtz&q=${_search}&limit=20&offset=${offset}&rating=G&lang=en');

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network('https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
    );
  }
}
