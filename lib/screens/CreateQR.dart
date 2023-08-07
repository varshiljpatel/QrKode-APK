import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_kode/utils/code_painter.dart';
import 'package:qr_kode/utils/constants.dart';
import 'package:qr_kode/ui/appbar.dart';
import 'package:qr_kode/ui/snakeBar.dart';
import 'package:share/share.dart';
import 'dart:ui' as ui;

class CreateQR extends StatefulWidget {
  final String contentDataBase;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  CreateQR({super.key, required this.contentDataBase});

  @override
  State<CreateQR> createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  late final String _contentData;

  @override
  void initState() {
    super.initState();
    _contentData = widget.contentDataBase;
  }

  // Generate QR Code from String
  _generateQrCode() {
    if (widget.contentDataBase.isNotEmpty) {
      return QrImage(
        data: _contentData,
        version: QrVersions.auto,
        size: 200,
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      );
    }
  }

  // Share QR Code
  void _shareQrCode() async {
    if (_contentData.isEmpty) return;
    try {
      _generateQrCode();
      var filePathSave = await _downloadQrCode();
      await Share.shareFiles(["$filePathSave"]);
    } catch (e) {
      if (kDebugMode) {
        print("Eoo Occ");
      }
    }
  }

  // Share QR Code
  Future<String?>? _downloadQrCode() async {
    if (Platform.isAndroid) {
      try {
        if (await Permission.manageExternalStorage.isGranted) {
          Directory? directory = await getExternalStorageDirectory();

          // Create QrKode Directory
          List<String?>? downloadDirList = [];
          var dirList = directory.toString().split("/");
          try {
            for (int i = 0; i < dirList.length; i++) {
              if (dirList[i].toString().toLowerCase() == "android") {
                break;
              }
              downloadDirList.add(dirList[i]);
            }
            directory = Directory("${downloadDirList.join("/")}/QrKode");

            // Create directory
            if (!await directory.exists()) {
              directory.create(recursive: true);
            }
          } catch (e) {
            if (kDebugMode) {
              print("Error : $e");
            }
            showSnakeBar(context: context, message: "Failed to download.");
          }

          String filename = "QrKode-${DateTime.now().millisecondsSinceEpoch}.png";
          File file = File("${directory!.path}/$filename");
          file.create();
          Uint8List? qrCodeBytes = await _generateQrCodeBytes(_contentData);

          ImageGallerySaver.saveImage(qrCodeBytes!);
          await file.writeAsBytes(qrCodeBytes);
          widget._scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text("QR code saved to: ${file.path}")),
          );
          return file.path;
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error : $e");
        }
        widget._scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(content: Text("Fail to save QR code.")),
        );
      }
    }
    return null;
  }

  Future<Uint8List?>? _generateQrCodeBytes(String data) async {
    try {
       var qrImage = await QrPainter(
        data: data,
        version: QrVersions.auto,
        color: Colors.black,
        emptyColor: Colors.white,
        gapless: true,
      ).toImageData(1000);

      return qrImage?.buffer.asUint8List();
    } catch (e) {
      widget._scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(content: Text("Fail to save QR code.")),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onlyBackBar(context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Download", style: TextStyle(
                  fontSize: Constants.BIGTEXT.toDouble(),
                  fontWeight: FontWeight.w500
                ),),

                const SizedBox(
                  height: 36.0,
                ),

                // Qr image
                _generateQrCode(),

                const SizedBox(
                  height: 36.0,
                ),

                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 225
                  ),

                  child: Text('Scan this QR Code for get your text or link.', textAlign: TextAlign.center, style: TextStyle(
                    fontSize: Constants.TEXT.toDouble(),
                    fontWeight: FontWeight.w400,
                  ),),
                ),

                const SizedBox(
                  height: 48.0,
                ),

                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      // Share icon
                      InkWell(
                        onTap: () {
                          _shareQrCode();
                        },

                        customBorder: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(1000))
                        ),

                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 4.0, color: Colors.white),
                              borderRadius: const BorderRadius.all(Radius.circular(1000))
                          ),

                          child: const Padding(
                            padding: EdgeInsets.all(12.0),

                            child: Icon(Icons.share, color: Colors.white, size: 36.0),
                          )
                        ),
                      ),

                      // Download icon
                      InkWell(
                        onTap: () async {
                          await _downloadQrCode();
                        },

                        customBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1000))
                        ),

                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 4.0, color: Colors.white),
                              borderRadius: const BorderRadius.all(Radius.circular(1000))
                          ),

                          child: const Padding(
                            padding: EdgeInsets.all(12.0),

                            child: Icon(Icons.download_sharp, color: Colors.white, size: 36.0,),
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
