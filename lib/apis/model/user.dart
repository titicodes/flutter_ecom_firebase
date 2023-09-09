class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String imageUrl;
  
  UserModel.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['image_url'] = imageUrl;
    return _data;
  }
}