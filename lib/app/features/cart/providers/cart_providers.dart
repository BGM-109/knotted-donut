import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/repository/firestore_cart_repository.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';

final cartProvider = StreamProvider<CartModel>((ref) {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return ref.watch(firestoreRemoteRepositoryProvider).watchCart(user.uid);
  } else {
    throw Error();
  }
});

final watchDonutProvider = StreamProvider<List<DonutModel>>((ref) async* {
  final repository = ref.read(donutRepositoryProvider);
  final result = await repository.getDonuts().then((value) => value.data);
  yield result;
});

final itemProvider =
    StateProvider.family<AsyncValue<DonutModel?>, String>((ref, id) {
  final watch = ref.watch(watchDonutProvider);
  return watch.whenData(
      (value) => value.firstWhere((element) => element.id.toString() == id));
});

final watchItemProvider =
    StreamProvider.family<DonutModel?, String>((ref, id) async* {
  final repository = ref.read(donutRepositoryProvider);
  final result = await repository.getDonuts().then((value) => value.data);
  yield result.firstWhere((element) => element.id.toString() == id);
});
