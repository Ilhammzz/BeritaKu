import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari berita apa?',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
      body: Column(
        children: [
          // TabBar Categories
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TabItem(label: 'Olympics'),
                TabItem(label: 'Ekonomi'),
                TabItem(label: 'Politik'),
                TabItem(label: 'Kesehatan'),
              ],
            ),
          ),
          // Breaking News Section
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                BreakingNewsCard(
                  title: 'PS 6 akan siap diluncurkan awal tahun 2022',
                  date: 'Sabtu, 31 Juli 2021',
                  image: '/ps6.png', // Replace with your image path
                  category: 'Teknologi',
                ),
                BreakingNewsCard(
                  title: 'Update terbaru kasus Covid-19 di dunia',
                  date: 'Jumat, 30 Juli 2021',
                  image: '/covid.png', // Replace with your image path
                  category: 'Kesehatan',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  const TabItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

class BreakingNewsCard extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final String category;

  const BreakingNewsCard({
    required this.title,
    required this.date,
    required this.image,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
     ),
);
}
}