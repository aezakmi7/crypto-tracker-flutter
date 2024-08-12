part of 'crypto_details_bloc.dart';

sealed class CryptoDetailsState extends Equatable {
  const CryptoDetailsState();
  
  @override
  List<Object> get props => [];
}

final class CryptoDetailsInitial extends CryptoDetailsState {}
