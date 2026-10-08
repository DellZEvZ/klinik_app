import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nipCtrl.text = widget.pegawai.nip;
    _namaCtrl.text = widget.pegawai.nama;
    _tanggalLahirCtrl.text = widget.pegawai.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pegawai.nomorTelepon;
    _emailCtrl.text = widget.pegawai.email;
    _passwordCtrl.text = widget.pegawai.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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
          id: widget.pegawai.id,
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
      child: const Text("Simpan Perubahan"),
    );
  }
}
