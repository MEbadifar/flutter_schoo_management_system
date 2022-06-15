import 'package:flutter/material.dart';

import '../data_model/user.dart';

@immutable
abstract class BlockState {}

class Initial extends BlockState {}

class Loading extends BlockState {}

class Failed extends BlockState {
  final Exception exception;
  Failed(this.exception);
}

class Authenticated extends BlockState {
  final User user;
  Authenticated(this.user);
}
