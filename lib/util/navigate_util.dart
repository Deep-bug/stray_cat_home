import 'package:fluro/fluro.dart';
import 'package:stray_cat_home/routers/application.dart';
///跳转类型
class SCHNavigator {
  static push(context, path) {
    SCHApplication.router
        ?.navigateTo(context, path, transitionDuration: Duration(seconds: 1));
  }

  static pop(context) {
    SCHApplication.router?.pop(context);
  }

  static pushFromRight(context, path) {
    SCHApplication.router
        ?.navigateTo(context, path, transition: TransitionType.cupertino);
  }

  static pushFromRightDuration(context, path) {
    SCHApplication.router?.navigateTo(context, path,
        transition: TransitionType.inFromRight,
        transitionDuration: Duration(milliseconds: 300));
  }

  static pushFadeIn(context, path) {
    SCHApplication.router?.navigateTo(context, path,
        transition: TransitionType.cupertino,
        transitionDuration: Duration(milliseconds: 300));
  }

  static pushReplace(context, path, {clearStack: false}) {
    SCHApplication.router?.navigateTo(context, path,
        replace: true,
        clearStack: clearStack,
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 0));
  }

  static pushModal(context, path) {
    SCHApplication.router?.navigateTo(context, path,
        replace: true,
        transition: TransitionType.nativeModal,
        transitionDuration: Duration(seconds: 300));
  }

  static pushFadeInReplace(context, path) {
    SCHApplication.router?.navigateTo(context, path,
        replace: true,
        transition: TransitionType.fadeIn,
        transitionDuration: Duration(seconds: 0));
  }
}
