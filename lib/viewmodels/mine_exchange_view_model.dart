import 'package:flutter/material.dart';
import '../models/mine_exchange_model.dart';
import '../services/api_service.dart';

class MineExchangeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<ProjectModel> project = [];
  bool _isLoading = false;
  String? _error;

  List<ProjectModel> get projects => project;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMineExchangeData() async {
    _isLoading = true;
    // notifyListeners();

    try {
      var temp = (await _apiService.fetchMineExchangeDetails());
      project = temp.data;
      _error = null;
    } catch (e) {
      _error = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
