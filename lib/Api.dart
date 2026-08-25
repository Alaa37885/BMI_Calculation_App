import 'package:dio/dio.dart';

void main() async {
  var apiObjc = Dio();

  // GET - Fetch All Users
  var url = "https://jsonplaceholder.typicode.com/users";
  var res = await apiObjc.get(url);
  print("Users: ================================================================>");
  print(res);

  // POST - Create New User
  print("Create User: ==========================================================>");
  var body = {
    "name": "Sherry Moamen",
    "username": "S_M",
    "email": "sherry@nti.com"
  };
  var url3 = "https://dummyjson.com/users/add";
  var res3 = await apiObjc.post(
    url3,
    data: body,
  );

  print(res3);
}




