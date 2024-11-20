# TUGAS INDIVIDU 9
1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Technically bisa-bisa saja. Akan tetapi, tidak lebih baik dibandingkan membuat model sebelum melakukan pengambilan data JSON. Jika kita membuat model dulu, akan lebih terstruktur karena object oriented. Kode juga akan menjadi lebih mudah untuk diperbaiki jika terdapat error. Tak hanya itu, dengan memanfaakan model. kita juga bisa memastikan tipe data untuk setiap atribut dari awal, sedangkan jika tanpa menggunakan model bisa saja terdapat kekeliruan saat memindah-mindahkan data. Selain itu, kita tahu bahwa class dapat memiliki atribut tersendiri, sehingga terenkapsulasi dan dapat kita gunakan berkali-kali method tersebut dengan mudah.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

Library http di Flutter digunakan untuk berkomunikasi dengan server melalui protokol HTTP. Fungsi dari library ini antara lain:
  - Mengirim Permintaan (Request): Library http memungkinkan aplikasi untuk mengirim berbagai jenis permintaan HTTP (GET, POST, PUT, DELETE, dll.) ke server. Misalnya, kita menggunakan metode http.get() untuk mengambil data atau http.post() untuk mengirim data ke server.

  - Menerima Respons dari Server: Setelah permintaan dikirim, server akan memberikan respons yang dapat diambil menggunakan metode seperti http.Response. Respons ini biasanya berisi data yang dikembalikan dalam format JSON, status kode HTTP, dan informasi lainnya.

  - Mempermudah Pengelolaan HTTP: Dengan library ini, kita bisa mengelola URL, headers, body, dan pengaturan lainnya dengan cara yang lebih mudah dan bersih, tanpa harus menulis kode raw HTTP.

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Fungsi CookieRequest adalah untuk handle cookies dan session suatu pengguna. Dengan demikian, CookieRequest dapat digunakan untuk mengelola autentikasi dan otorisasi pengguna. CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter untuk memastikan cookies dan session selalu konsisten pada setiap aplikasi Flutter. Jika tidak dibagikan, bisa saja terdapat kontradiksi (misal: sesi pengguna dianggap telah berakhir di aplikasi A, tetapi masih valid di aplikasi B). Maka dari itu, jika terdapat perubahan pada suatu komponen atau aplikasi, maka di komponen atau aplikasi perlu diubah juga untuk memastikan sesuai.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

- Input Data Pengguna
Pengguna mengisi form atau memilih data di aplikasi Flutter (misalnya, input username dan password).
- Pengolahan Data di Flutter
Setelah pengguna mengirimkan data, data akan diproses di sisi aplikasi Flutter. Data ini kemudian dikemas ke dalam format yang sesuai (misalnya JSON) dan dikirim ke server menggunakan permintaan HTTP (misalnya http.post()).
- Pengiriman ke Server
Data dikirim melalui HTTP request ke server yang sesuai (misalnya ke Django atau backend lainnya).
- Respons dari Server
Server akan memproses permintaan tersebut dan mengirimkan respons kembali, biasanya dalam format JSON yang berisi data yang diminta atau status dari permintaan.
- Menampilkan Data di Flutter
Setelah Flutter menerima respons dari server, data tersebut dapat diparsing (misalnya menggunakan json.decode()) dan digunakan untuk memperbarui UI dengan data yang sesuai.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Login:
  - Pengguna membuka halaman login (LoginPage) di aplikasi Flutter dan memasukkan username dan password.
  - Aplikasi Flutter mengirimkan permintaan HTTP ke server (misalnya Django) untuk memverifikasi kredensial.
  - Jika kredensial valid, server mengembalikan token autentikasi atau cookie sesi yang digunakan untuk menandai status login pengguna.
  - Aplikasi menyimpan cookie atau token tersebut dan mengarahkan pengguna ke halaman utama (HomePage).

