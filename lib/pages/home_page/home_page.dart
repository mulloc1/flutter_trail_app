import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/pages/home_page/widgets/direction_button.dart';

import '../../providers/theme_provider.dart';
import '../../route/routes_provider.dart';
import 'widgets/station_select_box.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeRef = ref.watch(themeModeProvider);
    final themeModeStateRef = ref.read(themeModeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: themeModeRef ? Icon(Icons.dark_mode) : Icon(Icons.dark_mode),
            onPressed: () {
              themeModeStateRef.state = !themeModeStateRef.state;
            },
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationSelectBox(),
            SizedBox(height: 20),
            DirectionButton(text: '좌석 선택', direction: ref.read(seatRouteProvider),),
          ],
        ),
    );
  }
}

