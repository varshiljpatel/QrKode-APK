import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget? onlyBackBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(75, 0, 0, 0),
    elevation: 0,
    leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_sharp, color: Colors.white)
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
    ),
  );
}