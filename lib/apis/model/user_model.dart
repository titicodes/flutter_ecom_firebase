import 'package:equatable/equatable.dart';

import 'cart_model.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  String? key;
  String? email;
  String? userId;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? bannerImage;
  String? contact;
  String? createdAt;
  bool? isVerified;
  String? fcmToken;
  List<CartItemModel>? cart;

  UserModel({
    this.email,
    this.userId,
    this.firstName,
    this.profilePic,
    this.bannerImage,
    this.key,
    this.contact,
    this.createdAt,
    this.lastName,
    this.isVerified,
    this.fcmToken,
    this.cart
  });

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    email = map['email'];
    userId = map['userId'];
    firstName = map['firstName'];
    profilePic = map['profilePic'];
    bannerImage = map['bannerImage'];
    key = map['key'];
    contact = map['contact'];
    createdAt = map['createdAt'];
    lastName = map['userName'];
    fcmToken = map['fcmToken'];
    isVerified = map['isVerified'] ?? false;
     if (map['followerList'] != null) {
      cart = <CartItemModel>[];
      map['cart'].forEach((value) {
        cart!.add(value);
      });
    }
  }
  toJson() {
    return {
      'key': key,
      "userId": userId,
      "email": email,
      'firstName': firstName,
      'profilePic': profilePic,
      'bannerImage': bannerImage,
      'contact': contact,
      'createdAt': createdAt,
      'userName': lastName,
      'isVerified': isVerified ?? false,
      'fcmToken': fcmToken,
      'cart': cart,
    };
  }

  UserModel copyWith({
    String? email,
    String? userId,
    String? firstName,
    String? profilePic,
    String? key,
    String? contact,
    String? bio,
    String? dob,
    String? bannerImage,
    String? createdAt,
    String? lastName,
    bool? isVerified,
    String? fcmToken,
    List<CartItemModel>? cart
  }) {
    return UserModel(
      email: email ?? this.email,
      contact: contact ?? this.contact,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      isVerified: isVerified ?? this.isVerified,
      key: key ?? this.key,
      profilePic: profilePic ?? this.profilePic,
      bannerImage: bannerImage ?? this.bannerImage,
      userId: userId ?? this.userId,
      lastName: lastName ?? this.lastName,
      fcmToken: fcmToken ?? this.fcmToken,
       cart: cart ?? this.cart,
    );
  }

  @override
  List<Object?> get props => [
        key,
        email,
        userId,
        firstName,
        lastName,
        profilePic,
        bannerImage,
        contact,
        createdAt,
        isVerified,
        fcmToken,
        cart
      ];
}
