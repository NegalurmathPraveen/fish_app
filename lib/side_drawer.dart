
import 'package:fish_app/profile_screen.dart';
import 'package:flutter/material.dart';

import '../local_storage_classes/secure_storage.dart';
import 'login/login_screen.dart';

class SideDrawer extends StatefulWidget {
  var fun;
  SideDrawer({required this.fun});
  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  SecureStorage secureStorage=SecureStorage();

  List drawerList=['Profile','Terms & Conditions','Privacy Policy','About Us','Logout'];

  List icons=[Icon(Icons.account_circle_outlined,color: Color.fromRGBO(4, 4,11, 1),),Icon(Icons.gavel_outlined,color: Color.fromRGBO(4, 4,11, 1)),Icon(Icons.gpp_maybe_outlined,color: Color.fromRGBO(4, 4,11, 1)),Icon(Icons.person_pin_outlined,color: Color.fromRGBO(4, 4,11, 1)),Icon(Icons.logout_rounded,color:  Color.fromRGBO(4, 4,11, 1),)];

  var index=0;


  Widget drawerItem(var item,BuildContext context)
  {
    if(index>4)
    {
      index=0;
    }
    return Row(
      children: [
        icons[index++],
        SizedBox(width: MediaQuery.of(context).size.width*0.03,),
        TextButton(onPressed: ()async{
          //onPressed(index);
          //Navigator.pop(context);
          if(item=='Profile')
          {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => ProfileScreen()));
          }
          else if(item=='Terms & Conditions')
          {

          }
          else if(item=='Privacy Policy')
          {

          }
          else if(item=='About Us')
          {

          }
          else if(item=='Logout')
          {
            await secureStorage.deleteSecureData('doctorDetails');
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => LoginScreen()), (Route<dynamic> route) => false);
          }
        },
            child:Text(item,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                fontSize: 19,color:Color.fromRGBO(4,4,11,1)),textAlign: TextAlign.center,))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Scaffold(
          appBar: AppBar(title: Text('Choose..'),),
          body: Container(
            margin: EdgeInsets.all(30),
            child: Column(
                children:drawerList.map((item) => drawerItem(item,context)).toList()
            ),
          ),
        ),
      ),
    );
  }
}