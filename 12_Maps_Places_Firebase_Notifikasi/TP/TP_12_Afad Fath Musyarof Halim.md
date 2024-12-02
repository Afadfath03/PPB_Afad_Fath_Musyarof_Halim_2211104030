<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL XII
<br>
MAPS & PLACE

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

**1. Menambahkan Google Maps Package**
<br>
**- Apa nama package yang digunakan untuk mengintegrasikan Google Maps di Flutter dan sebutkan langkah-langkah yang diperlukan untuk menambahkan package Google Maps ke dalam proyek Flutter.**
<br> nama package: google_maps_flutter
<br> langkah-langkah:
	1. Tambah dependencies
	2. Konfigurasi API
	3. Konfigurasi Perizinan
**- Mengapa kita perlu menambahkan API Key, dan di mana API Key tersebut diatur dalam aplikasi Flutter?**
<br> Sebagai identitas aplikasi saat mengakses maps

**2. Menampilkan Google Maps**
<br>
**- Tuliskan kode untuk menampilkan Google Map di Flutter menggunakan widget GoogleMap**
	``` dart
	GoogleMap(
		initialCameraPosition: CameraPosition(
		  target: LatLng(-6.2088, 106.8456), // Jakarta
		  zoom: 14,
	),
	```
**- Bagaimana cara menentukan posisi awal kamera (camera position) pada Google Maps di Flutter?**
<br> dengan initialCameraPosition pada GoogleMap dan CameraPosition sebagai koordinat

**- Sebutkan properti utama dari widget GoogleMap dan fungsinya.**
<br>
	1. initialCameraPosition: Posisi awal kamera
	2. markers: Penanda
	3. mapType: Jenis peta
	4. onMapCreated: Callback setelah map selesai dibuat
	5. onTap: Callback saat layar map disentuh

**3. Menambah Marker**
<br>
**- Tuliskan kode untuk menambahkan marker di posisi tertentu (latitude: -6.2088, longitude: 106.8456) pada Google Maps.**
<br>
``` dart
GoogleMap( 
	initialCameraPosition: CameraPosition( 
	target: LatLng(-6.2088, 106.8456), // Jakarta 
	zoom: 14.0, ), 
markers: { 
	Marker( 
		markerId: MarkerId('jakarta'), 
		position: LatLng(-6.2088, 106.8456), 
		infoWindow: InfoWindow(
			title: 'Jakarta', 
	),
```
**- Bagaimana cara menampilkan info window saat marker diklik?**
<br> property infoWindow berisi informasi yang muncul saat marker ditekan

**4. Menggunakan Place Picker**
<br>
**- Apa itu Place Picker, dan bagaimana cara kerjanya di Flutter dan sebutkan nama package yang digunakan untuk implementasi Place Picker di Flutter.**
<br> Place picker adalah fitur untuk memilih lokasi pada peta
<br> package nya google_maps_place_picker
<br>
**- Tuliskan kode untuk menampilkan Place Picker, lalu kembalikan lokasi yang dipilih oleh pengguna dalam bentuk latitude dan longitude.**
<br> 
``` dart
ElevatedButton(
	onPressed: () async {
	  LocationResult? result = await Navigator.push(
		context,
		MaterialPageRoute(
		  builder: (context) => PlacePicker(apiKey),
		),
	  );

	  if (result != null) {
		print("Lokasi: ${result.latLng}");
	  }
	},
```
