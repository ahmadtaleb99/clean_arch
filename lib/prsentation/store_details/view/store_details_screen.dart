import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:clean_arch/prsentation/store_details/viewmodel/store_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({Key? key,

    // required this.storeDetails

  }) : super(key: key);
  // final StoreDetails storeDetails;


  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {


  final _viewmodel = getIT<StoreDetailsViewModel>();


  @override
  void initState() {
    _viewmodel.start();
    super.initState();
  }
  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewmodel.outputState,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return snapshot.data!.getWidget(context, _getScreen(), () {
              _viewmodel.start();
            });
          } else
            return _getScreen();
        }
      ),
    );
  }
  Widget _getScreen(){
 return   SingleChildScrollView(
      child: StreamBuilder<StoreDetailsViewObject>(
          stream: _viewmodel.outputStoreDetailsViewObject,
          builder: (context, snapshot) {
            return snapshot.data == null ? CircularProgressIndicator() :
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.network(snapshot.data!.image),
                  ),
                  SizedBox(height: 30.h,),
                  Text(AppStrings.details,style: Theme.of(context).textTheme.subtitle2,),
                  SizedBox(height: 18.h,),
                  Text(snapshot.data!.details,style: Theme.of(context).textTheme.subtitle1,),
                  SizedBox(height: 13.h,),
                  Text(AppStrings.services,style: Theme.of(context).textTheme.subtitle2,),
                  SizedBox(height: 13.h,),
                  Text(snapshot.data!.service,style: Theme.of(context).textTheme.subtitle1,),

                  SizedBox(height: 13.h,),
                  Text(AppStrings.about,style: Theme.of(context).textTheme.subtitle2,),
                  SizedBox(height: 13.h,),
                  Text(snapshot.data!.about,style: Theme.of(context).textTheme.subtitle1,),

                ],
              ),
            );
          }
      ),
    );
  }
}
