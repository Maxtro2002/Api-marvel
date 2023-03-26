import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final Map<String, dynamic> character;
  final VoidCallback onTap;

  const CharacterTile({Key? key, required this.character, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = character['name'];
    final thumbnail = character['thumbnail']['path'] +
        '.' +
        character['thumbnail']['extension'];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
