import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'crypto_details_event.dart';
part 'crypto_details_state.dart';

class CryptoDetailsBloc extends Bloc<CryptoDetailsEvent, CryptoDetailsState> {
  CryptoDetailsBloc() : super(CryptoDetailsInitial()) {
    on<CryptoDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
