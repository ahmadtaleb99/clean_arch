import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/app/extenstions.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        id: this?.id.orEmpty() ?? '',
        numberOfNotifications: this?.numberOfNotifications.orZero() ?? 0,
        name: this?.name.orEmpty() ?? '') ;
  }
}


extension ContactResponseMapper on ContactResponse? {
  Contact toDomain() {
    return Contact(
        address: this?.address.orEmpty() ?? '',
        phone: this?.phone.orEmpty() ?? '',
        link: this?.link.orEmpty() ?? '') ;
  }
}

extension AuthenticationMapper on AuthenticationResponse?{
  Authentication toDomain () {
    return Authentication(customer: this?.customerResponse.toDomain(), contact: this?.contactResponse.toDomain());
}
}
