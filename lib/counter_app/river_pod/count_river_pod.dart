import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountRiverPod extends StateNotifier<int> {
  CountRiverPod(this.ref) : super(0);

  final Ref ref;

  Future<void> plus() async{
    state++;
  }

  Future<void> minus() async {
    state--;
  }
}

final countStateRiverpod = StateNotifierProvider<CountRiverPod,int>((ref) {
  return CountRiverPod(ref);
});