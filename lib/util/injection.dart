import 'package:get_it/get_it.dart';
import 'package:health_app_flutter/data/local_database/databases/user.dart';
import 'package:health_app_flutter/feature/base/bloc/base_bloc.dart';
import 'package:health_app_flutter/feature/run_tracking/bloc/run_tracking_cubit.dart';
import 'package:health_app_flutter/util/app_state/bloc/app_cubit.dart';
import 'package:health_app_flutter/util/app_state/provider/app_provider.dart';
import 'package:health_app_flutter/util/app_state/repository/app_repository.dart';
//registerSingleton : Registers a singleton that’s created when it’s first requested
//registerFactory : Registers a factory that creates a new instance of T each time it’s requested
//registerLazySingleton : Registers a singleton that creates an instance of T the first time it’s requested

final sl = GetIt.I;

Future<void> init() async {
  initHomeTabs();
  initRunTracking();
  initAppSetting();
  initDataBase();
}

void initAppSetting() async {
  sl.registerFactory(() => AppCubit(appRepository: sl()));
  sl.registerFactory(() => AppRepository(appProvider: sl()));
  sl.registerFactory(() => AppProvider());
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

void initDataBase() async {
  sl.registerSingletonAsync<UserDatabase>(() async => UserDatabase());
}
