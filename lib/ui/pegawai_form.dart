import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNip(),
                _fieldNama(),
                _fieldTanggalLahir(),
                _fieldNomorTelepon(),
                _fieldEmail(),
                _fieldPassword(),
                const SizedBox(height: 20),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldNip() {
    return TextField(
      controller: _nipCtrl,
      decoration: const InputDecoration(labelText: "NIP"),
    );
  }

  Widget _fieldNama() {
    return TextField(
      controller: _namaCtrl,
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
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

  Widget _fieldEmail() {
    return TextField(
      controller: _emailCtrl,
      decoration: const InputDecoration(labelText: "Email"),
    );
  }

  Widget _fieldPassword() {
    return TextField(
      controller: _passwordCtrl,
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pegawai pegawai = Pegawai(
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tanggalLahirCtrl.text,
          nomorTelepon: _nomorTeleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PegawaiDetail(pegawai: pegawai)),
        );
      },
      child: const Text("Simpan"),
    );
  }
}
