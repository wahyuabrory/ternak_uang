import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildProfileInfo(
                name: 'M. wahyu Abrory',
                npm: '22082010058',
                description:
                    'Saya adalah mahasiswa Sistem informasi semester 4 . ',
                buttonText: 'Linkedin Abrory',
                onPressed: () {
                  // Handle button press
                },
                profileImage:
                    'assets/images/abrory.jpg', // Placeholder image URL
              ),
            ),
            SizedBox(width: 16), // Add spacing between columns
            Expanded(
              child: _buildProfileInfo(
                name: 'Reyza Reyznata',
                npm: '22082010058',
                description:
                    'Saya adalah mahasiswa Sistem informasi semester 4 . ',
                buttonText: 'Linkedin Reyza',
                onPressed: () {
                  // Handle button press
                },
                profileImage:
                    'assets/images/reyza.jpg', // Placeholder image URL
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo({
    required String name,
    required String npm,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
    required String profileImage,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(profileImage),
            ),
            SizedBox(height: 16),
            Text(
              'Name: $name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('NPM: $npm'),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
