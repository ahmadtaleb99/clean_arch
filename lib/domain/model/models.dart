class SliderPageObject {
  final String title;
  final String subTitle;
  final String image;

  SliderPageObject(this.title, this.subTitle, this.image);
}

class SliderPageViewObject {
  SliderPageObject sliderPageObject;
  int numberOfPages;
  int currentPageIndex;

  SliderPageViewObject(
      this.sliderPageObject, this.numberOfPages, this.currentPageIndex);
}

class Customer {
  String id;

  int numberOfNotifications;

  String name;

  Customer({
    required this.id,
    required this.numberOfNotifications,
    required this.name,
  });
}

class Contact {
  String phone;

  String address;

  String link;

  Contact({
    required this.phone,
    required this.address,
    required this.link,
  });
}

class Authentication {
  Customer? customer;
  Contact? contact;

  Authentication({
    required this.customer,
    required this.contact,
  });
}


class ForgetPassword{

  String? support;

  ForgetPassword({
    required  this.support,
  });
}

class Service {
  String id;
  String title;
  String image;

  Service({
    required this.id,
    required this.title,
    required this.image,
  });
}

class Banner {
  String id;
  String title;
  String image;

  Banner({
    required this.id,
    required this.title,
    required this.image,
  });
}


class Store {
  String id;
  String title;
  String image;

  Store({
    required this.id,
    required this.title,
    required this.image,
  });
}


class HomeData {
  List<Service>? services;

  List<Banner>? banners;

  List<Store>? stores;

  HomeData({
    this.services,
    this.banners,
    this.stores,
  });
}

class HomeObject {
   HomeData? data;

   HomeObject({
    this.data,
  });
}
