import 'package:flutter/material.dart';
import 'package:untitled/ui/poli_detail.dart';
import '../model/poli.dart';

class PoliFormPage extends StatefulWidget {
  const PoliFormPage({super.key});
  _PoliFormPageState createState() => _PoliFormPageState();
}

class _PoliFormPageState extends State<PoliFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Poli"),),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaPoli(),
                SizedBox(height: 20,),
                _tombolSimpan()
              ],
            )),
      ),
    );
  }
  _fieldNamaPoli() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }
  _tombolSimpan() {
    return ElevatedButton(onPressed: () {
      Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
    }, child: Text("Simpan"));
  }
}
