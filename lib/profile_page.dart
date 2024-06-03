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
                name: 'John Doe',
                npm: '1234567890',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                buttonText: 'Edit Profile',
                onPressed: () {
                  // Handle button press
                },
                profileImage:
                    'https://via.placeholder.com/150', // Placeholder image URL
              ),
            ),
            SizedBox(width: 16), // Add spacing between columns
            Expanded(
              child: _buildProfileInfo(
                name: 'Jane Doe',
                npm: '0987654321',
                description:
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                    'nisi ut aliquip ex ea commodo consequat.',
                buttonText: 'Edit Profile',
                onPressed: () {
                  // Handle button press
                },
                profileImage:
                    'https://via.placeholder.com/150', // Placeholder image URL
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
