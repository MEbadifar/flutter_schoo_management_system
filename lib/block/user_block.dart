import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_model/user.dart';
import '../repository/userRepo.dart';
import 'block_state.dart';

class UserBlock extends Cubit<BlockState> {
  UserBlock() : super(Initial());
  User? _user;

  void authenticate(String mobile, String pass) async {
    if (state is Loading) return;
    try {
      emit(Loading());
      _user = await UserRepo.authenticate(mobile, pass);
      emit(Authenticated(_user!));
    } catch (e) {
      emit(Failed(e as Exception));
    }
  }

  void signOut() => emit(Initial());

  User? get user => _user;
}
