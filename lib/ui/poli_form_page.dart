import 'package:flutter/material.dart';

class PoliFormPage extends StatefulWidget {
  const PoliFormPage({super.key});
  _PoliFormPageState createState() => _PoliFormPageState();
}

class _PoliFormPageState extends State<PoliFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Poli"),),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: "Nama Poli"),),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {}, child: Text("Simpan"))
              ],
            )),
      ),
    );
  }
}
