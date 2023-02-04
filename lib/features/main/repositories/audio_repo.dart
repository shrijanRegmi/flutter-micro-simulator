import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final providerOfAudioRepository = Provider<AudioRepo>((ref) {
  return AudioRepoImpl();
});

abstract class AudioRepo {
  Future<void> playClickSound();

  Future<void> setMute({required bool muted});

  Future<bool> getMute();
}

class AudioRepoImpl extends AudioRepo {
  static final player = AudioPlayer();

  @override
  Future<void> playClickSound() async {
    try {
      player.setAsset('assets/audio/click_soft.wav');
      await player.play();
    } catch (e) {
      log(e.toString());
      log('Error!!!: Playing click sound');
    }
  }

  @override
  Future<void> setMute({required bool muted}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_click_muted', muted);
    } catch (e) {
      log(e.toString());
      log('Error!!!: Setting mute to - $muted');
    }
  }

  @override
  Future<bool> getMute() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final val = prefs.getBool('is_click_muted');
      return val ?? false;
    } catch (e) {
      log(e.toString());
      log('Error!!!: Getting mute value');
      return true;
    }
  }
}
