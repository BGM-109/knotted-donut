import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';

abstract class RemoteCartRepository {
  Future<CartModel> fetchCart(String uid);
  Stream<CartModel> watchCart(String uid);
  Future<void> setCart(String uid, CartModel cart);
}
