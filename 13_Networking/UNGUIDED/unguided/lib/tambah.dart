import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'model.dart';

class TambahCatatan extends StatelessWidget {
  TambahCatatan({super.key});

  final CatatanController catatanController = Get.find();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: judulController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (judulController.text.isNotEmpty &&
                    deskripsiController.text.isNotEmpty) {
                  Catatan newCatatan = Catatan(
                    judul: judulController.text,
                    deskripsi: deskripsiController.text,
                  );
                  catatanController.addCatatan(newCatatan);
                  Get.back();
                }
              },
              child: const Text('Simpan Catatan'),
            ),
          ],
        ),
      ),
    );
  }
}
