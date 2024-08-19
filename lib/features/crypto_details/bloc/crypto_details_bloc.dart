import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../repositories/crypto_coins/crypto_coins.dart';

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

      emit(CryptoDetailsLoaded(coin: coinDetails));
    } catch (e) {
      emit(CryptoDetailsError(error: e));
      GetIt.I<Talker>().error(e.toString());
    }
  }
}
