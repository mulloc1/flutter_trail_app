import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/route/routes_provider.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page/home_page.dart';
import '../pages/seat_page/seat_page.dart';
import '../pages/station_list_page/station_list_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final homeRef = ref.read(homeRouteProvider);
  final seatRef = ref.read(seatRouteProvider);
  final stationRef = ref.read(stationRouteProvider);

  return GoRouter(
    initialLocation: homeRef,
    routes: [
      GoRoute(
        path: homeRef,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
         path: seatRef,
         builder: (context, state) => const SeatPage(),
      ),
      GoRoute(
        path: stationRef,
        builder: (context, state) => const StationListPage(),
      ),
    ],
  );
});