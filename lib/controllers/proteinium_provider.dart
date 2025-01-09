import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/model_data.dart';
import '../services/api_call.dart';

class ProteiniumProvider extends ChangeNotifier {
  final Map<int, bool> _expanded = {};
  MealCategories? _mealCategories;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  MealCategories? get mealCategories => _mealCategories;

  bool isExpanded(int index) {
    return _expanded[index] ?? false;
  }

  void toggleExpanded(int index) {


    if (_expanded[index] == null) {
      _expanded[index] = false;
    }
    _expanded[index] = !_expanded[index]!;
    notifyListeners();
  }

  Future<void> fetchMealCategories(String langId) async {
    try {
      final ApiService apiService = ApiService();
      final response = await apiService.getMealCategories(langId: langId);
      _mealCategories = MealCategories.fromJson(response);
      notifyListeners();
    } catch (e) {
      print('Error fetching meal categories: $e');
    }
  }
}
