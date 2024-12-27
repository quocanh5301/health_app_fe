import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/login/bloc/login_state.dart';
import 'package:health_app_flutter/feature/login/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(const LoginState());

  // email: 'quocphan5301@gmail.com', password: '123456'));
  final LoginRepository loginRepository;

  Future<void> login() async {
    emit(
      state.copyWith(
        loginStatus: LoginStatus.loading,
        errorMessage: '',
      ),
    );
    final result = await loginRepository
        .login(email: state.email, password: state.password)
        .run();
    result.match(
      (error) => emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
          errorMessage: error,
        ),
      ),
      (success) => emit(
        state.copyWith(loginStatus: LoginStatus.success),
      ),
    );
  }

  // void setRememberAccount(bool isRememberAccount) =>
  //     emit(state.copyWith(isRememberAccount: isRememberAccount));

  // void setShowPassword() =>
  //     emit(state.copyWith(isShowPassword: !state.isShowPassword));

  void setEmail(String email) => emit(state.copyWith(email: email));

  void setPassword(String password) => emit(state.copyWith(password: password));
}
