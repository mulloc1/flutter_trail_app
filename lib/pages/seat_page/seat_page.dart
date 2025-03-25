import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_trail_app/pages/seat_page/seat_page_provider.dart';
import 'package:go_router/go_router.dart';

import '../../route/routes_provider.dart';
import '../station_list_page/station_list_page_provider.dart';

class SeatPage extends ConsumerWidget {
  const SeatPage({super.key});

  Widget _seatButton(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(width: 50, height: 50),
    );
  }

  Widget _seat(BuildContext context, WidgetRef ref, int rowNum, int columnNum) {
    final seatState = ref.watch(seatProvider[columnNum][rowNum]);

    return Padding(
      padding: EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
            ref.read(seatProvider[columnNum][rowNum].notifier).state = !seatState;
            ref.read(seatRowProvider.notifier).state = rowNum;
            ref.read(seatColumnProvider.notifier).state = columnNum;
        },
        child: Container(
          decoration: BoxDecoration(
            color: seatState ? Colors.purple : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(width: 50, height: 50),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            context.go(ref.read(homeRouteProvider));
          },
        ),
        title: Text('좌석 선택'),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        ref.read(sourceStationStateProvider),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_circle_right_outlined, size: 30),
                  Expanded(
                    child: Center(
                      child: Text(
                        ref.read(destinationStationStateProvider),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(width: 24, height: 24),
                      ),
                      SizedBox(width: 5),
                      Text('선택됨'),
                    ],
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(width: 24, height: 24),
                      ),
                      SizedBox(width: 5),
                      Text('선택됨'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Text('A', style: TextStyle(fontSize: 18)),
                                ),
                                Text('B', style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Text('C', style: TextStyle(fontSize: 18)),
                                ),
                                Text('D', style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(20, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _seat(context, ref, 0, index),
                                _seat(context, ref, 1, index),
                              ],
                            ),
                          ),
                          SizedBox(child: Text('${index + 1}')),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _seat(context, ref, 2, index),
                                _seat(context, ref, 3, index),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => AlertDialog(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '예매 하시겠습니까?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${ref.read(seatColumnProvider) + 1}: ${String.fromCharCode(ref.read(seatRowProvider) + 65)}',
                              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                            ),
                            SizedBox(height: 20),
                            Divider(height: 1),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    style: TextButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                                    child: Text(
                                      '취소',
                                      style: TextStyle(color: Colors.red, fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(width: 1, height: 48, color: Colors.grey[700]),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      context.go(ref.read(homeRouteProvider));
                                    },
                                    style: TextButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                                    child: Text(
                                      '확인',
                                      style: TextStyle(color: Colors.blue, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // 버튼 색상: Colors.purple
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 모서리 둥글기: 20
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    '예매 하기',
                    style: TextStyle(
                      color: Colors.white, // 글자 색상: Colors.white
                      fontSize: 18, // 글자 크기: 18
                      fontWeight: FontWeight.bold, // 글자 두께: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
