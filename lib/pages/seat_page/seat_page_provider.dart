import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<List<StateProvider>> seatProvider =
List.generate(20, (index) =>
    List.generate(4, (index) =>
        StateProvider<bool>((ref) => false))
);

final seatRowProvider = StateProvider<int>((ref) => 0);

final seatColumnProvider = StateProvider<int>((ref) => 0);