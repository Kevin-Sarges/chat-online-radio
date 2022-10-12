// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:desafio_radio/app/data/services/audio_player_service_impl.dart';
import 'package:desafio_radio/app/presenter/controllers/home_controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeInitial());

  final audioService = AudioAppImpl(player: AudioPlayer());

  Future<void> _setUrlPlayer() async {
    emit(HomeLoading());

    try {
      await audioService.setAudioPlayer();
    } catch (e) {
      emit(HomeError(
        'Erro na url do audio !!',
      ));
    }
  }

  Future<void> playAudio() async {
    emit(HomeLoading());

    try {
      _setUrlPlayer();
      await audioService.playerAudio();
    } catch (e) {
      emit(HomeError(
        'Erro na url do audio !!',
      ));
    }
  }

  Future<void> pause() async {
    emit(HomeLoading());

    try {
      await audioService.pauseAudio();
    } catch (e) {
      emit(HomeError(
        'Erro na url do audio !!',
      ));
    }
  }
}
