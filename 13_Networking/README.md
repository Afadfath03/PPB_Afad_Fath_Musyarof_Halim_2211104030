# PERTEMUAN KE 13

## NETWORKING

---

### GUIDED

1. main

   ``` dart
    import 'package:flutter/material.dart';
    import 'package:get/get.dart';
    import 'package:guided/view/detail.dart';
    import 'package:guided/view/homepage.dart';

    void main() {
    runApp(const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyMain(),
    ));
    }

    class MyMain extends StatelessWidget {
    const MyMain({super.key});

    @override
    Widget build(BuildContext context) {
        return GetMaterialApp(
        initialRoute: "/",
        getPages: [
            GetPage(name: "/", page: () => HomePage(title: "Counter App")),
            GetPage(name: "/detail", page: () => DetailPage(title: "Detail Page")),
        ],
        debugShowCheckedModeBanner: false,
        home: HomePage(title: "Counter App"),
        );
    }
    }
   ```

2. controller

   ``` dart
    import 'package:get/get.dart';

    class CounterController extends GetxController {
    var counter = 0.obs;

    void tambahCounter() => counter.value++;

    void resetCounter() => counter.value = 0;
    }
   ```

3. detail

   ``` dart
    import 'package:flutter/material.dart';
    import 'package:get/get.dart';

    class DetailPage extends StatelessWidget {
    const DetailPage({super.key, required String title});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
            title: const Text('Material App Bar'),
            ),
            body: Column(
            children: [
                const Center(
                child: Text('INI DETAIL BANG', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                    onPressed: () => Get.back(), 
                    child: const Text("Back")),
            ],
            ),
        ),
        );
    }
    }
   ```

4. homepage

   ``` dart
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
   ```

---

### UNGUIDED

1. Kodingan
   1. main

        ``` dart
        void main() => runApp(const MyApp());

        class MyApp extends StatelessWidget {
            const MyApp({super.key});

            @override
            Widget build(BuildContext context) {
                return GetMaterialApp(
                    title: 'Catatan',
                    initialRoute: '/',
                    getPages: [
                        GetPage(name: '/', page: () => Homepage()),
                        GetPage(name: '/tambah', page: () => TambahCatatan())
                    ],
                );
            }
        }
        ```

   2. controller

        ``` dart
        class CatatanController extends GetxController {
        var catatanList = <Catatan>[].obs;

        void addCatatan(Catatan catatan) {
            catatanList.add(catatan);
        }

        void deleteCatatan(int index) {
            catatanList.removeAt(index);
        }
        }
        ```

   3. model

        ``` dart
        class Catatan {
        String judul;
        String deskripsi;

        Catatan({required this.judul, required this.deskripsi});
        }
        ```

   4. home

        ``` dart
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
        ```

   5. tambah

        ``` dart
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
        ```

2. Output
   1. Home <br> <img src="https://github.com/user-attachments/assets/b6792bbe-5279-49d7-ac3e-780ced728373" alt="default" width="200"/>
   2. Tambah <br> <img src="https://github.com/user-attachments/assets/9c0d4eb3-73a7-40b8-b216-a75e1febba0e" alt="tambah" width="200"/>
   3. Home (Setelah Tambah) <br> <img src="https://github.com/user-attachments/assets/a6b81903-fc6e-4b19-8fd9-64582ae559b5" alt="home (Updated)" width="200"/>


3. Penjelasan
   - `MyApp`: Inisiasi aplikasi, mengatur routing, dan menetapkan Homepage sebagai halaman awal
   - `CatatanController`: Mengelola daftar catatan (catatanList), menambah (addCatatan) dan menghapus (deleteCatatan) catatan
   - `Catatan`: Model data untuk catatan (judul dan deskripsi)
   - `Homepage`: Menampilkan daftar catatan dengan tombol untuk menambah (TambahCatatan) dan menghapus catatan
   - `TambahCatatan`: Halaman untuk menambah catatan baru
