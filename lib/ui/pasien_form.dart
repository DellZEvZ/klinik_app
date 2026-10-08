import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNomorRm(),
                _fieldNama(),
                _fieldTanggalLahir(),
                _fieldNomorTelepon(),
                _fieldAlamat(),
                const SizedBox(height: 20),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNomorRm() {
    return TextField(
      controller: _nomorRmCtrl,
      decoration: const InputDecoration(labelText: "Nomor RM"),
    );
  }

  Widget _fieldNama() {
    return TextField(
      controller: _namaCtrl,
      decoration: const InputDecoration(labelText: "Nama Pasien"),
    );
  }

  Widget _fieldTanggalLahir() {
    return TextField(
      controller: _tanggalLahirCtrl,
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
    );
  }

  Widget _fieldNomorTelepon() {
    return TextField(
      controller: _nomorTeleponCtrl,
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
    );
  }

  Widget _fieldAlamat() {
    return TextField(
      controller: _alamatCtrl,
      decoration: const InputDecoration(labelText: "Alamat"),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pasien pasien = Pasien(
          nomorRm: _nomorRmCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tanggalLahirCtrl.text,
          nomorTelepon: _nomorTeleponCtrl.text,
          alamat: _alamatCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)),
        );
      },
      child: const Text("Simpan"),
    );
  }
}
