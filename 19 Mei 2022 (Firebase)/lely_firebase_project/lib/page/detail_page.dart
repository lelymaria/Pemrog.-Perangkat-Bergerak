import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lely_firebase_project/model/user.dart';
import 'package:lely_firebase_project/page/edit_page.dart';
import 'package:lely_firebase_project/page/home_page.dart';

class DetailPage extends StatelessWidget {
  final String id;

  DetailPage({required this.id});

  Future<User?> readUser() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(this.id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(this.id);
    return Scaffold(
        appBar: AppBar(
          title: Text('User Detail'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EditPage(
                                id: this.id,
                              ))));
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  final docUser = FirebaseFirestore.instance
                      .collection('users')
                      .doc(this.id);
                  docUser.delete();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User successfully deleted!')));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
        body: FutureBuilder<User?>(
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;

              return user == null
                  ? Center(child: Text("No user"))
                  : buildUser(user);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget buildUser(User user) => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            width: 120,
            child: CircleAvatar(child: Text(user.age.toString())),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    user.name.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy').format(user.birthday),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
