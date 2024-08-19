import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mineexchange/models/filter_model.dart';
import '../models/mine_exchange_model.dart';

class ApiService {
  final String baseUrl =
      'https://stagingapi.theminexchange.com/api/v1/user/featured-projects';

  final String filterUrl =
      'https://stagingapi.theminexchange.com/api/v1/user/project-filters';

  Future<MineExchangeModel> fetchMineExchangeDetails() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      return MineExchangeModel.fromJson(data);
    } else {
      throw Exception('Failed to load featured projects');
    }
  }

  Future<FilterModel> fetchFilterDetails() async {
    final response = await http.get(Uri.parse(filterUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      return FilterModel.fromJson(data);
    } else {
      throw Exception('Failed to load featured projects');
    }
  }
}
