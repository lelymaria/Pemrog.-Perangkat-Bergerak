import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lely_proyek/authors_page.dart';
import 'authors_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: AuthorsPage(),
    ),
  );
}



// void main() {
//   runApp(const LelyProyek());
// }

// class LelyProyek 
//   extends StatelessWidget {
//   const LelyProyek({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Latihan Praktikum 8 PPB",
//       home: Scaffold(
//         appBar: AppBar(
//           title : const Text("Aplikasi Proyek"),
//         ),
//         body: const Text("haiii"),
//       ),
//     );
//   }
// }
