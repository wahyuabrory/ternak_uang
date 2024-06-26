import 'package:flutter/material.dart';
import 'pages/module_page.dart';
import 'pages/profile_page.dart';
import 'pages/quiz.dart';
import 'pages/live_chart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Homepage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    TRHHomePage(),
    QuizPage(),
    LiveChartPage(),
    VideoListPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Live Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Modules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class TRHHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('TRH Home Page'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di ternak uang',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aplikasi Saham untuk semuanya',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildCard(
                  title: 'Card 1',
                  description: 'This is a description for Card 1.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 2',
                  description: 'This is a description for Card 2.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 3',
                  description: 'This is a description for Card 3.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 4',
                  description: 'This is a description for Card 4.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 5',
                  description: 'This is a description for Card 5.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                // Add more cards as needed
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang di ternak uang',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Aplikasi Saham untuk semuanya',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildCard(
                  title: 'Card 6',
                  description: 'This is a description for Card 6.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 7',
                  description: 'This is a description for Card 7.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 8',
                  description: 'This is a description for Card 8.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildCard(
                  title: 'Card 9',
                  description: 'This is a description for Card 9.',
                  imageUrl: 'https://via.placeholder.com/150',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                // Add more cards as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String description,
    required String imageUrl,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        width: 200, // Set card width
        height: 300, // Set card height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
