<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL XIII
<br>
NETWORKING

![image](https://lac.telkomuniversity.ac.id/wp-content/uploads/2021/01/cropped-1200px-Telkom_University_Logo.svg-270x270.png)

Disusun Oleh:
<br>
Afad Fath Musyarof Halim / 2211104030
<br>
SE-06-01

Asisten Praktikum :
<br>
Muhammad Faza Zulian Gesit Al Barru
<br>
Aisyah Hasna Aulia

Dosen Pengampu :
<br>
Yudha Islami Sulistya, S.Kom., M.Cs

PROGRAM STUDI S1 REKAYASSA PERANGKAT LUNAK
<br>
FAKULTAS INFORMATIKA 
<br>
TELKOM UNIVERSITY PURWOKERTO

</div>

---

## Tugas Pendahuluan

**1. Apa yang dimaksud dengan state management pada Flutter?**
<br> 
State management adalah bagaimana cara Flutter mengelola data yang berubah-ubah seperti teks, angka, dan nilai nilai tertentu

**2. Sebut dan jelaskan komponen-komponen yang ada di dalam GetX**
<br>

- GetXController: mengelola state dari widget atau layar tertentu
- GetView: getter dari controller yang telah di registrasi
- GetXService: mengelola layanan yang dapat di akses oleh get lain secara global
- GetConnect: mengakses komunikasi dari dan ke http atau websocket
- GetPage: Mengelola halaman aplikasi

**3. Lengkapilah code di bawah ini, dan tampilkan hasil outputnya serta jelaskan.**
<br>

- kodingan
<br>

``` dart
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
```

<br>

- Screenshot
  - a
  - a
- Penjelasan
  - `var counter = 0.obs` sebagai wadah dari nilai counter
  - `void tambahCounter()` untuk menambah nilai counter
  - `void resetCounter()` untuk me-reset nilai counter
  - `controller.counter.value` untuk memanggil counter dari controller
  - `controller.tambahCounter()` untuk memanggil fungsi `tambahCounter()` dari controller
  - `controller.resetCounter()` untuk memanggil fungsi `resetCounter()` dari controller
