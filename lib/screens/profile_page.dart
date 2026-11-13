import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.pink,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),

            const SizedBox(height: 15),

            const Text(
              'Dinda Putri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            const Text('1124160092', style: TextStyle(fontSize: 16)),

            const Text('Teknik Informatika', style: TextStyle(fontSize: 16)),

            const Text('Kelas SE3', style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            const Text(
              'Saya adalah mahasiswa Teknik Informatika '
              'yang tertarik dengan teknologi dan pengembangan aplikasi.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.email, color: Colors.pink),
                    title: Text('Email'),
                    subtitle: Text('putdyenda@gmail.com'),
                  ),

                  const Divider(),

                  const ListTile(
                    leading: Icon(Icons.phone, color: Colors.pink),
                    title: Text('Nomor HP'),
                    subtitle: Text('-'),
                  ),

                  const Divider(),

                  const ListTile(
                    leading: Icon(Icons.code, color: Colors.pink),
                    title: Text('GitHub'),
                    subtitle: Text('dynda21'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
