import 'package:get/get.dart';
import 'community_card_controller.dart';

class CommunityCardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityCardController());
  }

}