import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/domain/model/models.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer.dart';
import 'package:clean_arch/prsentation/common/state_renderer/state_renderer_impl.dart';
import 'package:clean_arch/prsentation/main/pages/home/viewmodel/home_viewmodel.dart';
import 'package:clean_arch/prsentation/resources/color_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:clean_arch/prsentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeViewModel = getIT<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _homeViewModel.outputState,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            print('view snapshot');
            return snapshot.data!.getWidget(context, _build(), () {
              _homeViewModel.start();
            });
          } else
            return Container();
        });
  }

  Widget _build() {
    return SingleChildScrollView(
      child: StreamBuilder<HomeViewObject>(
        stream: _homeViewModel.homeViewObjectOutput,
        builder: (context, snapshot) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11.h,
              ),
          CarouselSlider(
          items: snapshot.data?.stores
              .map((e) => Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          ),
          child: ClipRRect(   borderRadius: BorderRadius.circular(AppSize.s12),
          child: Image.network(e.image,fit: BoxFit.cover,width: 300.w,)),
          ))
              .toList(),
          options: CarouselOptions(height: 140.h,
          viewportFraction: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                child: Text(
                  AppStrings.services,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
          Container(
          height: 142.h,
          child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data?.services.length,
          itemBuilder: (context,index){
          return Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Card(
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: BorderSide(
          color: ColorManager.primary, width: 1)),
          margin: EdgeInsets.zero,
          child: Column(
          children:  [
          ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Image.network(
          snapshot.data!.services[index].image,

          fit: BoxFit.cover,
          width: AppSize.s100,
          height: AppSize.s100,
          ),
          ),
          Padding(
          padding:
          const EdgeInsets.only(top: AppPadding.p8),
          child: Align(
          alignment: Alignment.center,
          child: Text(
          snapshot.data!.services[index].title,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
          ),
          ))
          ],
          ),
          ),
          );



          }),
          ),

            ],
          );
        }
      ),
    );
  }
}
