import 'package:flutter/material.dart';
import 'package:api_marvel/controller/character.dart';

class DetailCharacter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailCharacter();
  }
}

class _DetailCharacter extends State<DetailCharacter> {
  @override
  Widget build(BuildContext context) {
    Character args = ModalRoute.of(context)?.settings.arguments as Character;

    String characterName = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del personaje'),
      ),
      body: Center(
        child: Text(characterName),
      ),
    );
  }
}
