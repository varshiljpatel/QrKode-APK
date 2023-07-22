import 'package:flutter/material.dart';
import 'package:qr_kode/ui/appbar.dart';

class ScanChannel extends StatefulWidget {
  const ScanChannel({super.key});

  @override
  State<ScanChannel> createState() => _ScanChannelState();
}

class _ScanChannelState extends State<ScanChannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onlyBackBar(context),
      
      body: Center(
        child: Text("Scan", style: TextStyle(
          fontSize: 32.0
        )),
      ),
    );
  }
}
