import 'dart:developer';
import 'dart:ffi';

import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/domain/usecase/home_usecase.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInputs , HomeViewModelOutputs{
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);
    final _homeViewObjectController = BehaviorSubject<HomeViewObject>();



  @override
  void start() {
    _getHomeData();
  }



  void _getHomeData() async{

        inputState.add(LoadingState(stateRendererType: StateRendererType.FULLSCREEN_LOADING ));

    var either = await _homeUseCase.execute(Void);
    either.fold((failure) {
      inputState.add(ErrorState(stateRendererType: StateRendererType.FULLSCREEN_ERROR, message: failure.message));
    }, (homeObject)  {
      inputState.add(ContentState());
      if(homeObject.data != null )
      _homeViewObjectController.add(HomeViewObject(homeObject.data!.services, homeObject.data!.banners, homeObject.data!.stores));

    }
    );
  }

  @override
  void dispose() {

    _homeViewObjectController.close();
    super.dispose();
  }



  @override
  Sink get homeViewObjectInput => _homeViewObjectController.sink;

  @override
  Stream<HomeViewObject> get homeViewObjectOutput => _homeViewObjectController.stream;


}

abstract class HomeViewModelInputs{

  Sink get homeViewObjectInput;

}

abstract class HomeViewModelOutputs{

  Stream<HomeViewObject> get homeViewObjectOutput;
}


class HomeViewObject{
  List<Service> services;

  List<BannerAd> banners;

  List<Store> stores;

  HomeViewObject(this.services, this.banners, this.stores);
}