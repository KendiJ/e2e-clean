import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S, T> extends Cubit<S> {
  BaseCubit(S intitialState, this._data) : super(intitialState);

  T _data;

  @protected
  T get data => _data;

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  @protected
  Future<void> run(Future<void> Function() process) async {
    if (!_isBusy) {
      _isBusy = true;
      await process();
      _isBusy = false;
    }
  }
}
