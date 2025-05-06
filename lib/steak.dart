// mengimport semua halaman page
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

//class untuk halaman steak
class SteakPage extends StatefulWidget {
  const SteakPage({super.key});

  @override
  State<SteakPage> createState() => _SteakPageState();
}

// state untuk steak, tempat dan mengelola state dari steak
class _SteakPageState extends State<SteakPage> {
  static const String appTitle = 'Signature Grilled Steak';
  int _selectedIndex = 0;

  // function untuk mengatur bottom navigation bar
  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  // mengatur tampilan french fries dan memberi warna, text, icon, dan gambar, mengatur gambar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          elevation: 6,
          title: const Text(
            appTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            // menampilkan gambar beserta judul, fav button dan deskripsi menu
            children: [
              ImageSection(image: 'images/steak.jpg'),
              TitleSection(
                name: 'Signature Grilled Steak',
                shortDesc: 'Juicy grilled steak seasoned to perfection',
              ),
              FavoriteButton(),
              TextSection(
                description:
                    'Our premium Steak is expertly seasoned and grilled to your preferred doneness, '
                    'locking in rich, savory flavor with every bite. Served with a side of seasoned vegetables '
                    'and creamy mashed potatoes, it’s the perfect choice for meat lovers looking for a hearty, '
                    'satisfying meal. Customize with mushroom sauce, peppercorn, or garlic butter for the ultimate experience.',
              ),
            ],
          ),
        ),

        // memberi icon dan mengatur bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
          ],
        ),
      ),
    );
  }
}

//widget untuk menampilkan judul dan deskripsi
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.shortDesc});

  final String name;
  final String shortDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // untuk memperluas widget agar mengisi ruang kosong dalam Row atau Colomn
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // memberikan padding dan mengatur font
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  shortDesc,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          // icon star
          const Icon(Icons.star, color: Colors.red, size: 32),
          const Text('4.8'),
        ],
      ),
    );
  }
}

// state untuk mengelola favorit
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

// fungsi untuk mengelola favorit
class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;
  int _favoriteCount = 421;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _favoriteCount += _isFavorite ? 1 : -1;
    });
  }

  // mengatur tampilan icon, warna, dan mengatur font
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // memberi icon dan mengatur warna, ukuran, dan function ketika di klik
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
              size: 32,
            ),
            onPressed: _toggleFavorite,
          ),
          const SizedBox(width: 8),
          Text(
            '$_favoriteCount',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// widget untuk menamplkan deskripsi dan mengatur jarak
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

// widget untuk mengatur gambar dan mengatur ukuran gambar
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  // mengatur ukuran gambar
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}
