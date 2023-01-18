import 'package:knotted_donut_tdd/app/features/cart/repository/cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_providers.g.dart';

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository();
}
