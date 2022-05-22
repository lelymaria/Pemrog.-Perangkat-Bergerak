import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lely_firebase_project/model/user.dart';
import 'package:lely_firebase_project/page/detail_page.dart';

class EditPage extends StatefulWidget {
  final String id;

  EditPage({required this.id});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget name(String name) => TextFormField(
          controller: controllerName..text = name,
          decoration: InputDecoration(labelText: "Name"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter name";
            }
            return null;
          },
        );

    Widget age(String age) => TextFormField(
          controller: controllerAge..text = age,
          decoration: InputDecoration(labelText: "Age"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter age";
            }
            return null;
          },
        );

    Widget birthday(DateTime birthday) => DateTimeField(
          controller: controllerDate
            ..text = DateFormat('yyyy-MM-dd').format(birthday),
          decoration: InputDecoration(labelText: "Birthday"),
          format: DateFormat('yyyy-MM-dd'),
          onShowPicker: (BuildContext context, DateTime? currentValue) {
            return showDatePicker(
                context: context,
                initialDate: currentValue ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
          },
        );

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Author"),
      ),
      body: FutureBuilder<User?>(
        future: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final author = snapshot.data;

            return author == null
                ? Center(child: Text("No User"))
                : ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    children: [
                      name(author.name.toString()),
                      age(author.age.toString()),
                      birthday(author.birthday!),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final docAuthor = FirebaseFirestore.instance
                              .collection('users')
                              .doc("${author.id}");

                          docAuthor.update({
                            "name": controllerName.text,
                            "age": controllerAge.text,
                            "birthday":
                                DateTime.parse(controllerDate.text),
                          });

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(id: author.id.toString());
                          }));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('User successfully updated!')));
                        },
                        child: Text("Save"),
                      )
                    ],
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

    Future<void> saveUser(String id) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(id);

    docUser.update({
      "name": controllerName.text,
      "age": controllerAge.text,
      "birthday": controllerDate.text,
    });
  }

  Future<User?> readUser() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
    return null;
  }
}