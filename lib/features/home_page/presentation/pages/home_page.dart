import 'package:flutter/material.dart';
import 'package:movies_app/features/movies/presentation/pages/movies_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myCurrentIndex = 0;

  final List<Widget> pages = [
     MoviesPage(),
     MoviesPage(),
     MoviesPage(),
     MoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies App",
        style: TextStyle(
          fontSize: 30
        ),),
      ),
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child:  Theme(
             data: Theme.of(context).copyWith(
                canvasColor: Colors.black12,
             ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.white70,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
