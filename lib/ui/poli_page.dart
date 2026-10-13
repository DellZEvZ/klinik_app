import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_form.dart';
import 'poli_item.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PoliForm()),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          PoliItem(poli: Poli(namaPoli: "Poli Anak", id: "666")),
          PoliItem(poli: Poli(namaPoli: "Poli Kandungan", id: "777")),
          PoliItem(poli: Poli(namaPoli: "Poli Gigi", id: "888")),
          PoliItem(poli: Poli(namaPoli: "Poli THT", id: "999")),
        ],
      ),
    );
  }
}
