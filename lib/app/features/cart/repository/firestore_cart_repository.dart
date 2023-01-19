import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/repository/remote_cart_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firestore_cart_repository.g.dart';

class FirestoreRemoteRepository implements RemoteCartRepository {
  final CollectionReference ref = FirebaseFirestore.instance
      .collection('carts')
      .withConverter<CartModel>(
          fromFirestore: (doc, _) => CartModel.fromJson(doc.data()!),
          toFirestore: (cart, _) => cart.toJson());

  @override
  Future<CartModel> fetchCart(String uid) async {
    return await ref.doc(uid).get().then((doc) {
      if (doc.exists) {
        return doc.data()! as CartModel;
      } else {
        ref.doc(uid).set(CartModel(items: {}, storeName: ""));
        return CartModel(items: {}, storeName: "");
      }
    });
  }

  @override
  Future<void> setCart(String uid, CartModel cart) async {
    return await ref.doc(uid).set(cart).catchError((e) {});
  }

  @override
  Stream<CartModel> watchCart(String uid) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
FirestoreRemoteRepository firestoreRemoteRepository(
    FirestoreRemoteRepositoryRef ref) {
  return FirestoreRemoteRepository();
}
