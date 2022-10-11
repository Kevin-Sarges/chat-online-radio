import 'package:desafio_radio/app/data/datasoucer/audio_player.dart';
import 'package:desafio_radio/app/data/services/audio_player_service_impl.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<AudioApp>(AudioAppImpl());
  }
}
