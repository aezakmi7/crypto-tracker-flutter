part of 'crypto_list_bloc.dart';

@immutable
abstract class CryptoListState extends Equatable {}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object> get props => [];
}

final class CryptoListLoading extends CryptoListState {
  @override
  List<Object> get props => [];
}

final class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded(this.cryptoCoinsList);

  final List<CryptoCoin> cryptoCoinsList;

  @override
  List<Object> get props => [cryptoCoinsList];
}

final class CryptoListError extends CryptoListState {
  CryptoListError(this.errorMessage);

  final Object errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
