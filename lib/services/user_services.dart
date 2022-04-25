part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // return ApiReturnValue(message: "Data masuk ", value: mockUser);
    return ApiReturnValue(message: "Wrong Password or Number", value: mockUser);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {required File pictureFile}) async {
    Uri url =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/register');

    var data = json.encode(<String, String>{
      'name': user.name,
      'email': user.email,
      'password': password,
      'password_confirmation': password,
      'address': user.address,
      'city': user.city,
      'houseNumber': user.houseNumber,
      'phoneNumber': user.phoneNumber
    });
    print(data);
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber
        }),
      );

      var data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        print(data['data']['message']);
      }

      User.token = data['data']['access_token'];
      User value = User.fromJson(data['data']['user']);
      print(data);
      if (pictureFile != null) {
        var msg = 'data aman';
        try {
          ApiReturnValue<String> result =
              await uploadProfilePicture(pictureFile);
          value = value.copyWith(
              picturePath:
                  "http://foodmarket-backend.test/storage/" + result.value);
        } catch (e) {
          msg = e.toString();
          value = value;
        }
      }

      return ApiReturnValue(message: 'Data Berhasil dimasukan ', value: value);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    Uri url = Uri.parse(baseUrlUser + 'user/photo');

    request ??= http.MultipartRequest("POST", url)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    try {
      var multipartFile =
          await http.MultipartFile.fromPath('file', pictureFile.path);
      request.files.add(multipartFile);

      var response = await request.send();

      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        throw data['data']['message'];
      } else {
        String imagePath = data['data'][0];

        return ApiReturnValue(
            message: 'Upload foto profile berhasil', value: imagePath);
      }
    } catch (e) {
      rethrow;
    }
  }
}
