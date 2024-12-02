import 'package:get_it/get_it.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_edit/alarm_edit_cubit.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_cubit.dart';
import 'package:health_app_flutter/feature/base/bloc/base_cubit.dart';
import 'package:health_app_flutter/feature/home/bloc/home_cubit.dart';
import 'package:health_app_flutter/feature/home/repository/home_repository.dart';
import 'package:health_app_flutter/feature/login/bloc/login_cubit.dart';
import 'package:health_app_flutter/feature/login/provider/login_provider.dart';
import 'package:health_app_flutter/feature/login/repository/login_repository.dart';
import 'package:health_app_flutter/feature/register/bloc/register_cubit.dart';
import 'package:health_app_flutter/feature/register/provider/register_provider.dart';
import 'package:health_app_flutter/feature/register/repository/register_repository.dart';
import 'package:health_app_flutter/feature/run_tracking/bloc/run_tracking_cubit.dart';
import 'package:health_app_flutter/util/app_state/bloc/app_cubit.dart';
import 'package:health_app_flutter/util/app_state/provider/app_provider.dart';
import 'package:health_app_flutter/util/app_state/repository/app_repository.dart';
import 'package:health_app_flutter/util/service/alarm_service.dart';
//registerSingleton : Registers a singleton that’s created when it’s first requested
//registerFactory : Registers a factory that creates a new instance of T each time it’s requested
//registerLazySingleton : Registers a singleton that creates an instance of T the first time it’s requested

final sl = GetIt.I;

Future<void> init() async {
  initLogin();
  initRegister();
  initHomeTab();
  initHomeTabs();
  initRunTracking();
  initAppSetting();
  initAlarm();
  // initExerciseList();
}

void initAppSetting() async {
  sl.registerFactory(() => AppCubit(appRepository: sl()));
  sl.registerFactory(() => AppRepository(appProvider: sl()));
  sl.registerFactory(() => AppProvider());
}

void initLogin() async {
  sl.registerFactory(() => LoginCubit(loginRepository: sl()));
  sl.registerFactory(() => LoginRepository(loginProvider: sl()));
  sl.registerFactory(() => LoginProvider(apiRequest: APIRequest()));
}

void initHomeTab() async {
  sl.registerFactory(() => HomeCubit(homeRepository: sl()));
  sl.registerFactory(() => HomeRepository(homeProvider: sl()));
  sl.registerFactory(() => HomeProvider(apiRequest: APIRequest()));
}

void initRegister() async {
  sl.registerFactory(() => RegisterCubit(registerRepository: sl()));
  sl.registerFactory(() => RegisterRepository(registerProvider: sl()));
  sl.registerFactory(() => RegisterProvider(apiRequest: APIRequest()));
}

void initHomeTabs() async {
  sl.registerFactory(() => BaseCubit());
}

void initRunTracking() async {
  // sl.registerFactory(() => LocationRepository());
  // sl.registerFactory(() => StepCountRepository());
  // sl.registerFactory(() => TimerRepository());
  sl.registerFactory(() => RunTrackCubit());
}

// void initDataBase() async {
//   sl.registerSingletonAsync<UserDatabase>(() async => UserDatabase());
// }

void initAlarm() async {
  sl.registerSingleton<AlarmService>(AlarmService());
  sl.registerFactory(() => AlarmCubit(sl()));
  sl.registerFactory(() => AlarmEditCubit(sl()));
}

// void initExerciseList() async {
//   sl.registerFactory(() => ExerciseListCubit());
// }
