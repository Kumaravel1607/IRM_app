import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InAppWebViewController webView;

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
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri("https://ssdesk.in/v1"),
                ),
                // initialUrlRequest: URLRequest(url: Uri.parse(initialurl)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    useOnDownloadStart: true,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onLoadStart:
                    (InAppWebViewController controller, WebUri? url) {},
                onLoadStop: (InAppWebViewController controller, WebUri? url) {},
                onDownloadStartRequest: (controller, url) async {
                  // Check and request storage permission
                  var status = await Permission.storage.status;
                  //if (status.isGranted) {
                  // Get the external storage directory
                  Directory? tempDir = await getExternalStorageDirectory();

                  // Print the download details
                  print("onDownload ${url.url.toString()}\n ${tempDir!.path}");

                  // Enqueue the download using flutter_downloader
                  await FlutterDownloader.enqueue(
                    url: url.url.toString(),
                    fileName: url.suggestedFilename ?? 'downloaded_file',
                    savedDir: tempDir.path,
                    showNotification: true,
                    requiresStorageNotLow: false,
                    openFileFromNotification: true,
                    saveInPublicStorage: true,
                  );
                  // } else {
                  //   // Request storage permission
                  //   await Permission.storage.request();
                  // }
                }),
          ),
        ])),
      ),
    );
  }
}



///////Method 2

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

//               onDownloadStartRequest: (controller, request) async {
//                 var status = await Permission.storage.status;
//                 // if (status.isGranted) {
//                 // Get the external storage directory
//                 Directory? tempDir = await getExternalStorageDirectory();
//                 // Replace invalid characters in the filename
//                 String sanitizedFilename = request.suggestedFilename
//                         ?.replaceAll(RegExp(r'[^\w\s]+'), '_') ??
//                     'downloaded_file';
//                 // Log download details
//                 print(
//                     "onDownload ${request.url.toString()}\nFilename: $sanitizedFilename\nPath: ${tempDir!.path}");
//                 // Enqueue the download using flutter_downloader
//                 print("Before enqueue operation");
//                 await FlutterDownloader.enqueue(
//                   url: request.url.toString(),
//                   fileName: sanitizedFilename,
//                   savedDir: tempDir.path,
//                   showNotification: true,
//                   requiresStorageNotLow: false,
//                   openFileFromNotification: true,
//                   saveInPublicStorage: true,
//                 );
//                 print("After enqueue operation");
//                 // } else {
//                 //   // Request storage permission
//                 //   await Permission.storage.request();
//                 // }
//               },

//
//             ),
//           ),
//         ])),
//       ),
//     );
//   }
// }

/////  Method 3

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
