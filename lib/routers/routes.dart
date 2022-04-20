import 'package:get/get.dart';
import 'package:stray_cat_home/pages/cat_family_page/catInfo.dart';
import 'package:stray_cat_home/pages/cat_family_page/cat_detail_info/cat_detail_info_binding.dart';
import 'package:stray_cat_home/pages/cat_family_page/cat_detail_info/cat_detail_page.dart';
import 'package:stray_cat_home/pages/community_page/community_card/community_card.dart';
import 'package:stray_cat_home/pages/community_page/community_card/community_card_binding.dart';
import 'package:stray_cat_home/pages/community_page/push_page/push_binding.dart';
import 'package:stray_cat_home/pages/community_page/push_page/push_page.dart';
import 'package:stray_cat_home/pages/home_page_v2/home_page_v2_binding.dart';
import 'package:stray_cat_home/pages/home_page_v2/home_page_v2_controller.dart';
import 'package:stray_cat_home/pages/login_page/login_binding.dart';
import 'package:stray_cat_home/pages/login_page/login_page.dart';
import 'package:stray_cat_home/pages/register_page/register_binding.dart';
import 'package:stray_cat_home/pages/register_page/register_page.dart';
import 'package:stray_cat_home/pages/setting_page/setting_binding.dart';
import 'package:stray_cat_home/pages/setting_page/setting_page.dart';
import 'package:stray_cat_home/pages/setting_page/widget/setting_language_page.dart';
import 'package:stray_cat_home/pages/splash_page/splash_binding.dart';
import 'package:stray_cat_home/pages/splash_page/splash_page.dart';
import 'package:stray_cat_home/pages/user_model/user_info_page/userinfo_binding.dart';
import 'package:stray_cat_home/pages/user_model/user_info_page/userinfo_page.dart';

// import '../homeIndexPage.dart';
import '../home_binding.dart';

/// @class : Routes
/// @name : jhf
/// @description :页面管理
abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///登录模块
  static const String loginPage = '/login';

  ///注册
  static const String registerPage = '/register';

  ///主页
  static const String homePage = '/home';

  ///第二主页
  static const String homePageV2= '/homePageV2';

  ///猫咪图鉴
  static const String familyPage='/family';

  ///用户信息模块
  static const String userInfoPage='/userInfo';

  ///设置
  static const String settingPage='/setting';

  ///语言
  static const String settingLanguagePage = '/language';

  ///猫咪详情页
  static const String getCatInfoDetail='/catInfoDetail';

  ///社区详情页
  static const String getCommunityCardDetail='/communityCardDetail';

  ///发布动态页
  static const String pushInfoPage='/pushInfoPage';
  ///页面合集
  static final routePage = [
    GetPage(
        name: splashPage,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: registerPage,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    // GetPage(
    //     name: homePage,
    //     page: () => const HomeIndexPage(),
    //     binding: HomeBinding()),
    GetPage(
        name: homePageV2,
        page: () => const HomePageV2(),
        binding: HomePageV2Binding()),
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    // GetPage(
    //     name: familyPage,
    //     page: () => const catInfo()),
    //   //  binding: UserInfoBinding()),
    GetPage(
        name: userInfoPage,
        page: ()=> const UserInfoPage(),
        binding: UserInfoBinding(),
        ),
    GetPage(
        name: settingPage,
        page: ()=> const SettingPage(),
        binding: SettingBinding()),
    GetPage(
      name: settingLanguagePage,
      page: () => const SettingLanguagePage(),
    ),
    GetPage(
      name: getCatInfoDetail,
      page: () =>  const CatInfoDetail(),
      binding: CatInfoDetailBinding()
    ),
    GetPage(name: getCommunityCardDetail,
        page:() => const CommunityMesageDetailCard() ,
        binding: CommunityCardBinding()
    ),
    GetPage(
        name: pushInfoPage,
        page: () =>  const PushPage(),
        binding: PushBinding()
    ),
  ];
}
