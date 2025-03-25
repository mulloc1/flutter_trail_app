import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRouteProvider = Provider<String>((ref) {
  return '/home';
});

final seatRouteProvider = Provider<String>((ref) {
  return '/seat';
});

final stationRouteProvider = Provider<String>((ref) {
  return '/station';
});