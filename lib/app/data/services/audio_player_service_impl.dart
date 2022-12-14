import 'package:audioplayers/audioplayers.dart';
import 'package:desafio_radio/app/data/datasoucer/audio_player.dart';

const _url =
    'http://ia802708.us.archive.org/3/items/count_monte_cristo_0711_librivox/count_of_monte_cristo_001_dumas.mp3';

class AudioAppImpl implements AudioApp {
  final AudioPlayer player;

  AudioAppImpl({required this.player});

  @override
  Future<void> setAudioPlayer() async {
    return await player.setSourceUrl(_url);
  }

  @override
  Future<void> playerAudio() async {
    setAudioPlayer();
    return await player.resume();
  }

  @override
  Future<void> stopAudio() async {
    return await player.stop();
  }
}
