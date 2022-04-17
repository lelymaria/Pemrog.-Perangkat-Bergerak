import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors/authors_controller.dart';
import 'package:lely_proyek/authors/authors_model.dart';

class UpdatePage extends StatelessWidget {
  final controller = Get.find<AuthorsController>();

  final Authors authors;
  UpdatePage(this.authors);

  @override
  Widget build(BuildContext context) {
    controller.nameCont.text = authors.name!;
    controller.emailCont.text = authors.email!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Authors'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: controller.nameCont,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: controller.emailCont,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  controller.updateAuthors(authors.id!.toInt());
                  Get.back();
                },
              )
            ],
          )),
    );
  }
}
