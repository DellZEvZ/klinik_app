import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorRmCtrl.text = widget.pasien.nomorRm;
    _namaCtrl.text = widget.pasien.nama;
    _tanggalLahirCtrl.text = widget.pasien.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
          id: widget.pasien.id,
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
      child: const Text("Simpan Perubahan"),
    );
  }
}
