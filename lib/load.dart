import 'dart:async';

import 'package:flutter/material.dart';
import 'package:irmdesks/Constant/color.dart';
import 'package:irmdesks/Home.dart';

class Load extends StatefulWidget {
  Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Blue,
            // valueColor: AlwaysStoppedAnimation(Colors.blue),
            strokeWidth: 3,
          ),
        ),
      ),
    );
  }
}








// import 'dart:async';
// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late InAppWebViewController webView;

//   @override
//   void initState() {
//     super.initState();
//     prepareSaveDir();
//     FlutterDownloader.registerCallback(downloadCallback);
//   }

//   late String localPath;

//   Future<void> prepareSaveDir() async {
//     localPath = (await findLocalPath())!;
//     final savedDir = Directory(localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//   }

//   Future<String?> findLocalPath() async {
//     var externalStorageDirPath;
//     if (Platform.isAndroid) {
//       try {
//         final directory = await getExternalStorageDirectory();
//         externalStorageDirPath = directory?.path;
//       } catch (e) {
//         print("Error getting external storage directory: $e");
//       }
//     } else if (Platform.isIOS) {
//       externalStorageDirPath =
//           (await getApplicationDocumentsDirectory()).absolute.path;
//     }
//     return externalStorageDirPath;
//   }

//   static void downloadCallback(String id, int status, int progress) {
//     final SendPort send =
//         IsolateNameServer.lookupPortByName('downloader_send_port')!;
//     send.send([id, status, progress]);
//   }

//   Future<bool> _checkPermission(platform) async {
//     if (Platform.isIOS) return true;
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     if (platform == TargetPlatform.android &&
//         androidInfo.version.sdkInt! <= 28) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: InAppWebView(
//                   initialUrlRequest: URLRequest(
//                     url: WebUri("https://irmdesk.com/"),
//                   ),
//                   initialOptions: InAppWebViewGroupOptions(
//                     crossPlatform: InAppWebViewOptions(
//                       useOnDownloadStart: true,
//                     ),
//                   ),
//                   onWebViewCreated: (InAppWebViewController controller) {
//                     webView = controller;
//                   },
//                   onLoadStart: (InAppWebViewController controller, Uri? url) {},
//                   onLoadStop: (InAppWebViewController controller, Uri? url) {},
//                   onDownloadStartRequest:
//                       (controller, DownloadStartRequest request) async {
//                     final platform = Theme.of(context).platform;
//                     bool value = await _checkPermission(platform);
//                     if (value) {
//                       await prepareSaveDir();
//                       final taskId = await FlutterDownloader.enqueue(
//                         url: request.url.toString(),
//                         savedDir: localPath,
//                         showNotification: true,
//                         saveInPublicStorage: true,
//                         openFileFromNotification: true,
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }








// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late InAppWebViewController webView;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   late String localPath;

//   Future<void> prepareSaveDir() async {
//     localPath = (await findLocalPath())!;
//     final savedDir = Directory(localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//     return;
//   }

//   Future<String?> findLocalPath() async {
//     var externalStorageDirPath;
//     if (Platform.isAndroid) {
//       try {
//         // AndroidPathProvider.documentsPath is not a valid method
//         // Instead, use getExternalStorageDirectory to get the external storage directory
//         final directory = await getExternalStorageDirectory();
//         externalStorageDirPath = directory?.path;
//       } catch (e) {
//         print("Error getting external storage directory: $e");
//       }
//     } else if (Platform.isIOS) {
//       externalStorageDirPath =
//           (await getApplicationDocumentsDirectory()).absolute.path;
//     }
//     return externalStorageDirPath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // extendBody: false,
//       body: SafeArea(
//         child: Container(
//             child: Column(children: <Widget>[
//           Expanded(
//             child: InAppWebView(
//               initialUrlRequest: URLRequest(
//                 url: WebUri("https://irmdesk.com/"),
//               ),
//               // initialUrlRequest: URLRequest(url: Uri.parse(initialurl)),
//               initialOptions: InAppWebViewGroupOptions(
//                 crossPlatform: InAppWebViewOptions(
//                   useOnDownloadStart: true,
//                 ),
//               ),
//               onWebViewCreated: (InAppWebViewController controller) {
//                 webView = controller;
//               },
//               onLoadStart: (InAppWebViewController controller, WebUri? url) {},
//               onLoadStop: (InAppWebViewController controller, WebUri? url) {},

//               onDownloadStartRequest: (controller, downloadStartRequest) async {
//                 await downloadFile(downloadStartRequest.url.toString(),
//                     downloadStartRequest.suggestedFilename);
//               },

             
//             ),
//           ),
//         ])),
//       ),
//     );
//   }

//   Future<void> downloadFile(String url, [String? filename]) async {
//     var hasStoragePermission = await Permission.storage.isGranted;
//     if (!hasStoragePermission) {
//       final status = await Permission.storage.request();
//       hasStoragePermission = status.isGranted;
//     }
//     if (hasStoragePermission) {
//       final taskId = await FlutterDownloader.enqueue(
//           url: url,
//           headers: {},
//           // optional: header send with url (auth token etc)
//           savedDir: (await getTemporaryDirectory()).path,
//           saveInPublicStorage: true,
//           showNotification: true,
//           fileName: filename);
//     }
//   }
// }
