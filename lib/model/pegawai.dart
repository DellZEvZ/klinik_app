class Pegawai {
  String? id;
  String nip;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String email;
  String password;

  Pegawai({
    this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password,
  });

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
    id: json['id']?.toString(),
    nip: (json['nip'] ?? '').toString(),
    nama: (json['nama'] ?? '').toString(),
    tanggalLahir: (json['tanggal_lahir'] ?? '').toString(),
    nomorTelepon: (json['nomor_telepon'] ?? '').toString(),
    email: (json['email'] ?? '').toString(),
    password: (json['password'] ?? '').toString(),
  );

  Map<String, dynamic> toJson() => {
    'nip': nip,
    'nama': nama,
    'tanggal_lahir': tanggalLahir,
    'nomor_telepon': nomorTelepon,
    'email': email,
    'password': password,
  };
}
