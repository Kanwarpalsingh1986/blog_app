import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await MobileAds.instance.initialize();

  await setupServiceLocator();

  await Firebase.initializeApp();
  await getIt<UserProfileManager>().refreshProfile();
  bool isDarkTheme = await SharedPrefs().isDarkMode();

  Get.changeThemeMode(isDarkTheme ? ThemeMode.dark : ThemeMode.light);

  Get.put(DashboardController());
  Get.put(CategoryController());
  Get.put(LoginController());
  Get.put(MainScreenController());
  Get.put(AppSearchController());
  Get.put(UserController());
  Get.put(RecommendationController());
  Get.put(CommentsController());
  Get.put(PostCardController());
  Get.put(TrendingHashtagController());
  Get.put(NewsDetailController());
  Get.put(SeeAllPostsController());
  Get.put(HashtagController());
  Get.put(AuthorController());
  // Get.put(LocationController());
  Get.put(FollowingController());
  Get.put(MyAccountController());
  Get.put(SubscriptionPackageController());
  Get.put(SavedPostsController());

  bool onBoardingShown = await SharedPrefs().isOnBoardingShown();

  runApp(
    EasyLocalization(
        useOnlyLangCode: true,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'AE'),
          Locale('ar', 'DZ'),
          Locale('de', 'DE'),
          Locale('fr', 'FR'),
          Locale('ru', 'RU')
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: MainApp(
          onBoardingShown: onBoardingShown,
        )),
  );
}

class MainApp extends StatefulWidget {
  final bool onBoardingShown;

  const MainApp({Key? key, required this.onBoardingShown}) : super(key: key);

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: EasyLoading.init(),
      home: widget.onBoardingShown == true
          ? const MainScreen()
          : const OnBoardingScreen(),
    );
  }
}
