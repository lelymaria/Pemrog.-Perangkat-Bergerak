import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors/authors_controller.dart';

class CreatePage extends StatelessWidget {
  final controller = Get.find<AuthorsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Authors'),
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
                  controller.create();
                  Get.back();
                },
              )
            ],
          )),
    );
  }
}
