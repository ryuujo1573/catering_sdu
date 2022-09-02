import 'package:catering_sdu/pages/browse.dart';
import 'package:catering_sdu/pages/favorite.dart';
import 'package:catering_sdu/pages/home.dart';
import 'package:catering_sdu/pages/orders.dart';
import 'package:catering_sdu/pages/personal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static var _pageIndex = 0;
  static final pages = List.unmodifiable(const [
    HomePage(),
    FavorPage(),
    BrowsePage(),
    OrderPage(),
    PersonalPage(),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        cardTheme: const CardTheme(
          elevation: 16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: pages[_pageIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).primaryColor,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.food_bank_rounded), label: "Browse"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Personal"),
              ],
              currentIndex: _pageIndex,
              onTap: (i) => setState(() => _pageIndex = i),
            ),
          );
        },
      ),
    );
  }
}
