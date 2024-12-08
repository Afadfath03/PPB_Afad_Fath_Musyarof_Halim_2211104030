import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

/// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // TODO: Tambahkan variabel untuk menyimpan nilai counter
  var counter = 0.obs;

  // TODO: Buat fungsi untuk menambah nilai counter
  void tambahCounter() => counter.value++;

  // TODO: Buat fungsi untuk mereset nilai counter
  void resetCounter() => counter.value = 0;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      body: Center(
        child: Obx(() {
          // TODO: Lengkapi logika untuk menampilkan nilai counter
          return Text(
            "${controller.counter.value}", // Ganti ini dengan nilai counter
            style: const TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk menambah nilai counter
              controller.tambahCounter();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // TODO: Tambahkan logika untuk mereset nilai counter
              controller.resetCounter();
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
