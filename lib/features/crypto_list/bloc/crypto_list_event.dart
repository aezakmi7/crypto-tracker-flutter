part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent {}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({this.completer});

  final Completer? completer;

  @override
  // ignore: override_on_non_overriding_member
  List<Object?> get props => [completer];
}
