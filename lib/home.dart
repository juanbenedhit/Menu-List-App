// import halaman yang dibutuhkan
import 'package:flutter/material.dart';
import 'hamburger.dart';
import 'frenchfries.dart';
import 'login.dart';
import 'steak.dart';
import 'nuggets.dart';
import 'hotdog.dart';
import 'salad.dart';

// class untuk halaman home
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // mengimpan index tab pada bottom navigation bar
  int _selectedIndex = 0;

  // function untuk mengubah index tab pada bottom navigation bar
  void _onItemTapped(int index) {
    if (index == 1) {
      // Logout: kembali ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
    // mengupdate index
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // list menu dan import gambar dan tujuan halamannya
    final List<Map<String, dynamic>> items = [
      {"image": "images/hamburger.jpg", "page": const HamburgerPage()},
      {"image": "images/frenchfries.jpg", "page": const FrenchFriesPage()},
      {"image": "images/steak.jpg", "page": const SteakPage()},
      {"image": "images/nuggets.jpg", "page": const NuggetsPage()},
      {"image": "images/hotdog.jpg", "page": const HotdogPage()},
      {"image": "images/salad.jpg", "page": const SaladPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        // mendisable tombol back yang muncul dengan sendirinya
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown, //warna bacground
        centerTitle: true, //mengatur text menjadi tengah
        title: const Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold, // mengatur font menjadi bold
            fontSize: 20, // mengatur ukuran font
            color: Colors.white, //mengatur warna font
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12), //mengatur padding pada grid
        child: GridView.builder(
          //mengatur jarak, kolom, jarak, dan tinggi
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = items[index]; //mengambil item dari list
            return GestureDetector(
              // ketika di klik akan diarahkan ke halaman yang sesuai
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item['page']),
                );
              },
              child: Container(
                // mengatur warna, radius, dan box shadow
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                // mengatur gambar dan radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(item['image'], fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
      ),

      //mengatur bottom navigation bar, memberi warna, function, dan icon
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }
}
