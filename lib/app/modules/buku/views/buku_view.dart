import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/buku_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN),
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: controller.obx(
            (state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  "${state[index].judul}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Penulis: ${state[index].penulis}",
                  style: TextStyle(fontSize: 14),
                ),
                  trailing:ElevatedButton(
                      child: Text("Pinjam"),
                      onPressed: (){
                        Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                        'id':(state[index].id??0).toString(),
                        'judul' : state[index].judul??"-"
                        });
                        }
                  ),
                onTap: () {
                  // Add any action on tap if needed
                },
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}