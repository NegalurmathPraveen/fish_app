import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class PutPin extends StatefulWidget {
  const PutPin({Key? key}) : super(key: key);

  @override
  State<PutPin> createState() => _PutPinState();
}

class _PutPinState extends State<PutPin> {
  final otpController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var otp='123456';


  var submittedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
     // borderRadius: BorderRadius.circular(20),
    ),
  );
  var focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
    //  borderRadius: BorderRadius.circular(20),
    ),
  );

  var errorPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle:
    TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.red),
    //  borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Form(
      key: formKey,
      child: Column(
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child:Pinput(
              controller: otpController,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: errorPinTheme,
              errorText: "Invalid OTP",
              validator: (s) {
                if (s?.length != 6) {
                  return 'Invalid OTP';
                } else {
                  return null;
                }
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) {
                otp = pin;
                if (otp != pin) {
                  print('yes');
                }
              },
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.04,),
          Container(
            width: double.infinity,
              height: MediaQuery.of(context).size.height*0.05,
              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5)),
              child: TextButton(onPressed:(){}, child: Text('Submit',style: Theme.of(context).textTheme.headline3,)))
        ],
      ),
    );
  }
}
