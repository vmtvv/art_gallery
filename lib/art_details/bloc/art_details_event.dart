part of 'art_details_bloc.dart';

abstract class ArtDetailsEvent extends Equatable {
  const ArtDetailsEvent();

  @override
  List<Object> get props => [];
}

class ArtDetailsNumberSelected extends ArtDetailsEvent {
  const ArtDetailsNumberSelected(this.number);

  final String number;

  @override
  List<Object> get props => [number];
}
