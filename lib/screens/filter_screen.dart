import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/filters_view_model.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const route = "/filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption4;
  int? _selectedMinPrice;
  int? _selectedMaxPrice;
  final Map<String, bool> _selectedcheckboxOptions = {};

  @override
  void initState() {
    Provider.of<FiltersViewModel>(context, listen: false).fetchFiltersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final filtersViewModel = Provider.of<FiltersViewModel>(context);

    if (filtersViewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (filtersViewModel.error != null) {
      return Center(child: Text(filtersViewModel.error!));
    }

    if (_selectedcheckboxOptions.isEmpty &&
        filtersViewModel.commodities.isNotEmpty) {
      for (var commodity in filtersViewModel.commodities) {
        _selectedcheckboxOptions[commodity] = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 0,
                  children: filtersViewModel.continents.map((continent) {
                    return buildRadioTile(continent, _selectedOption1, (value) {
                      setState(() {
                        _selectedOption1 = value;
                      });
                    });
                  }).toList(),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Commodity Sector",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: filtersViewModel
                          .commoditiesValuesMap["Commodity Sector"]
                          ?.map((value) => buildRadioTile2(value))
                          .toList() ??
                      [],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Individual Commodities",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _selectedcheckboxOptions.keys.map((option) {
                    return buildCheckboxTile(option);
                  }).toList(),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Project Stage/Asset Status",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: filtersViewModel
                          .promptValuesMap["Project Stage/Asset Status"]
                          ?.map((value) => buildRadioTile3(value))
                          .toList() ??
                      [],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Intention",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: filtersViewModel.intentionValuesMap["Intention"]
                          ?.map((value) => buildRadioTile4(value))
                          .toList() ??
                      [],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Price Range",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: buildPriceDropdown("Min Price", _selectedMinPrice,
                          filtersViewModel.priceRange!.minPriceRange!,
                          (int? newValue) {
                        setState(() {
                          _selectedMinPrice = newValue;
                        });
                      }),
                    ),
                    Expanded(
                      child: buildPriceDropdown("Max Price", _selectedMaxPrice,
                          filtersViewModel.priceRange!.maxPriceRange!,
                          (int? newValue) {
                        setState(() {
                          _selectedMaxPrice = newValue;
                        });
                      }),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        foregroundColor: const Color.fromARGB(255, 8, 41, 70),
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text("Clear Filters"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 8, 41, 70),
                      ),
                      child: const Text("Apply Filters"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioTile(
      String option, String? selectedOption, ValueChanged<String?> onChanged) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) / 2,
      child: ListTile(
        title: Text(option),
        leading: Radio<String>(
          value: option,
          groupValue: selectedOption,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget buildRadioTile2(String option) {
    return buildRadioTile(option, _selectedOption4, (value) {
      setState(() {
        _selectedOption4 = value;
      });
    });
  }

  Widget buildCheckboxTile(String option) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) / 2,
      child: ListTile(
        title: Text(option),
        leading: Checkbox(
          value: _selectedcheckboxOptions[option],
          onChanged: (bool? value) {
            setState(() {
              _selectedcheckboxOptions[option] = value ?? false;
            });
          },
        ),
      ),
    );
  }

  Widget buildRadioTile3(String option) {
    return buildRadioTile(option, _selectedOption3, (value) {
      setState(() {
        _selectedOption3 = value;
      });
    });
  }

  Widget buildRadioTile4(String option) {
    return buildRadioTile(option, _selectedOption4, (value) {
      setState(() {
        _selectedOption4 = value;
      });
    });
  }

  Widget buildPriceDropdown(String label, int? selectedValue, List<int> items,
      ValueChanged<int?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          DropdownButton<int>(
            value: selectedValue,
            isExpanded: true,
            hint: Text("Select $label"),
            items: items.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
