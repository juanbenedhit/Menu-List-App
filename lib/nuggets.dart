// mengimport semua halaman page
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

//class untuk halaman nuggets
class NuggetsPage extends StatefulWidget {
  const NuggetsPage({super.key});

  @override
  State<NuggetsPage> createState() => _NuggetsPageState();
}


// state untuk nuggets, tempat dan mengelola state dari nuggets
class _NuggetsPageState extends State<NuggetsPage> {
  static const String appTitle = 'Golden Crunch Nuggets';
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
            children: [
              ImageSection(image: 'images/nuggets.jpg'),
              TitleSection(
                name: 'Golden Crunch Nuggets',
                shortDesc:
                    'Crispy golden bites made from tender chicken breast',
              ),
              FavoriteButton(),
              TextSection(
                description:
                    'Our Chicken Nuggets are made from 100% tender chicken breast, seasoned and coated '
                    'in a golden, crispy breadcrumb crust. Each bite is juicy, flavorful, and satisfying — '
                    'perfect for kids and adults alike. Served hot and fresh, they pair wonderfully with '
                    'our selection of dipping sauces, including honey mustard, spicy BBQ, and garlic mayo.',
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

          // icon star
          const Icon(Icons.star, color: Colors.red, size: 32),
          const Text('4.0'),
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
  int _favoriteCount = 109;

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
