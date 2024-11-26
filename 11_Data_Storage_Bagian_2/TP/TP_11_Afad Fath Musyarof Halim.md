<div align="center">

TUGAS PENDAHULUAN
<br>
PEMROGRAMAN PERANGKAT BERGERAK

MODUL XI
<br>
Firebase Notifikasi

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

**1. Firebase dan Fitur nya**
<br>
**- Jelaskan apa yang dimaksud dengan Firebase**
 <br>Firebase adalah platform buatan Google sebagai alat yang mempermudah developer dalam mengembangkan aplikasi dengan mengurangi kerja developer dalam mengembangkan backend

**- Sebutkan tiga fitur utama Firebase beserta fungsinya masing-masing.**
 1. Authentication untuk mengelola otentikasi pengguna
 2. Cloud Messaging untuk mengelola pesan antar perangkat
 3. Hosting untuk deploy website

**2. Jelaskan perbedaan antara Notification Message dan Data Message pada Firebase Cloud Messaging. Berikan contoh penggunaan untuk masing-masing jenis pesan.**
<br> Notification Message berisi pesan yang ditampilkan pada notifikasi seperti notifikasi pesan whatsapp. Data Message adalah data pesan yang harus diproses aplikasi sebelum ditampilkan seperti gambar pada whatsapp yang hanya bisa di lihat 1 kali

**3. Apa yang dimaksud dengan Firebase Cloud Messaging (FCM) Token, dan mengapa token ini penting untuk mengirim notifikasi ke aplikasi?**
<br> FCM Token adalah kumpulan karakter unik yang berfungsi sebagai identitas unik setiap perangkat sehingga saat mengirimkan pesan dapat menuju ke perangkat yang tepat

**4. Jelaskan bagaimana Firebase Cloud Messaging menangani notifikasi dalam kondisi aplikasi berikut:**
**a. Saat aplikasi berada di foreground.**
<br> Pesan akan ditampilkan langsung pada aplikasi dan tidak perlu menampilkan tray notifikasi system

**b. Saat aplikasi berada di background.**
<br> Pesan akan ditampilkan dalam bentuk tray notifikasi default system

**c. Saat aplikasi dalam kondisi terminated.**
<br> Perangkat tidak akan mendapatkan pesan, pesan akan didapat ketika aplikasi dijalankan
