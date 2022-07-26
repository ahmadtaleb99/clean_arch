import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/app/extenstions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id.orEmpty() ?? '',
        numberOfNotifications: this?.numberOfNotifications.orZero() ?? 0,
        name: this?.name.orEmpty() ?? '');
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
        address: this?.address.orEmpty() ?? '',
        phone: this?.phone.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '');
  }
}

extension AuthenticationMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        customer: this?.customerResponse.toDomain(),
        contact: this?.contactResponse.toDomain());
  }
}

extension ForgetPasswordMapper on ForgetPasswordResponse? {
  ForgetPassword toDomain() {
    return ForgetPassword(support: this?.support.orEmpty() ?? '');
  }

}

extension ServiceMapper on ServiceResponse? {
  Service toDomain() {
    return Service(
        id: this?.id.orEmpty() ?? '',
        title: this?.title.orEmpty() ?? '',
        image: this?.image.orEmpty() ?? '');
  }
}

extension BannerMapper on BannerResponse? {
  Banner toDomain() {
    return Banner(
        id: this?.id.orEmpty() ?? '',
        title: this?.title.orEmpty() ?? '',
        image: this?.image.orEmpty() ?? '');
  }
}

extension StoreMapper on StoreResponse? {
  Store toDomain() {
    return Store(
        id: this?.id.orEmpty() ?? '',
        title: this?.title.orEmpty() ?? '',
        image: this?.image.orEmpty() ?? '');
  }
}

extension HomeObjectMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services =
        this?.homeDataResponse.services?.map((e) => e.toDomain()).toList() ?? [];
    List<Banner> banners =
        this?.homeDataResponse.banners?.map((e) => e.toDomain()).toList() ?? [];
    List<Store> stores =
        this?.homeDataResponse.stores?.map((e) => e.toDomain()).toList() ?? [];

    HomeData data = HomeData(services :services, banners : banners, stores : stores);

    return HomeObject(data:  data);
  }
}
