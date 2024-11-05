# TUGAS INDIVIDU 7
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateful widget dapat memberikan respon terhadap perubahan data dan melakukan refresh page untuk memperbarui konten yang akan ditampilkan pada page tersebut.
Stateless widget bersifat static dan tidak dapat diubah setelah page dibuat.
Jadi, stateful widget lebih cocok apabila page mengandung komponen yang perlu memberikan respon terhadap request yang dapat menyebabkan perubahan data ataupun merespon terhadap input pengguna, sedangkan stateless widget lebih cocok untuk tipe page yang static (tidak terjadi refresh/perubahan konten page berulang kali).
Dalam konteks pengembangan aplikasi Flutter, keputusan kapan perlu menggunakan stateless atau stateful widget dapat memengaruhi kinerja aplikasi secara signifikan mengingat masing-masing memiliki karateristiknya sendiri. Dengan pemilihan yang tepat, aplikasi dapat berjalan dengan lebih efisien.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

MyApp - StatelessWidget => Sebuah StatelessWidget yang berfungsi sebagai app utama.
MaterialApp => Untuk kustomisasi dasar aplikasi dengan design Material (theme, title, etc.).
ThemeData => Untuk mengatur theme aplikasi (colorScheme, font, etc.).
MyHomePage - StatelessWidget => Sebuah StatelessWidget yang berfungsi sebagai home page dari app.
Scaffold => Untuk kustomisasi struktur dasar page app (appBar, body, etc.).
AppBar => Untuk menampilkan section paling atas pada page.
Text => Untuk menampilkan teks pada page.
TextStyle => Untuk kustomisasi teks pada page (color, size, etc.).
SingleChildScrollView => Sebuah widget wrapper yang dapat discroll apabila konten lebih besar dari ukuran screen.
Padding => Untuk mengatur jarak (padding) di sekitar widget childnya.
Column => Untuk mengatur widget childnya dalam kolom vertikal.
GridView.count => Untuk mengatur widget childnya dalam bentuk grid sesuai banyak baris dan kolom yang diinginkan.
Material => Untuk kustomisasi design Material pada widget (elevation, color, etc.)
InkWell => Untuk dapat memberikan respons ketika diklik (semacam button).
SnackBar => Untuk menampilkan pesan sementara kepada pengguna.
Container => Untuk mengatur tata letak widget.
Center => Untuk mengubah posisi widget childnya ke tengah.
Icon => untuk menampilkan icon yang diinginkan dan dapat dikustomisasi (seperti color, size, etc.).


3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi setState() dalam Flutter digunakan untuk memberitahu framework bahwa ada perubahan pada data yang perlu diperbarui dalam tampilan (UI). Ketika setState() dipanggil, Flutter akan melakukan render ulang pada widget yang terkait, memungkinkan tampilan untuk merefleksikan perubahan terbaru pada state tersebut.

- Variabel yang Terdampak
    - State Komponen: setState() hanya berdampak pada variabel-variabel yang termasuk dalam state dari StatefulWidget tersebut. Misalnya, jika komponen memiliki state counter, memanggil setState() untuk memperbarui counter akan menyebabkan tampilan komponen merespon perubahan tersebut.
    - Komponen Turunan: Jika komponen turunan (child widget) bergantung pada state dari komponen induknya, mereka juga dapat terdampak dan dirender ulang jika setState() dipanggil.
    
Secara umum, setState() cocok untuk merespons perubahan data atau input pengguna yang memengaruhi tampilan aplikasi.

4. Jelaskan perbedaan antara const dengan final.

- Waktu Penentuan Nilai
    - const: Nilai variabel harus ditentukan pada waktu kompilasi. Artinya, nilai sudah diketahui sebelum program berjalan dan tidak boleh berubah.
    - final: Nilai variabel bisa ditentukan pada waktu runtime dan hanya dapat diinisialisasi satu kali. Setelah diinisialisasi, nilainya tidak dapat diubah, namun bisa menerima nilai yang baru diketahui saat program berjalan. 

- Immutabilitas Objek
    - const: Bersifat immutable sepenuhnya, termasuk seluruh elemen jika const diterapkan pada objek atau koleksi. Tidak hanya referensi, tetapi juga isi dari objek tidak dapat diubah.
    - final: Membuat referensi ke objek tidak dapat diubah, tetapi isi atau properti dari objek tersebut tetap bisa diubah jika objek bersifat mutable.

- Kapan Menggunakan
    - Gunakan const saat nilai sudah pasti dan tidak akan berubah sepanjang eksekusi program.
    - Gunakan final saat nilai variabel tidak diketahui hingga runtime, tetapi kita ingin memastikan nilainya tetap setelah ditetapkan pertama kali.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- Membuat sebuah program Flutter baru dengan tema e-commerce seperti tugas-tugas sebelumnya.
- Menjalankan command berikut pada cmd:
```html
flutter create cookies_store
cd cookies_store
flutter run
```
- Membuat tiga tombol sederhana dengan ikon dan teks untuk:
- Mengubah main.dart menjadi seperti di bawah ini agar home page berada di menu.dart
```html
import 'package:flutter/material.dart';
import 'package:cookies_store/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookies Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ).copyWith(secondary: Colors.brown[400]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
- Menambahkan class ItemHomepage sebagai berikut pada menu.dart:
```html
class ItemHomepage {
    final String name;
    final IconData icon;

    ItemHomepage(this.name, this.icon);
}
```
- Melihat daftar produk dengan menambahkan ItemHomepage("Lihat Daftar Produk", Icons.store), sebagai tombol Lihat Item pada final List items
- Menambah produk dengan menambahkan ItemHomepage("Tambah Produk", Icons.add), sebagai tombol Tambah Item pada final List items
- Logout dengan menambahkan ItemHomepage("Logout", Icons.logout), sebagai tombol Logout pada final List items
- Sehingga, pada akhirnya menjadi:
```html
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.store),
    ItemHomepage("Tambah Produk", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];
```
- Membuat class ItemCard yang akan menjadi StatelessWidget untuk ItemHomepage
- Pada MyHomePage, ubah ({super.key, required this.title}) menjadi ({super.key});
- Memunculkan Snackbar dengan tulisan:
- "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
- Menambahkan potongan kode berikut pada function build ItemCard agar muncul SnackBar sebagai respon ketika button diklik. Tidak perlu membuat sebanyak 3 karena hanya perlu disesuaikan dengan attribute name dari masing-masing ItemHomepage.
```html
onTap: () {
    // Menampilkan pesan SnackBar saat kartu ditekan.
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
    );
},
```