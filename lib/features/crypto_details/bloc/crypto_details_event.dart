part of 'crypto_details_bloc.dart';

sealed class CryptoDetailsEvent extends Equatable {
  const CryptoDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadCryptoDetails extends CryptoDetailsEvent {
  const LoadCryptoDetails(this.currencyCode);

  final String currencyCode;

  @override
  List<Object> get props => super.props..add(currencyCode);
}
