import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pegawai.dart';

class PegawaiService {
  // Respons APILearn dibungkus: {code, message, data}.
  Future<List<Pegawai>> listData() async {
    final Response response = await ApiClient().get('pegawai');
    final List data = response.data['data'] as List;
    return data
        .map((json) => Pegawai.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<Pegawai> simpan(Pegawai pegawai) async {
    final Response response = await ApiClient().post(
      'pegawai',
      pegawai.toJson(),
    );
    return _hasil(response, pegawai);
  }

  Future<Pegawai> ubah(Pegawai pegawai, String id) async {
    final Response response = await ApiClient().put(
      'pegawai/$id',
      pegawai.toJson(),
    );
    return _hasil(response, pegawai, id: id);
  }

  Future<Pegawai> getById(String id) async {
    final Response response = await ApiClient().get('pegawai/$id');
    return Pegawai.fromJson(Map<String, dynamic>.from(response.data['data']));
  }

  Future<void> hapus(Pegawai pegawai) async {
    await ApiClient().delete('pegawai/${pegawai.id}');
  }

  // Server bisa saja tidak mengembalikan data lengkap setelah simpan/ubah;
  // pakai data yang dikirim sebagai cadangan agar layar detail tetap terisi.
  Pegawai _hasil(Response response, Pegawai kirim, {String? id}) {
    final body = response.data;
    final data = body is Map ? body['data'] : null;
    if (data is Map && data.isNotEmpty) {
      return Pegawai.fromJson(Map<String, dynamic>.from(data));
    }
    kirim.id ??= id;
    return kirim;
  }
}
