import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

 late Animation cardAnimation, delayedCardAnimation, fabButtonAnimation, infoAnimation;
 late AnimationController controller;

 @override
 void initState() {
   super.initState();
   controller =
       AnimationController(vsync: this, duration: Duration(seconds: 3));
   cardAnimation = Tween(begin: 0.0, end: -0.025).animate(
     CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
   delayedCardAnimation = Tween(begin: 0.0, end: -0.05).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)
       ));
   fabButtonAnimation = Tween(begin: 0.0, end: -0.05).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
   infoAnimation = Tween(begin: 0.0, end: 0.025).animate(
       CurvedAnimation(parent: controller, curve: Interval(0.7, 1.0, curve: Curves.fastOutSlowIn)
       ));
 }

  @override
  Widget build(BuildContext context) {
   final devHeight = MediaQuery.of(context).size.height;
   controller.forward();
   return AnimatedBuilder(
       animation: controller,
       builder: (BuildContext context, child)
   {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
         leading: IconButton(
           icon: Icon(Icons.arrow_back_ios),
           color: Colors.black,
           onPressed: () {},
         ),
         title: Text('Near by you', style: TextStyle(color: Colors.black,
             fontWeight: FontWeight.bold, fontSize: 20),),
         actions: [
           Padding(
             padding: EdgeInsets.only(right: 8),
             child: FlutterLogo(
               textColor: Colors.purple,
               size: 40,
             ),
           )
         ],
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
             child: Stack(
               overflow: Overflow.visible,
               children: [
                 Positioned(
                   left: 15,
                   child: Container(
                     transform: Matrix4.translationValues(0.0, delayedCardAnimation.value * devHeight, 0.0),
                     width: 310,
                     height: 500,
                     decoration: BoxDecoration(
                         color: Colors.amber,
                         borderRadius: BorderRadius.circular(10)
                     ),
                   ),
                 ),
                 Positioned(
                   left: 8,
                   child: Container(
                     transform: Matrix4.translationValues(0.0, cardAnimation.value * devHeight, 0.0),
                     width: 330,
                     height: 500,
                     decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(10)
                     ),
                   ),
                 ),
                 Container(
                   width: 350,
                   height: 500,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                         image: AssetImage('images/9.jpg'),
                         fit: BoxFit.cover,
                       )
                   ),
                 ),
                 Positioned(
                   top: 420,
                   left: 25,
                   child: Container(
                     transform: Matrix4.translationValues(0.0, infoAnimation.value * devHeight, 0.0),
                     width: 300,
                     height: 90,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                           blurRadius: 1,
                           color: Colors.black12,
                           spreadRadius: 2,
                         ),
                       ],
                     ),
                     child: Container(
                       padding: EdgeInsets.all(7),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Row(
                             children: [
                               Text('Jungkook', style: TextStyle(
                                   fontSize: 20, fontWeight: FontWeight.bold),),
                               SizedBox(width: 5,),
                               Image(
                                 image: AssetImage('images/male.png'),
                                 height: 20,
                                 width: 20,
                               ),
                               SizedBox(width: 60,),
                               Text('5.8km', style: TextStyle(fontSize: 20,
                                   color: Colors.grey),),
                             ],
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Row(
                             children: [
                               Text('Fate is wonderful.', style: TextStyle(
                                 fontSize: 15, color: Colors.grey,
                               ),),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           SizedBox(
             height: 80,
           ),
           Container(
             transform: Matrix4.translationValues(0.0, fabButtonAnimation.value * devHeight, 0.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 FloatingActionButton(
                   onPressed: () {},
                   child: Icon(
                     Icons.close,
                     color: Colors.black,
                   ),
                   backgroundColor: Colors.white,
                 ),
                 Container(
                   height: 70,
                   width: 70,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(35),
                     border: Border.all(
                       color: Colors.transparent,
                       style: BorderStyle.solid,
                       width: 2,
                     ),
                   ),
                   child: Container(
                     child: Center(
                       child: IconButton(
                         icon: Image.asset('images/chat.png'),
                         onPressed: () {},
                       ),
                     ),
                   ),
                 ),
                 FloatingActionButton(
                   onPressed: () {},
                   child: Icon(
                     Icons.favorite,
                     color: Colors.pink,
                   ),
                   backgroundColor: Colors.white,
                 ),
               ],
             ),
           ),
         ],
       ),
     );
   }
   );
  }
}
