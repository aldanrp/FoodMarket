part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    client ??= http.Client();
    Uri url = Uri.parse(baseUrlUser + "login");
    try {
      var response = await client.post(
        url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );

      var data = jsonDecode(response.body);

      print("ini data responnya : " + data.toString());
      if (response.statusCode != 200) {
        String Message = data['data']['message'];
        throw Message;
      }

      User.token = data['data']['access_token'];
      User value = User.fromJson(data['data']['user']);
      print("ini data usernya : " + value.toString());

      return ApiReturnValue(message: 'Berhasil login ', value: value);
    } catch (e) {
      var erorr = e.toString();
      rethrow;
    }
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {required File pictureFile}) async {
    Uri url =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/register');

    print(pictureFile.path.toString());
    var data1 = json.encode(<String, String>{
      'name': user.name,
      'email': user.email,
      'password': password,
      'password_confirmation': password,
      'address': user.address,
      'city': user.city,
      'houseNumber': user.houseNumber,
      'phoneNumber': user.phoneNumber
    });

    print(pictureFile);
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
      print("ini data responnya : " + data.toString());
      if (response.statusCode != 200) {
        print(data['data']['message']);
      }

      User.token = data['data']['access_token'];
      User value = User.fromJson(data['data']['user']);
      print("ini data usernya : " + value.toString());
      var msg = 'data aman';
      try {
        ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
        value = value.copyWith(
            picturePath:
                "http://foodmarket-backend.buildwithangga.id/storage/" +
                    result.value);

        print("ini data valuenya kalau berhasil : " + value.toString());
      } catch (e) {
        msg = e.toString();
        value = value;
        print("ini data valuenya kalau gagal : " + value.toString());
      }

      return ApiReturnValue(message: 'Data Berhasil dimasukan ', value: value);
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    Uri url =
        Uri.parse('http://foodmarket-backend.buildwithangga.id/api/user/photo');

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

      print("ini data respon dari upload photo : " + data.toString());
      if (response.statusCode != 200) {
        throw data['data']['message'];
      } else {
        String imagePath = data['data'][0];
        print("ini path buat photonya :" + imagePath);
        return ApiReturnValue(
            message: 'Upload foto profile berhasil', value: imagePath);
      }
    } catch (e) {
      print("ini errrornya dari upload photo" + e.toString());
      rethrow;
    }
  }
}