Register:
  - Pengguna mengisi form registrasi dengan informasi akun baru.
  - Aplikasi Flutter mengirimkan data ke server untuk membuat akun baru.
  - Setelah akun berhasil dibuat, server memberikan respons yang menandakan keberhasilan dan bisa langsung mengarahkan pengguna untuk login.

Logout:
  - Pengguna memilih untuk logout.
  - Aplikasi mengirimkan permintaan ke server untuk menghapus sesi atau token autentikasi.
  - Server menghapus sesi dan mengirimkan respons sukses.
  - Aplikasi Flutter menghapus data sesi atau cookie lokal dan mengarahkan pengguna kembali ke halaman login.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- Membuat halaman login pada proyek tugas Flutter.
  - Membuat file baru login.dart.
  - Menjadikan halaman login sebagai halaman yang pertama muncul (diubah pada main.dart).

- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
  - Install django-cors-headers pada Django project.
  - Membuat app baru authentication pada Django project.
  - Menambahkan urls.py dan views.py pada app authentication untuk diintegrasikan dengan Flutter.
  - Saat mengakses data, mengakses dari url yang telah tersedia pada urls.py di Django project akan tersinkronisasi.

- Membuat model kustom sesuai dengan proyek aplikasi Django.
  - Membuat file item.dart yang akan menyimpan model kustom Item.
  - Memanfaatkan QuickType untuk mengisi file item_entry.dart.

- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
  - Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
  - Memanfaatkan AsyncSnapshot snapshot untuk iterasi setiap item.
  - Mengambil data semua item dari url Django project.

- Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
  - Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
  - Membuat ElevatedButton dengan teks See Details yang akan redirect ke detail page dari item yang bersangkutan.
  - Halaman ini terdapat pada file ItemDetailPage.dart.

- Tampilkan seluruh atribut pada model item kamu pada halaman ini.
  - Memanfaatkan model Item, atribut dapat diakses dengan item.fields.<attribute>

- Tambahkan tombol untuk kembali ke halaman daftar item.
  - Membuat ElevatedButton dengan teks Back untuk kembali ke page list item (memanfaatkan Navigator.pop(context)).

# TUGAS INDIVIDU 8
1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

- Kegunaan const di Flutter
  Di Flutter, const biasanya digunakan untuk membuat objek atau widget yang tidak akan berubah sepanjang waktu aplikasi berjalan. Dengan menandai objek atau widget sebagai const, kita memberi tahu Dart bahwa objek tersebut bisa diinisialisasi pada waktu kompilasi dan tidak perlu diinisialisasi ulang saat aplikasi dijalankan. Ini sangat berguna untuk optimasi performa, terutama saat bekerja dengan banyak widget statis.

- Keuntungan Menggunakan const
  - Optimasi Memori
  Objek const hanya diinisialisasi sekali di memori dan akan digunakan ulang di berbagai tempat di mana objek tersebut muncul. Ini menghemat penggunaan memori karena menghindari pembuatan objek baru setiap kali widget tersebut dipanggil.
  - Peningkatan Performa
  Karena objek const sudah diinisialisasi pada waktu kompilasi, Flutter tidak perlu membuat ulang objek tersebut saat melakukan rendering ulang. Ini mengurangi jumlah rebuild dan mempercepat rendering UI, terutama pada aplikasi yang memiliki banyak elemen statis.
  - Keamanan Data 
  Dengan const, kita menjamin bahwa data tersebut tidak akan berubah selama aplikasi berjalan. Ini membantu menjaga konsistensi data dalam aplikasi, karena objek yang bersifat const tidak dapat dimodifikasi setelah dibuat.
  - Penggunaan Cache yang Efisien
  Objek const bisa dimanfaatkan dalam cache rendering, yang artinya Flutter dapat menyimpan hasil rendering widget dan menggunakannya kembali tanpa harus melakukan rendering ulang.

