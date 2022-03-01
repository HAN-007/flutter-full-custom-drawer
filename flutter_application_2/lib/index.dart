import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  PageController ?pageController;
  bool count = true;
  double ?redsize;
  double ?yellowsize;
  List<Color> listcolor = [Colors.red,Colors.black];
  ScrollController scrollController = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     if(count){
       redsize = size.width ;
       yellowsize = 0;
     }
     else{
       redsize = size.width/2;
       yellowsize = size.width / 2;
     }
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          count = !count;
        });
      },),
      body: Container(child: Stack(
        children: [
          
          
        Container(
              decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                    "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg"
                    ),
            fit: BoxFit.cover
        )
    ),
                
            height: size.height,
            width: size.width,
            //color: Colors.red,
            
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
                sigmaX: count ?  0 : 5.0 ,
                sigmaY: count ?  0 : 5.0,
              ),
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: size.height,
              width: yellowsize,
              color: Colors.white,
                    
            ),
        ),
        Positioned(top: 70,
        child: AnimatedContainer(duration: Duration(milliseconds: 500),width: count ? size.width * 0.3 : (size.width * 0.2) + size.width / 2,height: size.height * 0.08, decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))),child: Row(children: [Icon(Icons.menu,size: 50,),Icon(Icons.close,size: 50,)],mainAxisAlignment: MainAxisAlignment.end,),alignment: Alignment.centerRight,)),
        ],
      ),)
    );
  }
}
