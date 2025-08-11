import 'package:ecommers_app/View/profile2prashant.dart';
import 'package:flutter/material.dart';// Make sure the path is correct

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to Edit Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
            },
            child: Container(
              color: const Color.fromARGB(255, 163, 141, 149),
              padding: const EdgeInsets.symmetric(vertical: 40),
              width: double.infinity,
              child: const Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/aneet.png'), // Replace with your asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' Aneet Padda',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Last visit: 04/08/2019',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.edit, color: Colors.white)
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ProfileInfo(label: 'YOUR NAME', value: ' Aneet Padda'),
                ProfileInfo(label: 'YOUR EMAIL', value: ' aneetpadda@gmail.com'),
                ProfileInfo(label: 'YOUR PASSWORD', value: '********'),
                ProfileInfo(label: 'YOUR PHONE', value: '+1.415.111.0000'),
                ProfileInfo(label: 'CITY, STATE', value: 'San Francisco, CA'),
                ProfileInfo(label: 'COUNTRY', value: 'USA'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 5),
          Text(value,
              style: const TextStyle(
                  fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
          Divider()
        ],
      ),
    );
  }
}

