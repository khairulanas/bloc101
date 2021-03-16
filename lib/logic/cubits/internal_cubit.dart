import 'package:bloc/bloc.dart';
import 'package:bloc101/constants/enums.dart';
import 'package:equatable/equatable.dart';

part 'internal_state.dart';

class InternalCubit extends Cubit<InternalState> {
  InternalCubit() : super(InternalLoading());
}
