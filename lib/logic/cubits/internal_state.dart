part of 'internal_cubit.dart';

abstract class InternalState extends Equatable {
  const InternalState();

  @override
  List<Object> get props => [];
}

class InternalLoading extends InternalState {}

class InternalConnected extends InternalState {
  final ConnectionType connectionType;

  InternalConnected(this.connectionType);
}

class InternalDisconnected extends InternalState {}
