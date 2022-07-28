import 'package:clean_arch/domain/usecase/store_details_usecase.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInputs, StoreDetailsViewModelOutputs {
  final _controller = BehaviorSubject<StoreDetailsViewObject>();
  final StoreDetailsUseCase _useCase;

  StoreDetailsViewModel(this._useCase);

  @override
  void start() {
    _getStoreDetails();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Sink get inputStoreDetailsViewObject => _controller.sink;

  @override
  Stream<StoreDetailsViewObject> get outputStoreDetailsViewObject =>
      _controller.stream;
  Future<void> _getStoreDetails() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.FULLSCREEN_LOADING));

    var either = await _useCase.execute(1);
    either.fold((failure) {
      inputState.add(ErrorState(
          stateRendererType: StateRendererType.FULLSCREEN_ERROR,
          message: failure.message));
    }, (storeDetails) {
      inputState.add(ContentState());

      _controller.add(StoreDetailsViewObject(
          storeDetails.image,
          storeDetails.id,
          storeDetails.title,
          storeDetails.details,
          storeDetails.service,
          storeDetails.about));
    });
  }
}

class StoreDetailsViewObject {
  String image;

  int id;

  String title;

  String details;

  String service;

  StoreDetailsViewObject(
      this.image, this.id, this.title, this.details, this.service, this.about);

  String about;
}

abstract class StoreDetailsViewModelInputs {
  Sink get inputStoreDetailsViewObject;
}

abstract class StoreDetailsViewModelOutputs {
  Stream<StoreDetailsViewObject> get outputStoreDetailsViewObject;
}
