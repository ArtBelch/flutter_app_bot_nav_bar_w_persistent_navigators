import 'package:flutter/material.dart';
import 'package:flutter_test_app/e_ui_models/routes_navigation_model.dart';
import 'package:flutter_test_app/app_landing.dart';
import 'package:scoped_model/scoped_model.dart';

///Runs a Flutter app with 4 tabs and one persisted Navigator for each tab
void main() => runApp(
        App()
);

///Wraps entire app with all the Scoped Models used
class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<RoutesNavigationModel> (
        model: RoutesNavigationModel(),
        child: AppLanding()
    );
  }
}
