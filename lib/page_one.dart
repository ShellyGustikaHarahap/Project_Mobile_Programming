import 'package:flutter/material.dart';
import 'home_page.dart';  // Mengimpor halaman utama untuk navigasi.

class PageOne extends StatefulWidget {  
  // Membuat class PageOne sebagai StatefulWidget karena halaman ini akan memiliki status yang berubahh.
  const PageOne({super.key});

  
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _selectedIndex = 0;  // Variabel untuk menyimpan indeks item yang dipilih di BottomNavigationBar.

  void _onItemTapped(int index) {
    // Fungsi untuk menangani perubahan item yang dipilih di BottomNavigationBar.
    setState(() {
      _selectedIndex = index;  // Set nilai indeks sesuai dengan item yang diklik.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,  // Mengatur warna latar belakang halaman menjadi ungu muda.
      body: Center(
        // Membuat konten berada di tengah layar.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Membuat kolom berada di tengah secara vertikal.
          children: <Widget>[
            Container(
              // Membungkus gambar logo dalam kontainer dengan dekorasi.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),  // Membuat sudut kontainer membulat.
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),  // Menambahkan bayangan abu-abu dengan opasitas 50%.
                    spreadRadius: 3,  // Menentukan jarak penyebaran bayangan.
                    blurRadius: 5,  // Mengatur kekaburan bayangan.
                    offset: const Offset(0, 3),  // Menentukan posisi bayangan (di bawah gambar).
                  ),
                ],
              ),
              child: ClipRRect(
                // Memotong kontainer agar sudut-sudutnya membulat sesuai borderRadius.
                borderRadius: BorderRadius.circular(16),  // Membuat sudut dari gambar menjadi bulat.
                child: Image.asset(
                  'assets/logo.png',  // Menampilkan gambar logo dari direktori assets.
                  width: 350,  // Menentukan lebar gambar.
                  height: 350,  // Menentukan tinggi gambar.
                  fit: BoxFit.cover,  // Mengatur gambar agar memenuhi seluruh area kontainer.
                ),
              ),
            ),
            const SizedBox(height: 50),  // Memberi jarak vertikal sebesar 50 unit antara logo dan tombol.
            ElevatedButton(
              onPressed: () {
                // Aksi yang dijalankan ketika tombol ditekan.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),  // Navigasi ke halaman MyHomePage saat tombol diklik.
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade200,  // Mengatur warna tombol menjadi ungu muda.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),  // Membulatkan sudut tombol.
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),  // Memberikan padding pada tombol agar terlihat besar.
              ),
              child: const Text(
                'START',  // Teks yang muncul pada tombol.
                style: TextStyle(
                  fontSize: 16,  // Ukuran font teks tombol.
                  fontWeight: FontWeight.bold,  // Membuat teks tebal.
                  color: Colors.black,  // Warna teks pada tombol.
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Menambahkan BottomNavigationBar di bagian bawah halaman.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  // Ikon untuk item pertama (beranda).
            label: '',  // Label kosong untuk item pertama.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),  // Ikon untuk item kedua (bookmark).
            label: '',  // Label kosong untuk item kedua.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),  // Ikon untuk item ketiga (pesan).
            label: '',  // Label kosong untuk item ketiga.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),  // Ikon untuk item keempat (favorit/bintang).
            label: '',  // Label kosong untuk item keempat.
          ),
        ],
        currentIndex: _selectedIndex,  // Menandai item yang sedang dipilih berdasarkan variabel _selectedIndex.
        selectedItemColor: Colors.purple,  // Mengatur warna ikon yang dipilih menjadi ungu.
        unselectedItemColor: Colors.black,  // Mengatur warna ikon yang tidak dipilih menjadi hitam.
        onTap: _onItemTapped,  // Memanggil fungsi _onItemTapped saat item di BottomNavigationBar diklik.
      ),
    );
  }
}
