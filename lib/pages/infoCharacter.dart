import 'package:flutter/material.dart';
import 'package:api_marvel/controller/character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  // Validación para cuando description sea nulo o esté vacío
  final defaultDescription = 'Este personaje no tiene descripción.';

  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 7),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      );
  Widget buildStaticsIcon(IconData icon) => CircleAvatar(
      radius: 25,
      backgroundColor: const Color.fromARGB(255, 237, 29, 36),
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              character.image,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              height: 21,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 21,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Text(
                character.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 13,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildStaticsIcon(Icons.menu_book),
                      const SizedBox(
                        width: 37,
                      ),
                      buildStaticsIcon(Icons.connected_tv_outlined),
                      const SizedBox(
                        width: 37,
                      ),
                      buildStaticsIcon(Icons.history_edu),
                      const SizedBox(
                        width: 37,
                      ),
                      buildStaticsIcon(Icons.event_note_sharp)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildButton(text: "Comics", value: character.comicsCount),
                      buildButton(text: "Series", value: character.seriesCount),
                      buildButton(
                          text: "Historias", value: character.storiesCount),
                      buildButton(
                          text: "Eventos", value: character.eventsCount),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Primeras tres series',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final seriesName in character.firstThreeSeriesNames)
                    Text(
                      seriesName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
