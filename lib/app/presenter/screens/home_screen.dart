import 'package:desafio_radio/app/data/datasoucer/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // final homeController = HomeController();
  final controllerAudio = GetIt.I.get<AudioApp>();

  final Widget _gradient = Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 51, 51),
          Color.fromARGB(255, 255, 230, 0),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  _gradient,
                  Image.asset(
                    'assets/images/salvaterra.png',
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await controllerAudio.playerAudio();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.play_arrow),
                        SizedBox(width: 10),
                        Text(
                          'Reproduzir',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      controllerAudio.stopAudio();
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.pause),
                        SizedBox(width: 10),
                        Text(
                          'Parar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
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
