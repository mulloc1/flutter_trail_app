import 'package:flutter_riverpod/flutter_riverpod.dart';

final stationsListProvider = Provider<List<String>>((ref) {
  return [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];
});

final sourceStationStateProvider = StateProvider<String> ((ref) => '선택');

final destinationStationStateProvider = StateProvider<String> ((ref) => '선택');

final stationStateToggleProvider = StateProvider<bool> ((ref) => true);

final destinationStationListProvider = Provider<List<String>>((ref) {
  return ref.read(stationsListProvider).where((element) {
    return element != ref.watch(sourceStationStateProvider);
  }).toList();
});

final sourceStationListProvider = Provider<List<String>>((ref) {
  return ref.read(stationsListProvider).where((element) {
    return element != ref.watch(destinationStationStateProvider);
  }).toList();
});