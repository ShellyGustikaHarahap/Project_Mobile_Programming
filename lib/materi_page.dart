import 'package:flutter/material.dart';
import 'quiz_page.dart';  // Mengimpor halaman kuis

// Kelas untuk halaman detail sel
class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  _MateriPageState createState() => _MateriPageState();
}

// State untuk CellDetailPage
class _MateriPageState extends State<MateriPage> {
  final PageController _pageController = PageController();  // Controller untuk mengatur PageView
  int _currentPage = 0;  // Menyimpan indeks halaman saat ini

  // Fungsi untuk melanjutkan ke halaman berikutnya
  void _goToNextPage() {
    if (_currentPage < 2) {  // Memeriksa apakah saat ini bukan halaman terakhir
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),  // Durasi animasi
        curve: Curves.easeInOut,  // Jenis kurva animasi
      );
      setState(() {});  // Memperbarui tampilan
    }
  }

  // Fungsi untuk kembali ke halaman sebelumnya
  void _goToPreviousPage() {
    if (_currentPage > 0) {  // Memeriksa apakah saat ini bukan halaman pertama
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),  // Durasi animasi
        curve: Curves.easeInOut,  // Jenis kurva animasi
      );
      setState(() {});  // Memperbarui tampilan
    }
  }

  // Fungsi untuk menavigasi ke halaman kuis
  void _navigateToQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizPage()),  // Mengarahkan ke QuizPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDY MATE BIOLOGI - SEL',  // Judul aplikasi
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        backgroundColor: Colors.white,  // Warna latar belakang AppBar
        elevation: 0,  // Menghilangkan bayangan
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Memberikan padding di seluruh isi
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,  // Mengaitkan controller dengan PageView
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;  // Memperbarui halaman saat ini
                  });
                },
                children: [
                  // Halaman Pertama - Detail Sel
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,  // Warna latar belakang kontainer
                          borderRadius: BorderRadius.circular(30),  // Membuat sudut melengkung
                        ),
                        child: const Text(
                          'Fotosintesis adalah proses di mana tumbuhan hijau menggunakan energi cahaya untuk menghasilkan makanan dalam bentuk glukosa. '
                          'Proses ini terjadi di kloroplas yang terdapat di daun\n\n'
                          '1. Reaksi Cahaya: Energi matahari diubah menjadi energi kimia berupa ATP dan NADPH\n'
                          '2. Reaksi Gelap (Siklus Calvin): ATP dan NADPH digunakan untuk mengubah karbon dioksida menjadi glukosa\n'
                          '3. Pentingnya: Fotosintesis adalah dasar dari rantai makanan karena merupakan cara utama di mana energi dari matahari masuk ke biosfer\n'
                          ,
                          style: TextStyle(
                            color: Colors.black,  // Warna teks
                            fontWeight: FontWeight.bold,  // Mengatur ketebalan teks
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),  // Jarak antara kontainer dan logo
                      Center(
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,  // Warna latar belakang kontainer logo
                            borderRadius: BorderRadius.circular(16),  // Membuat sudut melengkung
                            boxShadow: [  // Menambahkan bayangan
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),  // Warna bayangan
                                spreadRadius: 3,  // Ukuran sebaran bayangan
                                blurRadius: 5,  // Tingkat kabur bayangan
                                offset: const Offset(0, 3),  // Posisi bayangan
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logo_sel.png',  // Mengganti jalur dan nama file gambar
                            fit: BoxFit.contain,  // Mengatur cara gambar ditampilkan
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Halaman Kedua - Materi Lanjutan
                  SingleChildScrollView(  // Menggunakan ScrollView untuk konten yang panjang
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,  // Warna latar belakang kontainer
                            borderRadius: BorderRadius.circular(30),  // Membuat sudut melengkung
                          ),
                          child: const Text(
                            'Materi Lanjutan: Jenis-jenis fotosintesis\n\n'
                            '1. C3: Jalur paling umum, karbon diikat jadi senyawa 3-karbon. Contoh: padi, gandum. Cocok di iklim sedang\n'
                            '2. C4: Karbon diikat jadi 4-karbon, lebih efisien di suhu tinggi. Contoh: jagung, tebu. Cocok di daerah panas\n'
                            '3.CAM: Stomata terbuka malam hari, simpan karbon sebagai asam. Contoh: kaktus, nanas. Cocok di gurun atau daerah kering\n'
                           ,
                            style: TextStyle(
                              color: Colors.black,  // Warna teks
                              fontWeight: FontWeight.bold,  // Mengatur ketebalan teks
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),  // Jarak antara kontainer dan logo
                        Center(
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,  // Warna latar belakang kontainer logo
                              borderRadius: BorderRadius.circular(16),  // Membuat sudut melengkung
                              boxShadow: [  // Menambahkan bayangan
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),  // Warna bayangan
                                  spreadRadius: 3,  // Ukuran sebaran bayangan
                                  blurRadius: 5,  // Tingkat kabur bayangan
                                  offset: const Offset(0, 3),  // Posisi bayangan
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/logo_jenis.png',  // Mengganti jalur dan nama file gambar
                              fit: BoxFit.contain,  // Mengatur cara gambar ditampilkan
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Halaman Ketiga - Halaman Kuis
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,  // Menempatkan konten di tengah
                      children: [
                        Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,  // Warna latar belakang kontainer logo
                            borderRadius: BorderRadius.circular(16),  // Membuat sudut melengkung
                            boxShadow: [  // Menambahkan bayangan
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),  // Warna bayangan
                                spreadRadius: 3,  // Ukuran sebaran bayangan
                                blurRadius: 5,  // Tingkat kabur bayangan
                                offset: const Offset(0, 3),  // Posisi bayangan
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/logo_kuis.png',  // Mengganti jalur dan nama file gambar
                            fit: BoxFit.contain,  // Mengatur cara gambar ditampilkan
                          ),
                        ),
                        const SizedBox(height: 50),  // Jarak antara logo dan tombol
                        ElevatedButton(
                          onPressed: _navigateToQuizPage,  // Fungsi untuk menuju halaman kuis
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),  // Ukuran padding tombol
                            backgroundColor: Colors.purple,  // Warna latar belakang tombol
                          ),
                          child: const Text(
                            'QUIS!!',  // Teks pada tombol
                            style: TextStyle(
                              fontSize: 20,  // Ukuran teks
                              color: Colors.white,  // Warna teks
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),  // Jarak antara konten dan tombol navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Mengatur posisi tombol
              children: [
                ElevatedButton(
                  onPressed: _goToPreviousPage,  // Fungsi untuk kembali ke halaman sebelumnya
                  child: const Text('Kembali'),  // Teks pada tombol
                ),
                ElevatedButton(
                  onPressed: _goToNextPage,  // Fungsi untuk melanjutkan ke halaman berikutnya
                  child: const Text('Selanjutnya'),  // Teks pada tombol
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
