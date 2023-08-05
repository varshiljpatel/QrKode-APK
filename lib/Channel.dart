import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_kode/constants.dart';
import 'ScanChannel.dart';
import 'CreateChannel.dart';

class Channel extends StatefulWidget {
  const Channel({super.key});

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {

  scanChannel() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ScanChannel())
    );
    return null;
  }

  createChannel() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreateChannel())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
            statusBarColor: Colors.black
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // Scan channel
            InkWell(
              onTap: () {
                scanChannel();
              },

              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(1000))
              ),

              child: Container(
                height: (MediaQuery.of(context).size.width > 750) ?
                  MediaQuery.of(context).size.width / 8
                  : MediaQuery.of(context).size.width / 2,
                width: (MediaQuery.of(context).size.width > 750) ?
                  MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 2,

                decoration: BoxDecoration(
                  border: Border.all(width: 4.0, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(1000))
                ),

                child: Center(
                  child: Text("Scan", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Constants.BIGTEXT.toDouble()
                  ),),
                ),
              ),
            ),

            const SizedBox(
              height: 72.0,
            ),

            // Create channel
            InkWell(
              onTap: () {
                createChannel();
              },

              customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1000))
              ),

              child: Container(
                height: (Constants.FULLWIDTH(context) > 750) ?
                  Constants.FULLWIDTH(context) / 8
                  : Constants.FULLWIDTH(context) / 2,
                width: (Constants.FULLWIDTH(context) > 750) ?
                  Constants.FULLWIDTH(context) / 3
                  : Constants.FULLWIDTH(context) / 2,

                decoration: BoxDecoration(
                    border: Border.all(width: 4.0, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(1000))
                ),

                child: Center(
                  child: Text("Create", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: Constants.BIGTEXT.toDouble(),
                  ),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
