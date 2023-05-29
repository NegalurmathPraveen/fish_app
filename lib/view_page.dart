import 'package:flutter/material.dart';
class ViewButton extends StatefulWidget {
  var title;
  ViewButton({required this.title});

  @override
  State<ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<ViewButton> {


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
  @override
  Widget build(BuildContext context) {
    var headStyle=TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        fontSize: 15,color:Colors.black);
    var contStyle=TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        fontSize: 13,color:Colors.black);
    return Scaffold(
      appBar: AppBar(title:Text(widget.title,style:Theme.of(context).textTheme.headline3,)),
      body:Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal:10),
        child: Column(
          children: [
            Table(
             // border: TableBorder.symmetric(inside: BorderSide(color: Colors.black)),
              children: [
                TableRow(
                    decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.black))),
                    children: [
                  Text('#',style: headStyle,),
                  Text('Item',style: headStyle,),
                  Text('Type',style: headStyle,),
                  Text('Quantity',style: headStyle,),
                  Text('Price',style: headStyle,),
                  Text('Total',style: headStyle,),
                ]),
                TableRow(
                  decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.black))),
                    children: [
                  Text('1',style: contStyle,),
                  Text('Silver Pomphret',style: contStyle,),
                  Text('Whole',style: contStyle,),
                  Text('1 Kg',style: contStyle,),
                  Text('Rs.45',style: contStyle,),
                  Text('Rs.45',style: contStyle,),
                ])
              ],
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.05,),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  text('Shipping :','Rs.10'),
                  text('Coupon :','Rs.10'),
                  text('Total :','Rs.10'),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
