import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/poli.dart';

class PoliService {
  // Respons APILearn dibungkus: {code, message, data}.
  Future<List<Poli>> listData() async {
    final Response response = await ApiClient().get('poli');
    final List data = response.data['data'] as List;
    return data
        .map((json) => Poli.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<Poli> simpan(Poli poli) async {
    final Response response = await ApiClient().post('poli', poli.toJson());
    return _hasil(response, poli);
  }

  Future<Poli> ubah(Poli poli, String id) async {
    final Response response = await ApiClient().put('poli/$id', poli.toJson());
    return _hasil(response, poli, id: id);
  }

  Future<Poli> getById(String id) async {
    final Response response = await ApiClient().get('poli/$id');
    return Poli.fromJson(Map<String, dynamic>.from(response.data['data']));
  }

  Future<void> hapus(Poli poli) async {
    await ApiClient().delete('poli/${poli.id}');
  }

  // Server bisa saja tidak mengembalikan data lengkap setelah simpan/ubah;
  // pakai data yang dikirim sebagai cadangan agar layar detail tetap terisi.
  Poli _hasil(Response response, Poli kirim, {String? id}) {
    final body = response.data;
    final data = body is Map ? body['data'] : null;
    if (data is Map && data.isNotEmpty) {
      return Poli.fromJson(Map<String, dynamic>.from(data));
    }
    kirim.id ??= id;
    return kirim;
  }
}
