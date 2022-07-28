import 'dart:developer';

import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/app/dependency_injection.dart';
import 'package:clean_arch/prsentation/main/pages/settings/viewmodel/settings_viewmodel.dart';
import 'package:clean_arch/prsentation/resources/assets_manager.dart';
import 'package:clean_arch/prsentation/resources/language_manager.dart';
import 'package:clean_arch/prsentation/resources/routes_manager.dart';
import 'package:clean_arch/prsentation/resources/strings_manager.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}





class _SettingsPageState extends State<SettingsPage> {

final _appPrefs = getIT<AppPreferences>();
  void _bind(){
    _viewmodel.start();

    _viewmodel.isLoggedOut.listen((hasLoggedOut) {

      if(hasLoggedOut){
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);

        });
      }
    });
  }



  @override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  void dispose() {
    _viewmodel.dispose();
    super.dispose();
  }
  final _viewmodel = SettingsViewModel();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _viewmodel.isLoggedOut,
      initialData: false,
      builder: (context, snapshot) {

        return ListView(
          children: [
            ListTile(
              onTap: (){
                _viewmodel.changeLanguage();
                log(_appPrefs.getLocale().languageCode+ ' code');
                context.setLocale(_appPrefs.getLocale());
                setState(() {

                });

              },
              leading: SvgPicture.asset(ImageAssets.changeLangIcon),
              title: Text(
                AppStrings.changeLanguage.tr(),
                style: Theme.of(context).textTheme.headline2,
              ),
              trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIcon),
            ),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.contactUsIcon),
              title: Text(
                AppStrings.contactUs.tr(),
                style: Theme.of(context).textTheme.headline2,
              ),
              trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIcon),
            ),
            ListTile(
              leading: SvgPicture.asset(ImageAssets.inviteFriendsIcon),
              title: Text(
                AppStrings.inviteYourFriends.tr(),
                style: Theme.of(context).textTheme.headline2,
              ),
              trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIcon),
            ),
            ListTile(
              onTap: (){
                _viewmodel.logout();
              },
              leading: SvgPicture.asset(ImageAssets.logoutIcon),
              title: Text(
                AppStrings.logout.tr(),
                style: Theme.of(context).textTheme.headline2,
              ),
              trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIcon),
            ),
          ],
        );
      }
    );
  }
}