- Kapan Sebaiknya Menggunakan const
  - Widget Statis
  Jika widget atau elemen UI tidak akan berubah sepanjang waktu aplikasi berjalan, Anda bisa menggunakan const. Contoh: Text("Hello World"), Icon(Icons.add), dan sebagainya.
  - Variabel Global 
  Untuk data yang bersifat tetap dan perlu diakses di beberapa bagian aplikasi, misalnya URL, string, atau angka tetap.
  - Konfigurasi atau Konstanta
  Pada konfigurasi atau nilai tetap, seperti padding, margin, dan durasi animasi yang tidak akan berubah.
  - List atau Map
  Pada list atau map yang nilainya tidak akan diubah setelah diinisialisasi, seperti const [1, 2, 3].

- Kapan Tidak Sebaiknya Menggunakan const
  - Data yang Berubah-ubah
  Jika data atau nilai objek akan berubah seiring waktu, seperti nilai input pengguna atau data dari server, tidak cocok menggunakan const.
  - Widget atau Variabel yang Tergantung pada State 
  Untuk widget yang bergantung pada variabel yang bisa berubah dalam aplikasi (misalnya, dari StatefulWidget atau provider), hindari penggunaan const.
  - Komponen yang Dikustomisasi Dinamis
  Misalnya widget yang bergantung pada kondisi atau state tertentu, atau elemen yang perlu diupdate ulang saat state berubah.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

- Penggunaan Column
  Column adalah widget yang menata anak-anaknya dalam arah vertikal, dari atas ke bawah. Biasanya digunakan untuk menyusun elemen UI secara berurutan dalam satu kolom.
  - Properti Penting pada Column
    - mainAxisAlignment
    Mengatur posisi anak-anak widget di sepanjang main axis (sumbu utama), yaitu sumbu vertikal pada Column. Pilihan nilai seperti MainAxisAlignment.start, MainAxisAlignment.center, dan MainAxisAlignment.end.
    - crossAxisAlignment
    Mengatur posisi anak-anak widget di sepanjang cross axis (sumbu silang), yaitu sumbu horizontal pada Column. Pilihan nilai seperti CrossAxisAlignment.start, CrossAxisAlignment.center, dan CrossAxisAlignment.end.
    - children
    Digunakan untuk menentukan daftar widget yang akan ditata oleh Column.
  - Contoh Implementasi Column
    Berikut adalah contoh sederhana dari Column yang menyusun beberapa widget teks secara vertikal:
    ```html
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hello, World!"),
        Text("Welcome to Flutter"),
        ElevatedButton(
          onPressed: () {},
          child: Text("Click Me"),
        ),
      ],
    )
    ```
    Dalam contoh di atas:
      - mainAxisAlignment diatur ke center, jadi semua elemen akan diatur di tengah sumbu vertikal.
      - crossAxisAlignment diatur ke start, jadi semua elemen akan mulai dari kiri pada sumbu horizontal.

- Penggunaan Row
  Row adalah widget yang menata anak-anaknya dalam arah horizontal, dari kiri ke kanan. Biasanya digunakan untuk menyusun elemen UI secara horizontal dalam satu baris.
  - Properti Penting pada Row
    - mainAxisAlignment
      Mengatur posisi anak-anak widget di sepanjang main axis (sumbu utama), yaitu sumbu horizontal pada Row.
    - crossAxisAlignment
      Mengatur posisi anak-anak widget di sepanjang cross axis (sumbu silang), yaitu sumbu vertikal pada Row.
    - children
      Digunakan untuk menentukan daftar widget yang akan ditata oleh Row.
  - Contoh Implementasi Row
      Berikut adalah contoh sederhana dari Row yang menyusun beberapa widget teks dan tombol secara horizontal:
      ```html
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home),
          Text("Home"),
          ElevatedButton(
            onPressed: () {},
            child: Text("Click Me"),
          ),
        ],
      )
      ```
      Dalam contoh di atas:
      - mainAxisAlignment diatur ke spaceAround, jadi elemen-elemen di dalam Row akan diberi jarak merata di sepanjang sumbu horizontal.
      - crossAxisAlignment diatur ke center, jadi elemen-elemen akan diatur di tengah sumbu vertikal.
    
