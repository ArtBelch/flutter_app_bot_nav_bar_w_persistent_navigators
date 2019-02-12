import 'package:flutter/material.dart';
import 'package:flutter_test_app/e_ui_models/routes_navigation_model.dart';
import 'package:scoped_model/scoped_model.dart';


class AppLanding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenNavigationModel =
    ScopedModel.of<RoutesNavigationModel>(context, rebuildOnChange: true);

    void _onItemTapped(int index) {
      screenNavigationModel.switchTab(currentIndex: index);
    }

    return MaterialApp(
          title: 'BucoBoo App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              body: screenNavigationModel.displayTabNavigator(),
              bottomNavigationBar: BottomNavigationBar(
                  fixedColor: Color.fromARGB(255, 255, 255, 1),
                  currentIndex: screenNavigationModel.currentIndex,
                  onTap: _onItemTapped,
                  items: <BottomNavigationBarItem> [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.language, color: Colors.black54,),
                      title: Text('Tab Four'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.local_dining, color: Colors.black54,),
                      title: Text('Tab Three'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_basket, color: Colors.black54,),
                      title: Text('Tab Two'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline, color: Colors.black54,),
                      title: Text('Tab One'),
                    ),
                  ]
              ),
          )
      );
  }
}
