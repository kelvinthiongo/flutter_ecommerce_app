class User {
  int id;
  String name;
  String email;
  String password;

  toJson(){
    return {
      'id' : id.toString(),
      'name' : name,
      'email' : email,
      'password' : password,
    };
  }
}