import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_item.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
            pasien: Pasien(
              id: 1,
              nomorRm: "RM-001",
              nama: "Rio Adiansyah",
              tanggalLahir: "2006-08-16",
              nomorTelepon: "085875011617",
              alamat: "Jln plk No. 18 Kecamatan Pancoran Jakarta Selatan",
            ),
          ),
          PasienItem(
            pasien: Pasien(
              id: 2,
              nomorRm: "RM-002",
              nama: "Budi Santoso",
              tanggalLahir: "1985-12-20",
              nomorTelepon: "08123456780",
              alamat: "Jln. Merdeka No. 5",
            ),
          ),
        ],
      ),
    );
  }
}
