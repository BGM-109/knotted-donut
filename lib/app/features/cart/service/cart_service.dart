import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/extension_cart.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/item_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/repository/firestore_cart_repository.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_service.g.dart';

// 카트 기능 클래스
// 원격 or 로컬 저장소로 분리가 가능
class CartService {
  final User? user;
  final FirestoreRemoteRepository remoteRepository;
  final Ref ref;
  CartService({
    required this.user,
    required this.remoteRepository,
    required this.ref,
  });

  // 카트 정보 불러오기
  Future<CartModel> fetchCart() async {
    if (user != null) {
      return await remoteRepository.fetchCart(user!.uid);
    } else {
      // 유저 정보 없음 에러
      return CartModel(items: {}, storeName: "");
    }
  }

  // 카트 정보 업데이트 하기
  Future<void> setCart(CartModel updated) async {
    if (user != null) {
      return await remoteRepository.setCart(user!.uid, updated);
    } else {
      // 유저 정보 없음 에러
    }
  }

  // 현재 선택된 가게 정보 체크
  CartModel checkStore(CartModel cart) {
    final StoreModel? currentStore = ref.read(selectedStoreProvider);
    if (currentStore == null) {
      // 정보 없음 에러
      throw Error();
    }
    if (cart.storeName != currentStore.name) {
      // 매장이 다름을 알리는 에러
      throw Error();
    }

    if (cart.storeName == "") {
      return cart.setStore(currentStore.name);
    }

    return cart.setStore(currentStore.name);
  }

  // 카트에 아이템 추가
  Future<void> addItem(ItemModel item) async {
    final cart = await fetchCart();
    final CartModel checked = checkStore(cart);
    final CartModel updated = checked.addItem(item);
    await setCart(updated);
  }

  // 카트 아이템 제거
  Future<void> removeItemById(String itemId) async {
    final cart = await fetchCart();
    final updated = cart.removeItemById(itemId);
    await setCart(updated);
  }
}

@riverpod
CartService cartService(CartServiceRef ref) {
  final user = FirebaseAuth.instance.currentUser;
  final remoteRepository = ref.read(firestoreRemoteRepositoryProvider);
  return CartService(user: user, remoteRepository: remoteRepository, ref: ref);
}
