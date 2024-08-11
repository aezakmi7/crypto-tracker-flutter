import '../../features/crypto_details/crypto_details.dart';
import '../../features/crypto_list/crypto_list.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoDetailsScreen(),
};
