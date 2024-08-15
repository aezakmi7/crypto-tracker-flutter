import 'dart:async';

import 'package:crypto_tracker_flutter/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_tracker_app.dart';
import 'repositories/crypto_coins/crypto_coins.dart';
import 'repositories/crypto_coins/models/crypto_detail.dart';

Future<void> main() async {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');

  Bloc.observer = TalkerBlocObserver(talker: talker);

  await Hive.initFlutter();
  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoDetailAdapter());

  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>('crypto_coins_box');

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
    () => CryptoCoinsRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox),
  );

  FlutterError.onError = (details) {
    GetIt.I<Talker>().error(details.exceptionAsString());
  };

  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  talker.info(app.options.projectId);

  runZonedGuarded(() => runApp(const CryptoTrackerApp()), (error, stack) {
    WidgetsFlutterBinding.ensureInitialized();
    GetIt.I<Talker>().error(error.toString());
  });
}
