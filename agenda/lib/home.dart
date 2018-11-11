import 'dart:io';

import 'package:agenda/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();
//    Contact c = Contact();
//    c.name = 'Pazuzu';
//    c.email = 'pazuzu@smn.com.br';
//    c.phone = '123456789';
//    c.img = 'img';
//
//    helper.saveContact(c);

    helper.getAllContacts().then((onValue) {
//      print(onValue);
      setState(() {
        contacts = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contatos'),
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return _contactCard(context, index);
//              return Text(contacts[index].name);
            }));
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              _contactImage(context, index),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.contacts[index].name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    Text(this.contacts[index].email, style: TextStyle(fontSize: 14.0)),
                    Text(this.contacts[index].phone, style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactImage(BuildContext context, int index) {
    print(context);

    return Container(
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
      ),
      child: this.contacts[index].img == 'paz'
          ? Icon(
              Icons.person,
              color: Colors.white,
            )
          : Image(
              image: FileImage(File(this.contacts[index].img)),
            ),
    );
  }
}
