// mengimport semua halaman page
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

//class untuk halaman french fries
class SaladPage extends StatefulWidget {
  const SaladPage({super.key});

  @override
  State<SaladPage> createState() => _SaladPageState();
}

// state untuk french fries, tempat dan mengelola state dari french fries
class _SaladPageState extends State<SaladPage> {
  static const String appTitle = 'Garden Fresh Salad';
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
              ImageSection(image: 'images/salad.jpg'),
              TitleSection(
                name: 'Garden Fresh Salad',
                shortDesc:
                    'Fresh, colorful mix of vegetables and house dressing',
              ),
              FavoriteButton(),
              TextSection(
                description:
                    'Our Garden Salad is a refreshing mix of crisp lettuce, juicy cherry tomatoes, '
                    'sliced cucumbers, shredded carrots, and red onions, all tossed in a light house vinaigrette. '
                    'Perfect as a healthy side or a standalone dish, this salad offers a burst of freshness '
                    'in every bite. Add grilled chicken or tofu for a more filling option.',
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
          const Text('4.4'),
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
  int _favoriteCount = 121;

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
