import 'package:flutter/material.dart';
import 'cell_detail_page.dart';  // Mengimpor halaman detail sel.
import 'materi_page.dart';  // Mengimpor halaman materi.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});  // Kelas StatefulWidget yang berfungsi untuk membuat halaman utama.

  @override
  State<MyHomePage> createState() => _MyHomePageState();  // Membuat state untuk widget MyHomePage.
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;  // Menyimpan indeks item BottomNavigationBar yang dipilih.
  int _selectedOption = -1;  // Menyimpan indeks opsi yang dipilih pada list.

  // Fungsi untuk mengubah indeks saat item BottomNavigationBar diklik.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update state dengan indeks item yang dipilih.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold menyediakan struktur dasar halaman.
      appBar: AppBar(
        title: const Text(  // Judul aplikasi pada AppBar.
          'STUDY MATE BIOLOGI',  // Nama aplikasi yang ditampilkan.
          style: TextStyle(
            fontSize: 16,  // Ukuran font judul.
            fontWeight: FontWeight.bold,  // Gaya font menjadi tebal.
            color: Colors.purple,  // Warna font ungu.
          ),
        ),
        backgroundColor: Colors.white,  // Warna background AppBar menjadi putih.
        elevation: 0,  // Menghilangkan efek bayangan AppBar.
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Biologi',  // Label tambahan di kanan atas AppBar.
                style: TextStyle(
                  fontSize: 14,  // Ukuran font label.
                  color: Colors.purple.shade300,  // Warna font lebih terang.
                  fontWeight: FontWeight.bold,  // Gaya font tebal.
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding di sekitar konten halaman.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Mengatur letak item agar rata kiri.
          children: [
            // Membuat opsi pilihan pertama dengan teks KD 3.1
            _buildOption('KD 3.1 Menganalisis Struktur Fungsi dan Proses Terjadi Pada Sel Sebagai Unit Terkecil', 0),
            const SizedBox(height: 16),  // Menambahkan jarak antar opsi.
            
            // Membuat opsi pilihan kedua dengan teks KD 3.4
            _buildOption('KD 3.4 Menjelaskan Proses Metabolisme Pada Tumbuhan Fotosintesis', 1),
            const SizedBox(height: 16),  // Menambahkan jarak antar opsi.
            
            // Membuat opsi pilihan ketiga dengan teks KD 3.3
            _buildOption('KD 3.3 Menganalisis Struktur Jaringan Pada Tumbuhan dan Fungsinya', 2),
            const SizedBox(height: 32),  // Jarak lebih besar antara opsi dan container di bawahnya.
            
            // Container dekoratif, bisa digunakan untuk menampilkan gambar atau konten lainnya.
            Container(
              width: double.infinity,  // Mengambil lebar penuh layar.
              height: 200,  // Tinggi container 200 pixel.
              decoration: BoxDecoration(
                color: Colors.purple.shade100,  // Warna latar belakang ungu muda.
                borderRadius: BorderRadius.circular(16),  // Sudut melengkung dengan radius 16.
              ),
            ),
          ],
        ),
      ),
      
      // BottomNavigationBar untuk navigasi halaman.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[  // Daftar item navigasi.
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  // Ikon untuk item Home.
            label: '',  // Tidak ada label.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),  // Ikon untuk item Bookmark.
            label: '',  // Tidak ada label.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),  // Ikon untuk item Pesan.
            label: '',  // Tidak ada label.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),  // Ikon untuk item Favorit.
            label: '',  // Tidak ada label.
          ),
        ],
        currentIndex: _selectedIndex,  // Menandai item yang sedang dipilih.
        selectedItemColor: Colors.purple,  // Warna ikon yang dipilih ungu.
        unselectedItemColor: Colors.black,  // Warna ikon yang tidak dipilih hitam.
        onTap: _onItemTapped,  // Fungsi yang dipanggil saat item di klik.
      ),
    );
  }

  // Widget untuk membangun opsi pilihan.
  Widget _buildOption(String text, int index) {
    return GestureDetector(
      onTap: () {  // Aksi yang dilakukan ketika opsi di klik.
        setState(() {
          _selectedOption = index;  // Menyimpan indeks opsi yang dipilih.
        });
        if (index == 0) {  // Jika opsi pertama dipilih, buka halaman detail sel.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CellDetailPage()),  // Navigasi ke halaman CellDetailPage.
          );
        } else if (index == 2) {  // Jika opsi ketiga dipilih, buka halaman materi.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MateriPage()),  // Navigasi ke halaman MateriPage.
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),  // Padding di dalam container.
        decoration: BoxDecoration(
          color: Colors.purple.shade100,  // Warna latar belakang container ungu muda.
          borderRadius: BorderRadius.circular(30),  // Sudut melengkung container.
        ),
        child: Row(
          children: [
            // Radio button untuk menandai pilihan.
            Radio(
              value: index,  // Nilai radio sesuai dengan indeks opsi.
              groupValue: _selectedOption,  // Grup radio disesuaikan dengan opsi yang dipilih.
              activeColor: Colors.purple.shade300,  // Warna radio yang aktif.
              onChanged: (value) {  // Fungsi yang dipanggil ketika radio dipilih.
                setState(() {
                  _selectedOption = value!;  // Menyimpan nilai radio yang dipilih.
                });
              },
            ),
            Expanded(
              child: Text(
                text,  // Teks untuk opsi.
                style: const TextStyle(
                  color: Colors.black,  // Warna teks hitam.
                  fontWeight: FontWeight.bold,  // Gaya teks tebal.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
