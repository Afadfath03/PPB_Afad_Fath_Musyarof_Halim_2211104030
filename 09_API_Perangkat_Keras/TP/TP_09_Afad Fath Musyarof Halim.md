<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL VIII
<br>
API Perangkat Keras

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

``` txt
Buatlah satu project baru, yang mana di dalamnya terdapat navigasi untuk pindah dari satu halaman ke halaman lainnya 
```

- Source Code
  - main.dart
  
    ``` dart
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
    ```

- Output

- Penjelasan
  - `Center` untuk membuat widget menjadi di tengah
  - `Column` untuk membuat Widget berurutan secara vertikal
  - `Row` untuk membuat Widget berurutan secara horizontal
  - `icon` untuk menampilkan ikon/Gambar
  - `ElevatedButton.icon` untuk membuat button/tombol dengan ikon secara bawaan
  - `SizedBox` untuk memberikan jarak antar Widget
