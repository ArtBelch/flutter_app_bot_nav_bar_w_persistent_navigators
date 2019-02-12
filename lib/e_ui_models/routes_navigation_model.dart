import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_test_app/a_tab_one_screens/tab_one_root.dart';
import 'package:flutter_test_app/b_tab_two_screens/tab_two_root.dart';
import 'package:flutter_test_app/c_tab_three_screens/tab_three_root.dart';
import 'package:flutter_test_app/d_tab_four_screens/tab_four_root.dart';

///Defines routes for entire app and controls BottomNavigationBar state
class RoutesNavigationModel extends Model {

  ///Defines the Navigator behind each tab and maps their named routes to screens
  List<Widget> _tabNavigators = [

    //TODO: Finish implementation of tab one Navigator
    Navigator(
      initialRoute: 'tab_one/root',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'tab_one/root':
            return _buildRoute(settings, TabOneRoot());
          default:
            throw Exception('No route found for _profileTab');
        }
      },
    ),

    //TODO: Finish implementation of tab two Navigator
    Navigator(
      initialRoute: 'tab_two/root',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'tab_two/root':
            return _buildRoute(settings, TabTwoRoot());
          default:
            throw Exception('No route found for tab_two');
        }
      },
    ),

    //TODO: Finish implementation of tab three Navigator
    Navigator(
      initialRoute: 'tab_three/root',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'tab_three/root':
            return _buildRoute(settings, TabThreeRoot());
          default:
            throw Exception('No route found for tab_two');
        }
      },
    ),

    //TODO: Finish implementation of tab four Navigator
    Navigator(
      initialRoute: 'tab_four/root',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'tab_four/root':
            return _buildRoute(settings, TabFourRoot());
          default:
            throw Exception('No route found for tab_two');
        }
      },
    ),
  ];

  ///A simple helper function to build the routes returned in ScreenNavigationModel._tabNavigators
  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget page) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }

  ///Controls BottomNavigationBar state and the landing tab (by initialization value)
  int _currentIndex = 3;

  ///Gets the active tab index
  int get currentIndex => _currentIndex;

  ///Switches the tab index and therefore the displayed Navigator and active tab
  void switchTab({int currentIndex}) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  ///Displays the Navigator corresponding to the tapped tab in BottomNavigationBar
  Stack displayTabNavigator() {
    return Stack(
      children: <Widget>[

        //Tab one
        Offstage(
          offstage: currentIndex != 0,
          child: _tabNavigators[0],
        ),

        //Tab two
        Offstage(
          offstage: currentIndex != 1,
          child: _tabNavigators[1],
        ),

        //Tab three
        Offstage(
          offstage: currentIndex != 2,
          child: _tabNavigators[2],
        ),

        //Tab four
        Offstage(
          offstage: currentIndex != 3,
          child: _tabNavigators[3],
        ),
      ],
    );
  }
}