import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pasien")),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Pasien 1 - Rio"))),
            onTap: () {
              Pasien pasien1 = Pasien(
                id: 1,
                nomorRm: "RM-001",
                nama: "Rio Adiansyah",
                tanggalLahir: "2006-08-16",
                nomorTelepon: "085875011617",
                alamat: "Jln plk No. 18 Kecamatan Pancoran Jakarta Sealatan",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
