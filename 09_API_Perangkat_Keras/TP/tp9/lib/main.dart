import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Latihan Memilih Gambar',
              style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      child: const Icon(
                        Icons.image_outlined,
                        size: 300,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Camera',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(Icons.camera_alt_outlined,
                        color: Colors.white),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(Colors.blue.value)),
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                      child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Gallery',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(Icons.image_outlined, color: Colors.white),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(Colors.blue.value)),
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text(
                        'Hapus Gambar',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(Icons.delete_forever_outlined,
                          color: Colors.white),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(Colors.blue.value)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
