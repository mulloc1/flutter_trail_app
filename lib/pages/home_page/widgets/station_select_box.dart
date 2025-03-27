import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/route/routes_provider.dart';
import 'package:go_router/go_router.dart';

import '../../station_list_page/station_list_page_provider.dart';

class StationSelectBox extends ConsumerWidget {
  const StationSelectBox({super.key});

  Widget _selectDestinationStation(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.go(ref.read(stationRouteProvider));
          ref.read(stationStateToggleProvider.notifier).state = false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'etc.arrival'.tr(),
              style: TextStyle(
                fontSize: 16, // 글자 크기: 16
                color: Colors.grey, // 글자 색상: Colors.grey
                fontWeight: FontWeight.bold, // 글자 두께: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Text(
              ref.watch(destinationStationStateProvider),
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectSourceStation(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref.read(stationStateToggleProvider.notifier).state = true;
          context.go(ref.read(stationRouteProvider));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'etc.departure'.tr(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              ref.watch(sourceStationStateProvider),
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200, // 높이: 200
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // 모서리 둥글기: 20
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _selectSourceStation(context, ref),
          Container(
            width: 2, // 너비: 2
            height: 50, // 높이: 50
            color: Colors.grey[400], // 색상: Colors.grey[400]
          ),
          _selectDestinationStation(context, ref),
        ],
      ),
    );
  }
}
