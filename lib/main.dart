import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_tracker_app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  Bloc.observer = TalkerBlocObserver(talker: talker);

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: dio),
  );

  FlutterError.onError = (details) {
    GetIt.I<Talker>().error(details.exceptionAsString());
  };

  runZonedGuarded(() => runApp(const CryptoTrackerApp()),
      (Object error, StackTrace stack) {
    GetIt.I<Talker>().error(error.toString());
  });
}
