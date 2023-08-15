import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String fullName;
  final String email;
  final String imageUrl; // URL to the user's profile image

  ProfilePage({required this.fullName, required this.email, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 20),
            Text(
              'Full Name: $fullName',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(
      fullName: 'John Doe',
      email: 'john.doe@example.com',
      imageUrl: 'https://example.com/profile-image.jpg',
    ),
  ));
}
