import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';


@JsonSerializable()
class BaseResponse{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;


}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: 'customer')
  CustomerResponse? customerResponse;

  @JsonKey(name: 'contact')
  ContactResponse? contactResponse;



  factory AuthenticationResponse.fromJson(Map<String,dynamic> json) => _$AuthenticationResponseFromJson(json);
  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);

  AuthenticationResponse(this.contactResponse);
}




@JsonSerializable()
class CustomerResponse{
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'numberOfNotifications')
  int? numberOfNotifications;

  @JsonKey(name: 'name')
  String? name;

  factory CustomerResponse.fromJson(Map<String,dynamic> json) => _$CustomerResponseFromJson(json);
  Map<String,dynamic> toJson() => _$CustomerResponseToJson(this);

  CustomerResponse(this.name);
}


@JsonSerializable()
class ContactResponse{
  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'address')
  String? address;

  @JsonKey(name: 'link')
  String? link;

  ContactResponse(this.phone, this.address, this.link);

  factory ContactResponse.fromJson(Map<String,dynamic> json) => _$ContactResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ContactResponseToJson(this);
}


@JsonSerializable()
class ForgetPasswordResponse extends BaseResponse{


  @JsonKey(name: 'support')
  String? support;


  ForgetPasswordResponse(this.support);

  factory ForgetPasswordResponse.fromJson(Map<String,dynamic> json) => _$ForgetPasswordResponseFromJson(json);
  Map<String,dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}


