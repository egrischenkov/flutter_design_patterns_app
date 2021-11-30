/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import '../apis/audio_api.dart';
import '../apis/netflix_api.dart';
import '../apis/smart_home_api.dart';
import '../apis/tv_api.dart';
import '../smart_home_state.dart';
import 'gaming_facade.dart';

class SmartHomeFacade {
  final GamingFacade _gamingFacade = GamingFacade();
  final TvApi _tvApi = TvApi();
  final AudioApi _audioApi = AudioApi();
  final NetflixApi _netflixApi = NetflixApi();
  final SmartHomeApi _smartHomeApi = SmartHomeApi();

  void startMovie(SmartHomeState smartHomeState, String movieTitle) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOff();
    smartHomeState.tvOn = _tvApi.turnOn();
    smartHomeState.audioSystemOn = _audioApi.turnSpeakersOn();
    smartHomeState.netflixConnected = _netflixApi.connect();
    _netflixApi.play(movieTitle);
  }

  void stopMovie(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOn();
    smartHomeState.tvOn = _tvApi.turnOff();
    smartHomeState.audioSystemOn = _audioApi.turnSpeakersOff();
    smartHomeState.netflixConnected = _netflixApi.disconnect();
  }

  void startGaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOff();
    smartHomeState.tvOn = _tvApi.turnOn();
    _gamingFacade.startGaming(smartHomeState);
  }

  void stopGaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOn();
    smartHomeState.tvOn = _smartHomeApi.turnLightsOff();
    _gamingFacade.stopGaming(smartHomeState);
  }

  void startStreaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOn();
    smartHomeState.tvOn = _smartHomeApi.turnLightsOn();
    _gamingFacade.startStreaming(smartHomeState);
  }

  void stopStreaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightsOff();
    smartHomeState.tvOn = _smartHomeApi.turnLightsOff();
    _gamingFacade.stopGaming(smartHomeState);
  }
}