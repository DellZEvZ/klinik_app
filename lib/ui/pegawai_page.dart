import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigator ke form tambah pegawai jika ada
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
            pegawai: Pegawai(
              id: 1,
              nip: "12345",
              nama: "Ucup Margonda",
              tanggalLahir: "1990-01-01",
              nomorTelepon: "08123456789",
              email: "ucup@gmail.com",
              password: "123",
            ),
          ),
          PegawaiItem(
            pegawai: Pegawai(
              id: 2,
              nip: "12346",
              nama: "Deli Kurniawan",
              tanggalLahir: "1992-05-10",
              nomorTelepon: "08129876543",
              email: "deli@gmail.com",
              password: "123",
            ),
          ),
        ],
      ),
    );
  }
}
