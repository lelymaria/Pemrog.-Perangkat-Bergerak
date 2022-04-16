import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors_controller.dart';
import 'package:lely_proyek/create_page.dart';

class AuthorsPage extends StatelessWidget {
  // const AuthorPage({Key? key}) : super(key: key);

  final controller = Get.put(AuthorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Authors'),
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: controller.authorsList.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.authorsList[index].title),
              subtitle: Text(controller.authorsList[index].content),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(CreatePage());
        },
      ),
    );
  }
}
