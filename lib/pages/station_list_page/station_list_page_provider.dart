import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stationsListProvider = Provider<List<String>>((ref) {
  return [
    'stations.suseo'.tr(),
    'stations.pyenongtaek_jije'.tr(),
    'stations.Osong'.tr(),
    'stations.daejeon'.tr(),
    'stations.gimcheon_gumi'.tr(),
    'stations.dongdaegu'.tr(),
    'stations.gyeongju'.tr(),
    'stations.ulsan'.tr(),
    'stations.busan'.tr(),
  ];
});

final sourceStationStateProvider = StateProvider<String> ((ref) => 'etc.choose'.tr());

final destinationStationStateProvider = StateProvider<String> ((ref) => 'etc.choose'.tr());

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