import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_marvel/pages/infoCharacter.dart';
import 'package:api_marvel/widgets/characterTitle.dart';

import '../controller/character.dart';

class ListCharacters extends StatefulWidget {
  @override
  _ListCharactersState createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  List<dynamic> characters = [];

  Future<void> getCharacters() async {
    const ts = '1036022400';
    const apiKey = '3120a5b21313225d07f1e4964712e341';
    const hash = '70370070e0609a0ee48e5e9058a0059c';

    const url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apiKey&hash=$hash&limit=50&offset=500';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        characters = jsonData['data']['results'];
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  void _showCharacterDetail(int index) {
    final character = characters[index];
    final name = character['name'];
    final thumbnail = character['thumbnail']['path'] +
        '.' +
        character['thumbnail']['extension'];
    final description = character['description'];
    // Validación para cuando description sea nulo o esté vacío
    const defaultDescription = 'Este personaje no tiene descripción.';
    final validDescription = (description == null || description.isEmpty)
        ? defaultDescription
        : description;
    final comics = character['comics']['available'];
    final series = character['series']['available'];
    final stories = character['stories']['available'];
    final events = character['events']['available'];
    final List<dynamic> seriesList = character['series']['items'];
    final seriesCount = min(seriesList.length, 3); // Validación para seriesList
    final List<String> seriesNames = seriesList
        .sublist(0, seriesCount)
        .map((item) => item['name'].toString())
        .toList();
    final Character selectedCharacter = Character(
        name: name,
        image: thumbnail,
        thumbnail: thumbnail,
        description: validDescription,
        comicsCount: comics,
        seriesCount: series,
        storiesCount: stories,
        eventsCount: events,
        firstThreeSeriesNames: seriesNames);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CharacterDetails(
                character: selectedCharacter,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 150),
        ),
      ),
      body: Center(
        child: characters.isEmpty
            ? const CircularProgressIndicator()
            : GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  final thumbnail = character['thumbnail']['path'] +
                      '.' +
                      character['thumbnail']['extension'];
                  final name = character['name'];
                  return GestureDetector(
                      onTap: () {
                        _showCharacterDetail(index);
                      },
                      child: CharacterTile(
                        character: characters[index],
                        onTap: () {
                          _showCharacterDetail(index);
                        },
                      ));
                },
              ),
      ),
    );
  }
}
