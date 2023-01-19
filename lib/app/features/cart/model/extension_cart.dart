import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/item_model.dart';

// 카트 모델 변경 메소드
extension MutableCart on CartModel {
  // 카트의 갯수를 덮어 씌운다.
  CartModel setItem(ItemModel item) {
    final copy = Map<String, int>.from(items);
    copy[item.id] = item.quantity;
    return CartModel(items: copy, storeName: storeName);
  }

  // 카트의 개수를 더한다.
  CartModel addItem(
    ItemModel item,
  ) {
    final copy = Map<String, int>.from(items);
    copy.update(
      item.id,
      (value) => item.quantity + value,
      ifAbsent: () => item.quantity,
    );

    return CartModel(items: copy, storeName: storeName);
  }

  // 카트의 아이템을 삭제한다.
  CartModel removeItemById(String productId) {
    final copy = Map<String, int>.from(items);
    copy.remove(productId);
    return CartModel(items: copy, storeName: storeName);
  }

  // 카트의 가게 이름을 변경한다.
  CartModel setStore(String newStore) {
    return CartModel(items: items, storeName: newStore);
  }
}
