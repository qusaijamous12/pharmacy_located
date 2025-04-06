import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/color_manger.dart';
import '../shared/text_style.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final List<SliderModel>  _item=_getSliders();
  int _currentIndex=0;
  final _pageController=PageController();


  List<SliderModel> _getSliders()=>[
    SliderModel(imagePath: 'assets/images/new_logo.png', title: 'MediPharm', subTitle: ''),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:PageView.builder(
        controller: _pageController,
        itemBuilder: (context,index)=>sliderItem(_item[index]),
        itemCount: _item.length,
        onPageChanged: (index){
          setState(() {
            _currentIndex=index;

          });

        },

      ),
      bottomNavigationBar: Container(
        padding:const  EdgeInsetsDirectional.symmetric(horizontal: 14,vertical: 14),
        height: 100,
        child: Row(
          children: [
            const Spacer(),
            SmoothPageIndicator(controller: _pageController, count: _item.length,effect:const WormEffect(
                radius: 16,
                dotColor: Colors.grey,
                activeDotColor: ColorManger.kPrimary

            ) ,),
            const Spacer(),
            GestureDetector(
              onTap: (){
                if(_currentIndex==_item.length-1){
                  Get.offAll(()=>const LoginScreen());
                }
                else{
                  _pageController.nextPage(duration:const Duration(milliseconds: 500), curve: Curves.bounceInOut);
                }
              },
              child:const CircleAvatar(
                  backgroundColor: ColorManger.kPrimary,
                  radius: 30,
                  child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
            )





          ],
        ),
      ),
    );
  }
  Widget sliderItem(SliderModel model)=>Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(model.imagePath),
      const SizedBox(
        height: 12,  ),
      Text(
        model.title,
        style: getMyBoldTextStyle(textColor: ColorManger.kPrimary),
      ),
      const  SizedBox(
        height: 12,
      ),
      Text(
        model.subTitle,
        textAlign: TextAlign.center,
        style: getMyRegularTextStyle( textColor: Colors.grey),
      )


    ],
  );
}

class SliderModel{
  final String title;
  final String subTitle;
  final String imagePath;

  SliderModel({
    required this.imagePath,
    required this.title,
    required this.subTitle
  });
}