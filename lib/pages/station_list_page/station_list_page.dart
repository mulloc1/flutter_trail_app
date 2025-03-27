import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/pages/station_list_page/station_list_page_provider.dart';
import 'package:flutter_trail_app/route/routes_provider.dart';
import 'package:go_router/go_router.dart';

class StationListPage extends ConsumerWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 출발역 or 도착역 상태 관리 Provider
    final stationStateToggleRef = ref.read(stationStateToggleProvider);
    final stationRef =
        stationStateToggleRef
            ? ref.read(sourceStationStateProvider.notifier)
            : ref.read(destinationStationStateProvider.notifier);
    final stationListRef = stationStateToggleRef
            ? ref.watch(sourceStationListProvider)
            : ref.watch(destinationStationListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // 백도
            context.go(ref.read(homeRouteProvider));
          },
          child: Icon(CupertinoIcons.arrow_left),
        ),
        title: stationStateToggleRef ? Text('etc.departure'.tr()) : Text('etc.arrival'.tr()),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: stationListRef.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: ListTile(
                  title: Text(
                    stationListRef[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    stationRef.state = stationListRef[index].toString();
                    context.go(ref.read(homeRouteProvider));
                  },
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
