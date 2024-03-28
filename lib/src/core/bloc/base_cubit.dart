import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends BaseCubitDelegate<S> {
  BaseCubit(S baseInitial) : super(baseInitial);
}

abstract class BaseCubitDelegate<S extends BaseState> extends Cubit<S> {
  BaseCubitDelegate(S initialState) : super(initialState);
}
