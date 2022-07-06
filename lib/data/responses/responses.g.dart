// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['contact'] == null
          ? null
          : ContactResponse.fromJson(json['contact'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..customerResponse = json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>);

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customerResponse,
      'contact': instance.contactResponse,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      json['name'] as String?,
    )
      ..id = json['id'] as String?
      ..numberOfNotifications = json['numberOfNotifications'] as int?;

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numberOfNotifications': instance.numberOfNotifications,
      'name': instance.name,
    };

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    ContactResponse(
      json['phone'] as String?,
      json['address'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'address': instance.address,
      'link': instance.link,
    };
