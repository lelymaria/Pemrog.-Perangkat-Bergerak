import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors_model.dart';
import 'package:lely_proyek/authors_provider.dart';
import 'authors_model.dart';

class AuthorsController extends GetxController {
  var authorsList = <Authors>[].obs;

  final titleCont = TextEditingController();
  final contentCont = TextEditingController();

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
        .create({'title': titleCont.text, 'content': contentCont.text});
    getAll();
  }
}
