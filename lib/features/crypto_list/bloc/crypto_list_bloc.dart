import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_tracker_flutter/repositories/crypto_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }

        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(cryptoCoinsList));
      } catch (e) {
        emit(CryptoListError(e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
