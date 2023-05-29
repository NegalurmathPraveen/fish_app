import 'package:flutter/material.dart';
class LogoWithName extends StatefulWidget {
 var type;
 LogoWithName({required this.type});

  @override
  State<LogoWithName> createState() => _LogoWithNameState();
}

class _LogoWithNameState extends State<LogoWithName> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (ctx,constraint){
      return Container(
        color: Colors.white10,
        height: widget.type=='login'? height * 0.6:height*0.9,
        width: width * 0.7,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    image:DecorationImage(
                        fit: BoxFit.fill,
                        image:  AssetImage('assets/images/splash_screen_image1.png',)
                    ) ),
              ),
              widget.type=='login'?Container():SizedBox(height:height * 0.5,),

              widget.type=='login'?Container():Container(
                width: width,
                // padding: EdgeInsets.symmetric(vertical: 15),
                // color: Colors.blue,
                child: Text('DELIVERY PARTNER APP',style: TextStyle(fontFamily:'Inter',
                    color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                ),
              )
            ]
        ),
      );
    });
  }
}
