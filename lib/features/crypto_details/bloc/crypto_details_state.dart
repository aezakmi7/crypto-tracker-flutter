part of 'crypto_details_bloc.dart';

class CryptoDetailsState extends Equatable {
  const CryptoDetailsState();

  @override
  List<Object?> get props => [];
}

class CryptoDetailsLoading extends CryptoDetailsState {
  const CryptoDetailsLoading();
}

class CryptoDetailsLoaded extends CryptoDetailsState {
  const CryptoDetailsLoaded({
    required this.coinDetails,
  });

  final CryptoCoinDetail coinDetails;

  @override
  List<Object?> get props => [coinDetails];
}

class CryptoDetailsError extends CryptoDetailsState {
  const CryptoDetailsError({
    required this.error,
  });

  final Object error;

  @override
  List<Object?> get props => super.props..add(error);
}
