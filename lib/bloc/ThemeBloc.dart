import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc_state.dart';
import '../module/Theme.dart';

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.Light)) {
    LoadTheme();
  }

  void LoadTheme() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String _str = _pref.getString('theme') ?? '';
    if (_str == 'dark') {
      emit(ThemeState(AppTheme.Dark));
    }
  }

  void setTheme(AppTheme theme) async {
    emit(ThemeState(theme));
    await SharedPreferences.getInstance().then((value) =>
        value.setString('theme', theme == AppTheme.Dark ? 'dark' : 'light'));
  }
}
