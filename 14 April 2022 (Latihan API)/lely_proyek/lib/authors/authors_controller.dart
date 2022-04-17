import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors/authors_model.dart';
import 'package:lely_proyek/authors/authors_provider.dart';
import 'authors_model.dart';

class AuthorsController extends GetxController {
  var authorsList = <Authors>[].obs;

  final nameCont = TextEditingController();
  final emailCont = TextEditingController();

  final provider = AuthorsProvider();

  @override
  void onInit() {
    // TODO: implement onClose
    super.onInit();
    getAll();
  }

  void getAll() async {
    Response response = await provider.getAll();
    List<Authors> newAuthorsList = (response.body as List<dynamic>)
        .map((e) => Authors.fromJson(e))
        .toList();
    authorsList.assignAll(newAuthorsList);
  }

  void create() async {
    Response response = await provider
        .create({'name': nameCont.text, 'email': emailCont.text});
    getAll();
  }

    void updateAuthors(int id) async {
    Response response =
        await provider.update({'id': id, 'name': nameCont.text, 'email': emailCont.text});
    getAll();
  }

      void delete(int id) async {
    Response response = await provider
        .deleteee(<String, dynamic>{'id': id});
    getAll();
  }
}
