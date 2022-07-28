import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/data/data_source/local_data_source.dart';
import 'package:clean_arch/prsentation/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel extends BaseViewModel with SettingsViewModelInputs , SettingsViewModelOutputs{
  final _appPrefs = getIT<AppPreferences>();
  final _localDataSource = getIT<LocalDataSource>();
  final _controller = BehaviorSubject<bool>();
  @override
  void start() {
  }

  @override
  void changeLanguage() {
    _appPrefs.changeAppLanguage();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  void logout() {
    _localDataSource.clearCache();
    _appPrefs.setIsLoggedIn(false);
    _controller.sink.add(true);
  }

  @override
  Stream<bool> get isLoggedOut => _controller.stream;



}
abstract class SettingsViewModelInputs{
  void changeLanguage();
  void logout();
}
abstract class SettingsViewModelOutputs{
  Stream<bool> get isLoggedOut;
}