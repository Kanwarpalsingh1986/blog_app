// import 'package:flutter/material.dart';
// import 'package:music_streaming_mobile/helper/common_import.dart';
// import 'package:get/get.dart';
// import 'package:music_streaming_mobile/screens/user/instagram_constant.dart';
// import 'package:music_streaming_mobile/screens/user/instagram_model.dart';
//
// class InstagramView extends StatelessWidget {
//   const InstagramView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       final webview = FlutterWebviewPlugin();
//       final InstagramModel instagram = InstagramModel();
//
//       buildRedirectToHome(webview, instagram, context);
//
//       return WebviewScaffold(
//         url: InstagramConstant.instance.url,
//         resizeToAvoidBottomInset: true,
//         appBar: buildAppBar(context),
//       );
//     });
//   }
//
//   AppBar buildAppBar(BuildContext context) => AppBar(
//     backgroundColor: Colors.white,
//     elevation: 0,
//     iconTheme: const IconThemeData(color: Colors.black),
//     title: Text(
//       'Instagram Login',
//       style: Theme.of(context)
//           .textTheme
//           .headline6!
//           .copyWith(color: Colors.black),
//     ),
//   );
//
//   Future<void> buildRedirectToHome(FlutterWebviewPlugin webview,
//       InstagramModel instagram, BuildContext context) async {
//     webview.onUrlChanged.listen((String url) async {
//       if (url.contains(InstagramConstant.redirectUri)) {
//         instagram.getAuthorizationCode(url);
//         await instagram.getTokenAndUserID().then((isDone) {
//           if (isDone) {
//             instagram.getUserProfile().then((isDone) async {
//               await webview.close();
//
//             socialLogin('instagram', instagram.userID!, instagram.username!, instagram.userID!, context);
//             });
//           }
//         });
//       }
//     });
//   }
//
//   void socialLogin(String type, String userId, String name,String email,BuildContext context) {
//     AppUtil.checkInternet().then((value) {
//       if (value) {
//         EasyLoading.show(status: LocalizationString.loading);
//
//       } else {
//         AppUtil.showToast(
//             message: LocalizationString.noInternet,isSuccess: false);
//       }
//     });
//   }
// }