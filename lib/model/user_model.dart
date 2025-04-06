class UserModel{
  final String ?name;
  final String ?phone;
  final String ?email;
  final String ?uid;
  final int ?status;
  final String ?profileImage;
  final String ?lat;
  final String ?long;
  UserModel({
    this.name,
    this.uid,
    this.phone,
    this.email,
    this.lat,
    this.long,
    this.status,
    this.profileImage
  });
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        status: json['status'],
        lat: json['latitude'],
        long: json['longitude'],
        uid: json['uid'],
        profileImage: json['profile_image']??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYP-KKtRJXm9qK7k2_PA1utxbxWdpzGIdulQ&s'
    );
  }



}