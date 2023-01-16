import 'package:knotted_donut_tdd/app/features/banner/banner_model.dart';

class BannerRepository {
  Future<List<BannerModel>> getBanners() async {
    return await Future.delayed(const Duration(milliseconds: 500), () {
      return [
        BannerModel(
            "https://cdn.litt.ly/images/lHZdBT9uUQgRAqXMME3yM5bhIodwWqo3?s=600x100&m=outside&f=webp",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://linkstorage.linkfire.com/medialinks/images/40721177-c6c6-4c3d-b953-32294c953545/artwork-440x440.jpg",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel("https://img-app.knotted-order.com/app/banners/47/47",
            "https://www.instagram.com/cafeknotted/"),
      ];
    });
  }

  Future<List<BannerModel>> getInstagram() async {
    return await Future.delayed(const Duration(milliseconds: 500), () {
      return [
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17952903641344016",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17951206238218337",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17930728721505054",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17876884715755208",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17870136071818713",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/18024462898424346",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17899094675717609",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17997246235541327",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/17934848672466799",
            "https://www.instagram.com/cafeknotted/"),
        BannerModel(
            "https://img-app.knotted-order.com/instagrams/18160517704278468",
            "https://www.instagram.com/cafeknotted/"),
      ];
    });
  }
}
