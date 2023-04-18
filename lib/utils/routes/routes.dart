import 'package:admin_app/utils/routes/routes_name.dart';
import 'package:admin_app/view/screens/home_screen.dart';
import 'package:admin_app/view/screens/login_screen.dart';
import 'package:admin_app/view/screens/sign_up_scren.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>generateRoutes(RouteSettings settings){
    switch (settings.name){
      case RoutesName.SignUp:return MaterialPageRoute(builder: (BuildContext context) => SignupView());
      case RoutesName.login:return MaterialPageRoute(builder: (BuildContext  context) => LoginView());
      case RoutesName.home:return MaterialPageRoute(builder: (BuildContext  context) => HomeScreen());

      default:return MaterialPageRoute(
            builder: (BuildContext context) => Scaffold(
                  body: Center(
                    child: Text("No Route Defined for ${settings.name}"),
                  ),
                ));
    }

    
  }
  
}

