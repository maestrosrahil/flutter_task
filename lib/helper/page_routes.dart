import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screen/add_product.dart';
import '../screen/home_screen.dart';
import '../screen/login_screen.dart';

class PageRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    case LoginScreen.id:
    return transitionAnimation(const LoginScreen());

      case HomeScreen.id:
        return transitionAnimation(const HomeScreen());

        case AddProductPage.id:
        return transitionAnimation( AddProductPage());
    default:
    return null;
    }
  }

  static PageTransition transitionAnimation(Widget widget) {
    return PageTransition(child: widget, type: PageTransitionType.rightToLeft);
  }

  static PageTransition bottomToTop(Widget widget) {
    return PageTransition(child: widget, type: PageTransitionType.bottomToTop);
  }
}