import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc101/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity? connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit(this.connectivity) : super(InternetLoading());

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity!.onConnectivityChanged.listen((connectivityResult) {
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
          emitInternetConnected(ConnectionType.Wifi);
          break;
        case ConnectivityResult.mobile:
          emitInternetConnected(ConnectionType.Mobile);
          break;
        case ConnectivityResult.none:
          emitInternetDisconnected();
          break;
        default:
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
