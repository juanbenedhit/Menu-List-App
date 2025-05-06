// mengimport semua halaman page
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

//class untuk halaman hotdog
class HotdogPage extends StatefulWidget {
  const HotdogPage({super.key});

  @override
  State<HotdogPage> createState() => _HotdogPageState();
}

// state untuk hotdog, tempat dan mengelola state dari hotdog
class _HotdogPageState extends State<HotdogPage> {
  static const String appTitle = 'Grilled Street Hotdog';
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

  // mengatur tampilan hotdog dan memberi warna, text, icon, dan gambar, mengatur gambar
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
              ImageSection(image: 'images/hotdog.jpg'),
              TitleSection(
                name: 'Grilled Street Hotdog',
                shortDesc: 'Juicy sausage wrapped in a soft, toasted bun',
              ),
              FavoriteButton(),
              TextSection(
                description:
                    'Our classic Hotdog features a juicy, all-beef sausage grilled to perfection, '
                    'nestled inside a warm, toasted bun. Topped with your choice of condiments — '
                    'including mustard, ketchup, relish, and onions — it delivers a perfect balance '
                    'of smoky, savory flavor in every bite. Whether enjoyed as a quick snack or a hearty meal, '
                    'this timeless favorite brings the taste of classic street food right to your table.',
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
  int _favoriteCount = 179;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _favoriteCount += _isFavorite ? 1 : -1;
    });
  }

  // mengatur tampilan icon, warna, dan mengatur fonts
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
  Widget build(BuildContext context) {
    // mengatur ukuran gambar
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}
