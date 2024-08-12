part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListState {}

final class CryptoListInitial extends CryptoListState {}

final class CryptoListLoading extends CryptoListState {}

final class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded(this.cryptoCoinsList);

  final List<CryptoCoin> cryptoCoinsList;
}

final class CryptoListError extends CryptoListState {
  CryptoListError(this.errorMessage);

  final Object errorMessage;
}
