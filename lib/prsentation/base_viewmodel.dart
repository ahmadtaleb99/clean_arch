import 'dart:async';

import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
  final _stateController = BehaviorSubject<FlowState>();


  @override
  Sink get inputState => _stateController.sink;

  @override
  Stream<FlowState> get outputState => _stateController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _stateController.close();
  }
}

abstract class BaseViewModelInputs{
  void start();
  void dispose();
    Sink get inputState;
}
abstract class BaseViewModelOutputs{
  Stream<FlowState> get outputState;

}