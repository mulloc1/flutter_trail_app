import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/pages/home_page/widgets/direction_button.dart';
import 'package:flutter_trail_app/pages/station_list_page/station_list_page_provider.dart';

import '../../locales/locale_provider.dart';
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
        title: Text('appbar.home_page'.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: themeModeRef ? Icon(Icons.dark_mode) : Icon(Icons.dark_mode),
            onPressed: () {
              themeModeStateRef.state = !themeModeStateRef.state;
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.language),
            onSelected: (value) async {
              await context.setLocale(Locale(value));
              ref.read(destinationStationStateProvider.notifier).state = 'etc.choose'.tr();
              ref.read(sourceStationStateProvider.notifier).state = 'etc.choose'.tr();
            },
            itemBuilder: (_) => [
              PopupMenuItem(value: 'ko', child: Text('한국'),),
              PopupMenuItem(value: 'en', child: Text('English'),),
            ]
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StationSelectBox(),
          SizedBox(height: 20),
          DirectionButton(direction: ref.read(seatRouteProvider),),
        ],
      ),
    );
  }
}

