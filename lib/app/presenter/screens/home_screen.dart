import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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

  final player = AudioPlayer();

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
                      String url =
                          'http://ia802708.us.archive.org/3/items/count_monte_cristo_0711_librivox/count_of_monte_cristo_001_dumas.mp3';

                      await player.setSourceUrl(url);

                      player.resume();
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
                      player.stop();
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
            )
          ],
        ),
      ),
    );
  }
}
