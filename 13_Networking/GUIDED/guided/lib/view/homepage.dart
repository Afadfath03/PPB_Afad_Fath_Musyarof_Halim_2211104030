import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided/view_model/counter_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Counter App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Lu dah klik segini bang",
                style: TextStyle(fontSize: 24),
              ),
              Text(
                controller.counter.value.toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.tambahCounter();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              controller.resetCounter();
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Get.toNamed("/detail"),
            child: const Icon(Icons.details_rounded),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => getsnack(),
              child: const Icon(Icons.question_answer_rounded)),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => getbottomshet(),
              child: const Icon(Icons.question_answer_rounded)),
        ],
      ),
    );
  }

  void getsnack() {
    Get.snackbar(
      "INI SNACKBAR",
      "INI ISINYA",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void getbottomshet() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.wb_sunny),
              title: const Text("Light Theme"),
              onTap: () {
                Get.changeTheme(ThemeData.light());
              },
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round),
              title: const Text("Dark Theme"),
              onTap: () {
                Get.changeTheme(ThemeData.dark());
              },
            ),
            ListTile(
              leading: const Icon(Icons.nightlight_round),
              title: const Text("Pink Theme"),
              onTap: () {
                Get.changeTheme(ThemeData.light().copyWith(
                    colorScheme:
                        ColorScheme.fromSwatch(primarySwatch: Colors.pink)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
