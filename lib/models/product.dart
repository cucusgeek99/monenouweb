class Product {
  final String productId;
  final String productName;
  final String productDescription;
  final String category;
  final String imgurl;
  final String imgurl1;
  final double productPrice;
  final String userId;
  final String saveDate;
  final bool isValidated;
  final bool isPremium;
  

  Product( {this.productId, this.productName, this.productDescription,
      this.category,this.imgurl,this.imgurl1,this.productPrice,this.userId,this.saveDate,this.isValidated,this.isPremium});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': productName,
      'price': productPrice,
      'img' : imgurl,
      'img1':imgurl1,
      'description': productDescription,
      'category': category,
      'userId':userId,
      'saveDate':saveDate,
      'isValidated':isValidated,
      'isPremium':isPremium
      

    };
  }
 
  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        productName = firestore['name'],
        productPrice = firestore['price'],
        imgurl=firestore['img'],
        imgurl1=firestore['img1'],
        productDescription = firestore['description'],
        category = firestore['category'],
        userId=firestore['userId'],
        saveDate=firestore['saveDate'],
        isValidated=firestore['isValidated'],
        isPremium=firestore['isPremium'];


  // Product.fromFirestoree(Map<String, dynamic> firestore)
  //     : productId = firestore['productId'],
  //       productName = firestore['name'],
  //       productPrice = firestore['price'],
  //       img_url=firestore['img_url'],
  //       productDescription = firestore['description'],
  //       category = firestore['category'],
  //       userId=firestore['userId'],
  //       saveDate=firestore['saveDate'];

}
