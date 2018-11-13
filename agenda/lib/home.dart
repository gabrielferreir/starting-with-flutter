import 'dart:io';
import 'package:agenda/contact.dart';
import 'package:agenda/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

    _getAllContacts();
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
          onPressed: () {
            _showContactPage();
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
        ),
        body: _listView(context));
  }

  Widget _listView(BuildContext context) {
    return contacts.length > 0
        ? ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return _contactCard(context, index);
            })
        : _viewEmpty(context);
  }

  Widget _viewEmpty(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.person_add,
            size: 180.0,
            color: Colors.black12,
          ),
          onTap: () {
            _showContactPage();
          },
        )
      ],
    );
  }


  void _showOptions(BuildContext context, int index) {
    showModalBottomSheet(context: context, builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text('Ligar', style: TextStyle(color: Colors.red, fontSize: 16.0),),
                    onPressed: () {
                      launch('tel:${contacts[index].phone}');
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text('Editar', style: TextStyle(color: Colors.red, fontSize: 16.0),),
                    onPressed: () {
                      Navigator.pop(context);
                      _showContactPage(contact: contacts[index]);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    child: Text('Excluir', style: TextStyle(color: Colors.red, fontSize: 16.0),),
                    onPressed: () {
                      helper.deleteContact(contacts[index].id);
                      setState(() {
                        contacts.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
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
                    Text(
                      this.contacts[index].name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(this.contacts[index].email,
                        style: TextStyle(fontSize: 14.0)),
                    Text(this.contacts[index].phone,
                        style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showOptions(context, index);
      },
    );
  }

//  Widget _contactImage(BuildContext context, int index) {
//    print(context);
//
//    return Container(
//      width: 64.0,
//      height: 64.0,
//      decoration: BoxDecoration(
//        shape: BoxShape.circle,
//        color: Colors.blueAccent,
//      ),
//      child: this.contacts[index].img == null
//          ? Icon(
//              Icons.person,
//              color: Colors.white,
//            )
//          : Image(
//              image: FileImage(File(this.contacts[index].img)),
//            ),
//    );
//  }

  Widget _contactImage(BuildContext context, int index) {
    return Container(
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
        image: this.contacts[index].img != null ? new DecorationImage(image: FileImage(File(this.contacts[index].img)), fit: BoxFit.cover) : null,
      ),
      child: this.contacts[index].img == null
          ? Icon(
        Icons.person,
        color: Colors.white,
      )
          : null,
    );
  }

  void _showContactPage({Contact contact}) async {
    final recContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ContactPage(contact: contact)));
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((onValue) {
      setState(() {
        contacts = onValue;
      });
    });
  }
}
