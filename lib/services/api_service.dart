import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Gunakan IP 10.0.2.2 jika pakai Emulator Android, 
  // atau IP laptop kamu (contoh: 192.168.1.X) jika run di HP fisik
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // Login
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }

  // Ambil Progres Course Keseluruhan
  static Future<int> getCourseProgress(int courseId, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/courses/$courseId/progress'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['progress_percentage'];
    }
    return 0;
  }

  // Tandai Materi Selesai
  static Future<bool> completeMaterial(int materialId, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/progress/complete'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'material_id': materialId}),
    );

    return response.statusCode == 200;
  }
}