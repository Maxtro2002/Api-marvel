import 'package:flutter/material.dart';
import 'package:api_marvel/pages/home.dart';
import 'package:api_marvel/pages/characterList.dart';
import 'package:flutter/services.dart';

Future<void> loadFont() async {
  await rootBundle.load("assets/fonts/MarvelRegular-Dj83.ttf");
}

class MainAppEjemplo1 extends StatefulWidget {
  const MainAppEjemplo1({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppEjemplo1();
  }
}

class _MainAppEjemplo1 extends State<MainAppEjemplo1> {
  final List<Widget> pages = [Home(), ListCharacters()];
  int currentlyIndex = 0;

  void changePage(int index) {
    setState(() {
      currentlyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentlyIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // Cambia el color del texto del BottomNavigationBar a blanco
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: const TextStyle(color: Colors.white),
              ),
        ),
        child: BottomNavigationBar(
          onTap: changePage,
          backgroundColor: Colors.black,
          currentIndex: currentlyIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 0, 0),
          selectedLabelStyle:
              const TextStyle(fontFamily: 'MarvelRegular', fontSize: 20.0),
          unselectedLabelStyle:
              const TextStyle(fontFamily: 'MarvelRegular', fontSize: 20.0),
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(
              label: "INICIO",
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            BottomNavigationBarItem(
              label: "PERSONAJES",
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
