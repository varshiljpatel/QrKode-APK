import 'package:flutter/material.dart';
import 'package:qr_kode/CreateQR.dart';
import 'package:qr_kode/ui/appbar.dart';

class CreateChannel extends StatefulWidget {
  const CreateChannel({super.key});

  @override
  State<CreateChannel> createState() => _CreateChannelState();
}

class _CreateChannelState extends State<CreateChannel> {
  String _warnString = "Enter a text on above visible input container.";
  TextEditingController textEditingController = TextEditingController();

  createBtnCtrl(BuildContext context) {
    final String inputString = textEditingController.text.trim().toString();
    if (inputString.isNotEmpty) {
      const SnackBar(content: Text("abcd"),);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CreateQR())
      );
    } else {
      _warnString = "Please Fill the Text";
      const SnackBar(content: Text("dcba"),);
    }
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
              const Text('Create QR', style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32.0
              ),),

              const SizedBox(
                height: 24.0,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  TextField(
                    controller: textEditingController,

                    decoration: const InputDecoration(
                      label: Text("Enter Your Text Here", style: TextStyle(
                        color: Colors.white,
                      ),),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white
                        )
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 12.0,
                  ),

                  Text(_warnString.toString(), style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white60,
                    fontSize: 16.0
                  ),),
                ],
              ),

              const SizedBox(
                height: 36.0,
              ),

              SizedBox(
                width: 120,

                child: ElevatedButton(
                  onPressed: () => createBtnCtrl(context),

                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white
                    ),
                    elevation: MaterialStatePropertyAll(0.0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))
                      )
                    )
                  ),

                  child: const Text("Create", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
