

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/contraints.dart';
import 'package:furniture_app/details_screen.dart';
import 'package:furniture_app/widget/bootom_bar.dart';
import 'package:furniture_app/widget/category_widget.dart';
import 'package:furniture_app/widget/header.dart';
import 'package:furniture_app/widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey catListKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 15,

                ),
                Header(),
                SizedBox(
                  height: 310,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Hero(
                        tag: 'blue_card',
                        child: Material(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0)
                                  ),
                                // color: Theme.of(context).primaryColor,
                               color: Colors.deepPurple,

                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/images/weather.png",
                                              width: 25,
                                            ),
                                            const Text(
                                              " 32'C",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),

                                          ],


                                        ),
                                        const Text(
                                          "24",
                                          style: TextStyle(
                                              height: 1.1,
                                              fontSize: 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Text(
                                          "January",
                                          style: TextStyle(
                                              fontSize: 12,
                                              height: 0.2,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),

                                      ],

                                    ),
                                  )

                                ],

                              ),
                            ),


                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 0,
                        left: 0,
                         child: Hero(
                          tag: "cat",
                          child: listView(),
                         ),
                      ),
                      Positioned(
                          top: 0,
                          right: 10,
                          child: Image.asset(
                            "assets/images/ladder.png",
                            height: 180,
                          ))


                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommend",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SvgPicture.asset(
                        'assets/svg/right_arrow.svg',
                        height: 18,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: recommend.length,
                      itemBuilder:(context,index){
                         return ProductCard(
                          product: recommend[index],
                         );

                      }),

                ),







              ],


            ),
          ),
        ),

      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         floatingActionButton: const BottomNavBar()


    );
  }

 Widget listView() {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        key: catListKey,
        height: 85,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
            itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                final _offset=(catListKey.currentContext!.findRenderObject() as RenderBox)
                    .localToGlobal(Offset.zero);
                Navigator.push(context,
                    PageRouteBuilder(
                        pageBuilder:(context,animation1,animation2)=>
                            DetailsPage(
                                catListOffset: _offset,
                                selectedCat: index),
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),



                );

              },
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CategoryWidget(
                  category: categories[index],

                ),
              ),



            );

            }),
      ),

    );


 }


}
