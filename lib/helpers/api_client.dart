import 'package:dio/dio.dart';
import 'secrets.dart';

// API klinik di APILearn. Setiap request wajib membawa API Token (Bearer).
final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://apilearn.kaylabs.id/api/v1/p-fpblxtje/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiToken',
    },
  ),
);

class ApiClient {
  // Pesan error dari server (field "message") dipakai bila ada.
  Exception _error(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      return Exception(data['message'].toString());
    }
    return Exception(e.message ?? 'Tidak dapat terhubung ke server');
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(Uri.encodeFull(path));
    } on DioException catch (e) {
      throw _error(e);
    }
  }

  Future<Response> post(String path, Map<String, dynamic> data) async {
    try {
      return await dio.post(Uri.encodeFull(path), data: data);
    } on DioException catch (e) {
      throw _error(e);
    }
  }

  Future<Response> put(String path, Map<String, dynamic> data) async {
    try {
      return await dio.put(Uri.encodeFull(path), data: data);
    } on DioException catch (e) {
      throw _error(e);
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(Uri.encodeFull(path));
    } on DioException catch (e) {
      throw _error(e);
    }
  }
}
