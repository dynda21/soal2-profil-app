import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Me'), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                'assets/images/dinda.jpeg',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                alignment: const Alignment(0, 0.7),
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'Dinda Putri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Tentang Saya',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const Text(
            'Saya mahasiswa Teknik Informatika yang tertarik '
            'dengan teknologi dan pengembangan aplikasi.',
          ),

          const SizedBox(height: 20),

          const Text(
            'Hobi dan Keahlian',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const ListTile(
            leading: Icon(Icons.movie),
            title: Text('Menonton film'),
          ),

          const ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Mendengarkan musik'),
          ),

          const ListTile(
            leading: Icon(Icons.computer),
            title: Text('Belajar teknologi dan aplikasi'),
          ),

          const SizedBox(height: 20),

          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const ListTile(
            leading: Icon(Icons.school),
            title: Text('SMA - Jurusan IPA'),
          ),

          const ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Global Institute'),
            subtitle: Text('Teknik Informatika'),
          ),
        ],
      ),
    );
  }
}
