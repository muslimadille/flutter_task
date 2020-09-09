import 'package:flutter_task/api/api_provider.dart';
import 'package:flutter_task/models/user_response.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}