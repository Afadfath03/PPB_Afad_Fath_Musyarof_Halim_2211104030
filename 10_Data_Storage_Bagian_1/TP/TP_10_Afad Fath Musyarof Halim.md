<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL X
<br>
Data Storage Bagian 1

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

**1. Jelaskan secara singkat fungsi SQLite dalam pengembangan aplikasi mobile!**
<br> SQLite adalah sistem manajemen data yang digunakan untuk menyimpan data secara lokal

**2. Apa saja yang dimaksud dengan operasi CRUD? Berikan penjelasan singkat untuk masing-masing operasi!**
<br> CRUD (Create, Read, Update, Delete) adalah modul dasar untuk mengoperasikan data

- Create untuk membuat atau memasukkan data baru
- Read untuk membaca atau menampilkan data yang tersimpan
- Update untuk mengubah data yang tersimpan
- Delete untuk menghapus data yang tersimpan

**3. Tuliskan kode SQL untuk membuat tabel bernama users dengan kolom berikut :**
**- id (integer, primary key, auto increment)**
**- name (text)**
**- email (text)**
**- createdAt (timestamp, default value adalah waktu sekarang)**

```sql
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**4. Sebutkan langkah-langkah utama untuk menggunakan plugin sqflite di dalam Flutter!**
1. 

**5. Lengkapi kode berikut untuk membaca semua data dari tabel users menggunakan sqflite**

```dart
static Future<List<Map<String, dynamic>>> getUsers() async {
	final db = await SQLHelper.db();
	return db.query(__________);
}
```
