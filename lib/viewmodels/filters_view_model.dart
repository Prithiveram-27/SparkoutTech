import 'package:flutter/material.dart';
import '../models/filter_model.dart';
import '../services/api_service.dart';

class FiltersViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Filter> filterData = [];
  PriceRange? priceRange;
  List<String> commodities = [];
  List<String> continents = [];
  bool _isLoading = false;
  String? _error;

  List<Filter> get projects => filterData;
  PriceRange? get priceRangeData => priceRange;
  List<String> get commoditiesData => commodities;
  List<String> get continentsData => continents;
  Map<String, List<String>> promptValuesMap = {};
  Map<String, List<String>> intentionValuesMap = {};
  Map<String, List<String>> commoditiesValuesMap = {};
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchFiltersData() async {
    _isLoading = true;

    try {
      FilterModel filterModel = await _apiService.fetchFilterDetails();
      filterData = filterModel.data['filters']
          .map<Filter>((json) => Filter.fromJson(json))
          .toList();

      _isLoading = false;
      notifyListeners();

      if (filterModel.data.containsKey('price_range')) {
        priceRange = PriceRange.fromJson(filterModel.data['price_range']);
      }

      if (filterModel.data.containsKey('commodities')) {
        commodities = List<String>.from(filterModel.data['commodities']);
      }

      if (filterModel.data.containsKey('continents')) {
        continents = List<String>.from(filterModel.data['continents']);
      }

      for (var filter in filterData) {
        if (filter.label == "Project Stage/Asset Status") {
          promptValuesMap[filter.label!] = filter.prompts!
              .map<String>((prompt) => prompt.promptValues!)
              .toList();
        }
        if (filter.label == "Intention") {
          intentionValuesMap[filter.label!] = filter.prompts!
              .map<String>((prompt) => prompt.promptValues!)
              .toList();
        }
        if (filter.label == "Commodity Sector") {
          commoditiesValuesMap[filter.label!] = filter.prompts!
              .map<String>((prompt) => prompt.promptValues!)
              .toList();
        }
      }
      _error = null;
    } catch (e) {
      _error = 'Failed to load data';
    }
  }
}
