class UserModel {
  
  // Field
  int idInt;
  String nameString, userString, passwordString;

  // Constructor
  UserModel(this.idInt, this.nameString, this.userString, this.passwordString);

  UserModel.fromJson(Map<String, dynamic> parseJSON){

    idInt = int.parse(parseJSON['id']);
    nameString = parseJSON['Name'];
    userString = parseJSON['User'];
    passwordString = parseJSON['Password'];

  }


}