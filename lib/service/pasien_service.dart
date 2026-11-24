import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  // Respons APILearn dibungkus: {code, message, data}.
  Future<List<Pasien>> listData() async {
    final Response response = await ApiClient().get('pasien');
    final List data = response.data['data'] as List;
    return data
        .map((json) => Pasien.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<Pasien> simpan(Pasien pasien) async {
    final Response response = await ApiClient().post('pasien', pasien.toJson());
    return _hasil(response, pasien);
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    final Response response = await ApiClient().put(
      'pasien/$id',
      pasien.toJson(),
    );
    return _hasil(response, pasien, id: id);
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/$id');
    return Pasien.fromJson(Map<String, dynamic>.from(response.data['data']));
  }

  Future<void> hapus(Pasien pasien) async {
    await ApiClient().delete('pasien/${pasien.id}');
  }

  // Server bisa saja tidak mengembalikan data lengkap setelah simpan/ubah;
  // pakai data yang dikirim sebagai cadangan agar layar detail tetap terisi.
  Pasien _hasil(Response response, Pasien kirim, {String? id}) {
    final body = response.data;
    final data = body is Map ? body['data'] : null;
    if (data is Map && data.isNotEmpty) {
      return Pasien.fromJson(Map<String, dynamic>.from(data));
    }
    kirim.id ??= id;
    return kirim;
  }
}
