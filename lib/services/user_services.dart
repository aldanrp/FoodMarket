part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // return ApiReturnValue(message: "Data masuk ", value: mockUser);
    return ApiReturnValue(message: "Wrong Password or Number", value: mockUser);
  }
}
