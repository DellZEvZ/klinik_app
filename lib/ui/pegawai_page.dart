import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView(
        children: [
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Pegawai 1 - Ucup"))),
            onTap: () {
              Pegawai pegawai1 = Pegawai(
                id: 1,
                nip: "12345",
                nama: "Ucup Margonda",
                tanggalLahir: "1990-01-01",
                nomorTelepon: "07777727777",
                email: "ucup@gmail.com",
                password: "123",
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai1),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
