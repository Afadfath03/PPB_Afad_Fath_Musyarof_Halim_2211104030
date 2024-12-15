import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class PageHome extends StatelessWidget {
  PageHome({super.key});
  final CatatanController catatanController = Get.put(CatatanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Daftar Catatan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to('/tambah');
            },
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: catatanController.catatanList.length,
          itemBuilder: (context, index) {
            var catatan = catatanController.catatanList[index];
            return ListTile(
              title: Text(catatan.judul),
              subtitle: Text(catatan.deskripsi),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  catatanController.deleteCatatan(index);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
