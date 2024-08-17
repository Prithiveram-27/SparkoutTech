import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mine_exchange_model.dart';

class ApiService {
  final String baseUrl =
      'https://stagingapi.theminexchange.com/api/v1/user/featured-projects';

  Future<MineExchangeModel> fetchMineExchangeDetails() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      // Convert the JSON response to MineExchangeModel
      return MineExchangeModel.fromJson(data);
    } else {
      throw Exception('Failed to load featured projects');
    }
  }
}
