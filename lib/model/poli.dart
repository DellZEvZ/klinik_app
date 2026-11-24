class Poli {
  String? id;
  String namaPoli;

  Poli({this.id, required this.namaPoli});

  factory Poli.fromJson(Map<String, dynamic> json) => Poli(
    id: json['id']?.toString(),
    namaPoli: (json['nm_poli'] ?? '').toString(),
  );

  Map<String, dynamic> toJson() => {'nm_poli': namaPoli};
}
