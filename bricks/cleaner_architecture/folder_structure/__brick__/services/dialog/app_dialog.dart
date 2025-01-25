// import 'package:ease_dashboard/common/widgets/button.dart';
// import 'package:ease_dashboard/service/logger/init_logger.dart';
// import 'package:ease_dashboard/utils/app_color.dart';
// import 'package:ease_dashboard/utils/ui_helper.dart';
// import 'package:flutter/material.dart';

// /// Service class to handle showing dialog boxes in the app
// class AppDialogService with EaseLogger {
//   /// Shows an info dialog with the given title and message
//   ///
//   /// [context] - BuildContext required to show the dialog
//   /// [title] - Title text to show in dialog header
//   /// [message] - Message text to show in dialog body
//   /// [buttonText] - Optional text for the OK button, defaults to "OK"
//   Future<void> showInfoDialog({
//     required BuildContext context,
//     required String title,
//     required String message,
//     String buttonText = 'OK',
//   }) async {
//     try {
//       await showDialog(
//         context: context,
//         useRootNavigator: false,
//         barrierDismissible: false,
//         builder: (context) {
//           return AlertDialog(
//             alignment: Alignment.center,
//             titlePadding: const EdgeInsets.only(top: 20),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             title: Text(
//               title,
//               style: const TextStyle(
//                 color: AppColor.primaryColor,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   message,
//                   style: const TextStyle(
//                     color: AppColor.primaryColor,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 verticalSpaceRegular,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     AppButton(
//                       title: buttonText,
//                       btnColor: AppColor.primaryColor,
//                       onPressed: () => Navigator.of(context).pop(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     } catch (e, st) {
//       log.warning('Error showing info dialog', e, st);
//     }
//   }

//   Future<bool> showConfirmationDialog({
//     required BuildContext context,
//     required String title,
//     required String message,
//     String? cancelText,
//     String? confirmText,
//     bool? barrierDismissible,
//   }) async {
//     final result = await showDialog<bool>(
//       context: context,
//       useRootNavigator: false,
//       barrierDismissible: barrierDismissible ?? false,
//       builder: (context) {
//         return AlertDialog(
//           alignment: Alignment.center,
//           titlePadding: const EdgeInsets.only(
//             top: 20,
//             left: 20,
//             right: 20,
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 10,
//           ),
//           title: Text(
//             title,
//             style: const TextStyle(
//               color: AppColor.primaryColor,
//               fontSize: 20,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 message,
//                 style: const TextStyle(
//                   color: AppColor.primaryColor,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               verticalSpaceRegular,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   AppButton(
//                     title: cancelText ?? 'Cancel',
//                     btnColor: AppColor.greyColor,
//                     onPressed: () => Navigator.of(context).pop(false),
//                   ),
//                   AppButton(
//                     title: confirmText ?? 'Confirm',
//                     btnColor: AppColor.primaryColor,
//                     onPressed: () => Navigator.of(context).pop(true),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//     return result ?? false;
//   }
// }