- Kapan Menggunakan Column dan Row
  - Gunakan Column saat ingin membuat tata letak vertikal seperti daftar, formulir, atau sekumpulan teks dan tombol yang diletakkan dari atas ke bawah.
  - Gunakan Row saat ingin membuat tata letak horizontal, misalnya ikon dan teks pada satu baris, atau tombol-tombol tindakan yang diletakkan berdampingan.

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen Input yang Digunakan di Halaman Form: 
- TextFormField untuk memasukkan Name (nama item).
- TextFormField untuk memasukkan Price (harga item), yang diformat agar hanya menerima angka.
- TextFormField untuk memasukkan Description (deskripsi item).

Elemen Input Lain di Flutter yang Tidak Digunakan:
- DropdownButton: Elemen input ini digunakan untuk membuat dropdown list (daftar pilihan).
- Checkbox: Elemen input untuk memilih opsi dengan mencentang kotak.
- Radio: Elemen input untuk memilih salah satu dari beberapa opsi yang tersedia.
- Switch: Elemen input yang berfungsi sebagai toggle switch untuk pilihan "aktif" atau "tidak aktif".
- Slider: Elemen input untuk memilih nilai dalam rentang tertentu (misalnya volume suara).
- DatePicker atau TimePicker: Elemen ini memungkinkan pengguna memilih tanggal atau waktu.

Saya tidak menggunakan elemen-elemen ini karena form saya cukup sederhana dan hanya membutuhkan input teks serta angka saja. Jika ada pilihan atau opsi lebih lanjut, dropdown, checkbox, atau radio bisa ditambahkan untuk meningkatkan pengalaman pengguna.

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk menjaga konsistensi tema di seluruh aplikasi, saya mengatur tema dengan ThemeData pada widget MaterialApp di file main.dart. Tema ini memungkinkan saya untuk mengatur warna utama (primaryColor), warna aksen (accentColor), gaya teks, dan elemen lain seperti bentuk tombol (ButtonStyle). Dengan cara ini, seluruh widget di aplikasi mengikuti tema yang sama, menjadikannya terlihat lebih rapi dan konsisten.

Saya menerapkan tema di aplikasi ini dengan menggunakan ThemeData. Misalnya, warna utama diatur di colorScheme.primary, dan semua elemen seperti tombol dan teks yang menggunakan Theme.of(context).colorScheme.primary akan menampilkan warna yang sama, sehingga tampilan aplikasi menjadi lebih seragam.

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Dalam Flutter, navigasi diatur menggunakan Navigator dan Route. Saya menggunakan metode Navigator.push untuk berpindah dari satu halaman ke halaman lain. Misalnya, dari halaman utama ke halaman form penambahan item.
Jika aplikasi memiliki lebih banyak halaman, saya bisa mempertimbangkan penggunaan Navigator.pushNamed dan mendefinisikan semua halaman di routes dalam MaterialApp. Ini akan membuat pengelolaan rute lebih mudah dan konsisten. Untuk navigasi yang sering digunakan, saya juga bisa menggunakan Drawer atau BottomNavigationBar sebagai menu navigasi tetap di bagian bawah atau sisi aplikasi.

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
- Melihat daftar item dengan menambahkan ItemHomepage("Lihat Daftar Item", Icons.store), sebagai tombol Lihat Item pada final List items
- Menambah item dengan menambahkan ItemHomepage("Tambah Item", Icons.add), sebagai tombol Tambah Item pada final List items
- Logout dengan menambahkan ItemHomepage("Logout", Icons.logout), sebagai tombol Logout pada final List items
- Sehingga, pada akhirnya menjadi:
```html
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Item", Icons.store),
    ItemHomepage("Tambah Item", Icons.add),
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