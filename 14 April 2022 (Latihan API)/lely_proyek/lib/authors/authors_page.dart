import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors/authors_controller.dart';
import 'package:lely_proyek/authors/create_page.dart';
import 'package:lely_proyek/authors/update_page.dart';

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
                title: Text(controller.authorsList[index].name!),
                subtitle: Text(controller.authorsList[index].email!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(UpdatePage(controller.authorsList[index]));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.delete(controller.authorsList[index].id!.toInt());
                      },
                    ),
                  ],
                ));
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
