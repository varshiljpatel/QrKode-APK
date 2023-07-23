import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_kode/ui/appbar.dart';
import 'package:share/share.dart';

class CreateQR extends StatefulWidget {
  final String contentDataBase;

  const CreateQR({super.key, required this.contentDataBase});

  @override
  State<CreateQR> createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  late final String _contentData;
  // ScreenshotController screenshotController = ScreenshotController();

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
    // if (_contentData.isEmpty) return;
    // try {
    //   final imageQr = await QrPainter(
    //     data: _contentData,
    //     version: QrVersions.auto,
    //     color: Colors.black,
    //     emptyColor: Colors.white,
    //     gapless: true
    //   ).toImageData(300);
    //
    //   // final byteData = await imageQr.toByteData(
    //   //   format: ImageByteFormat.png
    //   // )
    //
    //   await Share.shareXFiles(
    //     [imageQr!.],
    //     text: "Share this QR via",
    //     subject: "QR Kode"
    //   );
    // }

    // final directory = (await getApplicationDocumentsDirectory()).path;
    // screenshotController.capture().then((dynamic image) async {
    //   if (image != null) {
    //     try {
    //       String filename = DateTime.now().microsecondsSinceEpoch.toString();
    //       final imagePath = await File("$directory/$filename.png").create();
    //       await imagePath.writeAsBytes(image);
    //       Share.shareFiles([imagePath.path]);
    //     } catch (e) {}
    //   }
    // });
  }

  // Share QR Code
  void _downloadQrCode() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onlyBackBar(context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text("Download", style: TextStyle(
                fontSize: 32.0,
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

                child: const Text('Scan this QR Code for get your text or link.', textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 16.0,
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
                      onTap: () {
                        _downloadQrCode();
                      },

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
          )
        ),
      ),
    );
  }
}
