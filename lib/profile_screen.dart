import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: height*0.05,),
            TextFormField(
              decoration:InputDecoration(labelText: 'Name') ,
            ),
            SizedBox(height: height*0.05,),
            TextFormField(
              decoration:InputDecoration(labelText: 'Mobile') ,
            ),
            SizedBox(height: height*0.05,),
            TextFormField(
              decoration:InputDecoration(labelText: 'Username') ,
            ),
          ],
        ),
      ),
    );
  }
}
