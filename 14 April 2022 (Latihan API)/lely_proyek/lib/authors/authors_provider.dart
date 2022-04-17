import 'package:get/get.dart';

class AuthorsProvider extends GetConnect {
  String url = 'http://192.168.100.8:8000/api/authors';

  Future<Response> getAll() => get(url);
  Future<Response> create(Map data) => post(url, data);
  Future<Response> update(Map data) => put(url, data);
  Future<Response> deleteee(Map data) => post(url + '/delete', data);
}
