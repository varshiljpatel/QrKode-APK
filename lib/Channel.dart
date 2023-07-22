import 'package:flutter/material.dart';
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
                height: MediaQuery.of(context).size.width / 2.25,
                width: MediaQuery.of(context).size.width / 2.25,

                decoration: BoxDecoration(
                  border: Border.all(width: 4.0, color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(1000))
                ),

                child: const Center(
                  child: Text("Scan", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32
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
                height: MediaQuery.of(context).size.width / 2.25,
                width: MediaQuery.of(context).size.width / 2.25,

                decoration: BoxDecoration(
                    border: Border.all(width: 4.0, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(1000))
                ),

                child: const Center(
                  child: Text("Create", style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
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
