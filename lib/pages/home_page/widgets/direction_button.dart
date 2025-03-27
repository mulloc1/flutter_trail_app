import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DirectionButton extends ConsumerWidget {
  final String direction;

  const DirectionButton({super.key, required this.direction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          context.go(direction);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, // 버튼 색상: Colors.purple
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // 모서리 둥글기: 20
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'button.seat_page'.tr(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}