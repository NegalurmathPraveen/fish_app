import 'package:fish_app/put_pin.dart';
import 'package:flutter/material.dart';

import 'view_page.dart';
class HomeBody extends StatefulWidget {
  var title;
  HomeBody({required this.title});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  var isButtonDisabled=false;


  callRow()
  {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly  ,
      children: [
        button(Icons.check_circle_outline,'Delivered'),
        button( Icons.description_outlined,'View'),
        button( Icons.call,'Call'),
        button( Icons.near_me,'Map')

      ],
    );
  }


  button(icon,text)
  {
    return Container(
    //  color:text=='Delivered'?isButtonDisabled?Colors.white:Colors.green:Colors.green,
      child: TextButton(
        style: ButtonStyle( backgroundColor:MaterialStateProperty.all(Colors.green)),

        onPressed:(){
          if(text=='Delivered')
            {
              var height=MediaQuery.of(context).size.height;
              var width=MediaQuery.of(context).size.width;
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
               AlertDialog(title:Text('Enter delivery otp given by customer',style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 18,color:Color.fromRGBO(0, 0, 0, 0.6),
              ),),
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                content: Container(
                  height: height*0.17,
                  width: width*0.8,
                  child: PutPin(),
                ),//alignment: Alignment.topRight,
                insetPadding: EdgeInsets.only(left: 10,right: 10),
              )
              );
            }
          else if(text=='View')
            {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (c) => ViewButton(title:'order no:25',)));
            }

        },
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 5,),
            Text(text,style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),)
          ],
        ),
      ),
    );
  }

  text(var title,var body)
  {
    return Flexible(
      child: Text.rich(TextSpan(text:title,style:  TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          fontSize: 16,color:Color.fromRGBO(0, 0, 0, 1)),children:[TextSpan(text:body,style:  TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'Inter',
          fontSize: 16,color:Color.fromRGBO(121, 121, 121, 1)))])),
    );
  }
  content()
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      height:MediaQuery.of(context).size.height*0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:  MediaQuery.of(context).size.width*0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text('Name : ','Anand'),
                text('Quantity : ','1 Kg'),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Container(
                  padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color.fromRGBO(83, 173, 0, 1)),
                  child:Text('Paid (online)',style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      fontSize: 16,color:Color.fromRGBO(255, 255, 255, 1)),)
                )
              ],
            ),
          ),
          Container(
            width:  MediaQuery.of(context).size.width*0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text('Order Id : ','25'),
                text('Address : ','The Pavilion Bannerghatta Main Road, JP Nagar, Bangalore-560076'),
                text('Order Date : ','2023-02-21'),
                text('Time Slot : ','9AM-11PM'),
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx,constraint){
    return DefaultTabController(
      length:2,
      child: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                labelColor: Color.fromRGBO(0, 136, 51, 1),
                unselectedLabelColor:Color.fromRGBO(121, 121, 121, 1) ,
                indicatorColor: Color.fromRGBO(0, 136, 51, 1),
                tabs: [
                  Tab(child: Text('Normal Delivery',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      fontSize: 15),),),
                  Tab(child: Text('Bulk Delivery',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      fontSize: 15),)),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width*1,
                height: MediaQuery.of(context).size.height*0.7,
                child: TabBarView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                    //  height: MediaQuery.of(context).size.height*0.7,
                      child: Column(
                        children: [
                          content(),
                         callRow()
                        ],
                      ),
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height*0.7,
                      child: Column(
                        children: [
                          content(),
                          callRow()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
  }
}
