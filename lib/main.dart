import 'package:flutter/material.dart';
import 'package:mineexchange/screens/filter_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_Screen.dart';
import 'viewmodels/mine_exchange_view_model.dart';
import 'viewmodels/filters_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MineExchangeViewModel()),
        ChangeNotifierProvider(create: (_) => FiltersViewModel()),
      ],
      child: MaterialApp(
        title: 'MVVM Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          FilterScreen.route: (context) => const FilterScreen(),
        },
      ),
    );
  }
}
