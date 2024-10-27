<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL VII
<br>
NAVIGASI DAN NOTIFIKASI

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

### SOAL

``` txt
Buatlah satu project baru, yang mana di dalamnya terdapat navigasi untuk pindah dari satu halaman ke halaman lainnya 
```

- Source Code
  - main.dart
  
    ``` dart
    import 'package:flutter/material.dart';
    import 'package:tp_07/halaman_1.dart';
    import 'package:tp_07/halaman_2.dart';

    void main() => runApp(const MainApp())

    class MainApp extends StatelessWidget {
        const MainApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            initialRoute: '/',
            routes: {
                '/': (context) => Halaman1(),
                '/halamanDua': (context) => Halaman2(),
            },
            );
        }
    }
    ```

  - halaman_1.dart

    ``` dart
    import 'package:flutter/material.dart';

    void main() => runApp(const Halaman1());

    class Halaman1 extends StatelessWidget {
        const Halaman1({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("Halaman Satu")
            ),
            body: Center(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                ),
                onPressed: () {
                    Navigator.pushNamed(context, '/halamanDua');
                },
                child: Text(
                    "Ke Halaman Dua", 
                    style: TextStyle(color: Colors.white)),
                ),
            ),
            );
        }
    }
    ```

  - halaman_2.dart

    ``` dart
    import 'package:flutter/material.dart';

    void main() => runApp(const Halaman2());

    class Halaman2 extends StatelessWidget {
        const Halaman2({super.key});

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.red,
                title: Text("Halaman Dua")
                ),
            body: Center(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                ),
                onPressed: () {
                    Navigator.pop(context);
                },
                child: Text(
                    "Kembali ke Halaman Satu", 
                    style: TextStyle(color: Colors.white)),
                ),
            ),
            );
        }
    }
    ```

- Output

- Penjelasan
