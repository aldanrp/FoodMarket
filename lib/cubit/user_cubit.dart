import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_food/models/models.dart';
import 'package:restaurant_food/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    var msg = "aman";
    ApiReturnValue<User> result;
    try {
      result =
          await UserServices.signUp(user, password, pictureFile: pictureFile);
      emit(UserLoaded(result.value));
    } catch (e) {
      msg = e.toString();
      emit(UserLoadingFailed(msg));
    }
  }

  Future<void> uploadPictureProfile(File pictureFile) async {
    try {
      ApiReturnValue<String> result =
          await UserServices.uploadProfilePicture(pictureFile);
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath:
              "http://foodmarket-backend.test/storage/" + result.value)));
    } catch (e) {
      emit(UserLoadingFailed(e.toString()));
    }
  }
}
