import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../../../repositories/crypto_coins/models/crypto_details.dart';

part 'crypto_details_event.dart';
part 'crypto_details_state.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  CryptoDetailsBloc(this.coinsRepository) : super(const CryptoDetailsState()) {
    on<LoadCryptoDetails>(_load);
  }

  final AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    LoadCryptoDetails event,
    Emitter<CryptoDetailsState> emit,
  ) async {
    try {
      if (state is! CryptoDetailsLoaded) {
        emit(const CryptoDetailsLoading());
      }

      final coinDetails =
          await coinsRepository.getCoinDetails(event.currencyCode);

      emit(CryptoDetailsLoaded(coinDetails: coinDetails));
    } catch (e) {
      emit(CryptoDetailsError(error: e));
    }
  }
}
