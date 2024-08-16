import 'package:flutter/material.dart';

import '../../features/crypto_details/crypto_details.dart';
import '../../features/crypto_list/crypto_list.dart';
import 'package:auto_route/auto_route.dart';

import '../../repositories/crypto_coins/models/models.dart';

part 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CryptoListRoute.page, initial: true),
        AutoRoute(page: CryptoDetailsRoute.page),
      ];
}
