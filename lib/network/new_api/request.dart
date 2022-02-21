


import 'package:stray_cat_home/util/loading.dart';

import 'exception.dart';
import 'exception_handler.dart';

Future request(Function() block,  {bool showLoading = true, bool Function(ApiException)? onError, }) async{
  try {
    await loading(block, isShowLoading:  showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}