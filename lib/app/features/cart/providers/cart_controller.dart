import 'package:knotted_donut_tdd/app/features/cart/model/item_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/service/cart_service.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  @override
  FutureOr build() {}

  Future<void> addItem(String productId) async {
    final cartService = ref.read(cartServiceProvider);
    final quantity = ref.read(detailCountProivder);
    final item = ItemModel(id: productId, quantity: quantity);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.addItem(item));
  }
}
