import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';
import '../models/buyer.dart';
import '../models/sale_info.dart';
class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5000/api';
  
  static Future<List<Car>> getCars() async {
    final response = await http.get(Uri.parse('$baseUrl/cars'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }
  
  // Альтернативный способ
  static String getBaseUrl() {
    final uri = Uri.base;
    if (uri.host.contains('github.dev')) {
      // В Codespaces
      final codespaceName = uri.host.split('.')[0];
      return 'http://10.0.2.2:5000/api';
    } else {
      // Локальная разработка
      return 'http://10.0.2.2:5000/api';
    }
  }
}