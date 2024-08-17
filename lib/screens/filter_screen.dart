import 'package:flutter/material.dart';

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

  final Map<String, bool> _selectedcheckboxOptions = {
    'All': false,
    'Copper': false,
    'Nickel': false,
    'Lead': false,
    'Zinc': false,
    'Gold': false,
    'Cobalt': false,
    'Sand': false,
    'Steel': false,
    'Iron ore': false,
    'Tin': false,
    'Magnesium': false,
    'Gravel': false,
    'Silver': false,
  };

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          // height: screenHeight,
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
                  children: [
                    buildRadioTile('Asia'),
                    buildRadioTile('Africa'),
                    buildRadioTile('North America'),
                    buildRadioTile('South America'),
                    buildRadioTile('Europe'),
                    buildRadioTile('Australia'),
                  ],
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
                  runSpacing: 0,
                  children: [
                    buildRadioTile2('All Sectors'),
                    buildRadioTile2('Base Metals'),
                    buildRadioTile2('Precious Metals'),
                    buildRadioTile2('Energy Metals'),
                    buildRadioTile2('Bulk Commodities'),
                    buildRadioTile2('Speciality Metals'),
                    buildRadioTile2('Industrial Minerals'),
                  ],
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
                  spacing: 10, // Horizontal spacing
                  runSpacing: 10, // Vertical spacing
                  children: _selectedcheckboxOptions.keys.map((option) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 40) /
                          2, // Calculate width based on screen size
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
                  children: [
                    buildRadioTile3('Care and Maintenance'),
                    buildRadioTile3('Development'),
                    buildRadioTile3('Production'),
                    buildRadioTile3('Early stage exploration'),
                    buildRadioTile3('Advanced stage exploration'),
                  ],
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
                  children: [
                    buildRadioTile4('Farm in / Farm out'),
                    buildRadioTile4('Direct Sale'),
                    buildRadioTile4('Join venture'),
                    buildRadioTile4('Lease'),
                    buildRadioTile4('All Offers'),
                  ],
                ),
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

  Widget buildRadioTile(String option) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) /
          2, // Calculate width based on screen size
      child: ListTile(
        title: Text(option),
        leading: Radio<String>(
          value: option,
          groupValue: _selectedOption1,
          onChanged: (String? value) {
            setState(() {
              _selectedOption1 = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildRadioTile2(String option) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) /
          2, // Calculate width based on screen size
      child: ListTile(
        title: Text(option),
        leading: Radio<String>(
          value: option,
          groupValue: _selectedOption2,
          onChanged: (String? value) {
            setState(() {
              _selectedOption2 = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildRadioTile3(String option) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) /
          2, // Calculate width based on screen size
      child: ListTile(
        title: Text(option),
        leading: Radio<String>(
          value: option,
          groupValue: _selectedOption3,
          onChanged: (String? value) {
            setState(() {
              _selectedOption3 = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildRadioTile4(String option) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 40) /
          2, // Calculate width based on screen size
      child: ListTile(
        title: Text(option),
        leading: Radio<String>(
          value: option,
          groupValue: _selectedOption4,
          onChanged: (String? value) {
            setState(() {
              _selectedOption4 = value;
            });
          },
        ),
      ),
    );
  }
}
