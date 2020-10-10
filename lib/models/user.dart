class User {
  final String userId;
  final String name;
  final String email;
  // final String city;
  // final String country;
  final String phoneNumber;
  // final String imageUrl;

  User({ this.userId, this.name, this.email,  this.phoneNumber});






User.fromFirestore(Map<String, dynamic> firestore)
:userId= firestore['userId'],
email=firestore['email'],
phoneNumber=firestore['phone_number'],
name= firestore['name'];



}