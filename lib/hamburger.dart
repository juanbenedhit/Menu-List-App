// mengimport semua halaman page
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

//class untuk halaman hamburger 
class HamburgerPage extends StatefulWidget {
  const HamburgerPage({super.key});

  @override
  State<HamburgerPage> createState() => _HamburgerPageState();
}

// state untuk hamburger, tempat dan mengelola state dari hamburger
class _HamburgerPageState extends State<HamburgerPage> {
  static const String appTitle = 'Authentic Hamburger';
  int _selectedIndex = 0;

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
  // mengatur tampilan hamburger dan memberi warna, text, icon, dan gambar, mengatur gambar

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
            children: [
              ImageSection(image: 'images/hamburger.jpg'),
              TitleSection(
                name: 'Authentic Hamburger',
                shortDesc: 'Handmade Patty With Authentic taste',
              ),
              FavoriteButton(),
              TextSection(
                description:
                    'Our signature Authentic Hamburger is crafted with a 100% premium '
                    'grass-fed beef patty, hand-formed daily and grilled to perfection. '
                    'Topped with melted cheddar cheese, fresh lettuce, juicy tomatoes, '
                    'caramelized onions, and our secret house sauce - all served between '
                    'a toasted brioche bun. Each burger is made to order, ensuring that '
                    'every bite delivers an explosion of flavor. Pair it with our hand-cut '
                    'fries and homemade dipping sauce for the ultimate burger experience '
                    'that keeps our customers coming back for more!',
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          const Text('4.1'),
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
  int _favoriteCount = 142;

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
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}
