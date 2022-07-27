import 'package:analyzer/error/error.dart';
import 'package:clean_arch/data/network/error_handler.dart';
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/data/network/failure.dart';

abstract class LocalDataSource  {
  Future<HomeResponse> getHomeData();
 void saveHomeToCache(HomeResponse homeResponse);
}


const String keyHomeCache = 'keyHomeCache';
const int keyHomeCacheTime = 60;

class LocalDataSourceImpl implements LocalDataSource {
  Map <String,CachedItem> cacheMap  = {};
  @override
  Future<HomeResponse> getHomeData() {
    CachedItem? cachedItem = cacheMap[keyHomeCache] ;
    if(cachedItem != null && cachedItem.isValidCache ) {
      return cachedItem.data;
    }
    else {
      throw ErrorHandler.handle('');
    }

  }

  @override
  void  saveHomeToCache(HomeResponse homeResponse) {
     cacheMap[keyHomeCache] = CachedItem(homeResponse,cacheTime: keyHomeCacheTime);
  }

}

class CachedItem {
  dynamic data;

  final  int _timeWhenCached = DateTime.now().millisecondsSinceEpoch;
  final int cacheTime;
  bool get isValidCache {
    var timeNow = DateTime.now().millisecondsSinceEpoch;
    if(timeNow + cacheTime < _timeWhenCached){
      return true;
    }
    return false;
  }

  CachedItem(this.data, {required this.cacheTime});
}

// 1000
//