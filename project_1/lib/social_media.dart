import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _socialMediaCard(String name, String url, String assetPath, Color color) {
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _launchURL(url),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 40,
                backgroundImage: AssetImage(assetPath),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                ),
                TextButton(
                  onPressed: () => _launchURL(url),
                  child: const Text('VIEW', style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
                const Text(
                  "Tap 'VIEW' to connect with me",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('SOCIAL MEDIA'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            _socialMediaCard('Facebook', 'https://www.facebook.com/your-profile', 'assets/facebook.png', Colors.blue),
            _socialMediaCard('LinkedIn', 'https://www.linkedin.com/in/your-profile', 'assets/linkedin.png', const Color.fromARGB(255, 0, 123, 255)),
            _socialMediaCard('Gmail', 'mailto:your-email@gmail.com', 'assets/gmail.png', Colors.green),
            _socialMediaCard('Pinterest', 'https://www.pinterest.com/your-profile', 'assets/download.jpg', const Color.fromARGB(255, 189, 8, 28)),
            _socialMediaCard('GitHub', 'https://github.com/your-profile', 'assets/github.jpg', const Color.fromARGB(255, 51, 51, 51)),
          ],
        ),
      ),
    );
  }
}

// Profile Page Widget
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _profileOption(Icons.thumb_up, 'Likes', () {
            // Action for Likes
            print('Likes tapped');
          }),
          _profileOption(Icons.comment, 'Comments', () {
            // Action for Comments
            print('Comments tapped');
          }),
          _profileOption(Icons.person_add, 'Following', () {
            // Action for Following
            print('Following tapped');
          }),
          _profileOption(Icons.post_add, 'Posts', () {
            // Action for Posts
            print('Posts tapped');
          }),
          _profileOption(Icons.logout, 'Logout', () {
            // Action for Logout
            print('Logout tapped');
          }),
        ],
      ),
    );
  }

  // Widget to create a profile option
  Widget _profileOption(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: GestureDetector(
          onTap: onTap, // Make the icon clickable
          child: Icon(icon, size: 40, color: Colors.blueAccent), // Icon color matching AppBar
        ),
        title: Text(title, style: const TextStyle(fontSize: 18)),
        onTap: onTap, // Make the ListTile clickable
      ),
    );
  }
}