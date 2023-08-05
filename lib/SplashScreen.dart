import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_kode/Channel.dart';
import 'package:qr_kode/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Channel())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Constants.BGCOLOR,
            statusBarColor: Colors.black
          ),
        ),
      ),

      body: SizedBox(
        height: Constants.FULLHEIGHT(context),
        width: Constants.FULLWIDTH(context),

        child: Padding(
          padding: const EdgeInsets.all(32.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: const [
              Center(
                child: Image(image: AssetImage("assets/images/ic_logo.png"))
              )
            ],
          ),
        ),
      ),
    );
  }
}
