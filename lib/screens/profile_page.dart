import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Profile profil;

  @override
  void initState() {
    super.initState();

    profil = Profile(
      nama: 'Dinda Putri',
      nim: '1124160092',
      prodi: 'Teknik Informatika',
      kelas: 'SE3',
      email: 'putdyenda@gmail.com',
      hp: '-',
      github: 'dynda21',
      bio:
          'Saya adalah mahasiswa Teknik Informatika '
          'yang tertarik dengan teknologi dan pengembangan aplikasi.',
    );
  }

  void editProfil() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage(profile: profil)),
    );

    if (hasil != null) {
      setState(() {
        profil = hasil;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
            onPressed: editProfil,
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profil',
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/dinda.jpeg'),
            ),

            const SizedBox(height: 15),

            Text(
              profil.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(profil.nim),
            Text(profil.prodi),
            Text('Kelas ${profil.kelas}'),

            const SizedBox(height: 20),

            Text(profil.bio, textAlign: TextAlign.center),

            const SizedBox(height: 25),

            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.pink),
                    title: const Text('Email'),
                    subtitle: Text(profil.email),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.pink),
                    title: const Text('Nomor HP'),
                    subtitle: Text(profil.hp),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.code, color: Colors.pink),
                    title: const Text('GitHub'),
                    subtitle: Text(profil.github),
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
