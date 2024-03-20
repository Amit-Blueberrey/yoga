import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:yoga/uttils/color.dart';
import 'package:yoga/uttils/container_design.dart';
import 'package:yoga/uttils/font_style.dart';
import 'package:yoga/view/home.dart';
import 'package:yoga/viewModel/provider_controller.dart';

class startApp extends StatefulWidget {
  const startApp({super.key});

  @override
  State<startApp> createState() => _startAppState();
}

class _startAppState extends State<startApp> {
  PageController _pageController = PageController();

  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<ImageProvidermodel>(
        builder: (context, imageProvider, _){  
        return Stack(
          children: [
            PageView.builder(
                itemCount: imageProvider.welcomeImages.length,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  imageProvider.skipHide = index == imageProvider.welcomeImages.length - 1;
        
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.2,
                      ),
                      Container(
                          height: screenHeight * 0.3,
                          
                          child: imageProvider.skipHide != true ? Image.asset(
                            imageProvider.welcomeImages[index],
                            fit: BoxFit.fill,
                          ): 
                          Lottie.asset(imageProvider.welcomeImages[index]),
                          ),
                      SizedBox(
                        height: screenHeight * 0.002,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          imageProvider.welcomeTextHeading[index],
                          style: Fontstyle.getHeading(screenWidth),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: Text(
                          imageProvider.welcomeTextSubHeading[index],
                          style: Fontstyle.getSubHeading(screenWidth),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.13,
                      ),
                      
                    imageProvider.skipHide
                        ? Padding(
                          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage()),);
                              // Vibration.vibrate(duration: 1 );
                            },
                            child: Container(
                              height: screenHeight * 0.07,
                              width: double.infinity,
                              decoration: ContainerDesigns.simpleContainer(
                                color: buttonColor,
                                  // borderWidth: screenWidth * 0.005,
                                  // borderColor: buttonColor
                                  ),
                              child: Center(
                                  child: Text(
                                "Let's start",
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w700,
                                  color: white,
                                ),
                              )),
                            ),
                          ),
                        )
                        : Container(),
                      
                    ],
                  );
                }),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.23),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: imageProvider.welcomeImages.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: buttonColor,
                      dotHeight: screenHeight * 0.008,
                      dotWidth: screenWidth * 0.03,
                      spacing: screenWidth * 0.04),
                ),
              ),
            ),
            imageProvider.skipHide != true
                ? Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.1, right: screenWidth * 0.02),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _pageController
                                  .jumpToPage(imageProvider.welcomeImages.length - 1);
                            });
                          },
                          child: Text(
                            "Skip",
                            style: Fontstyle.getSubHeading(screenWidth),
                          ),
                        )),
                  )
                : Container()
          ],
        );
      },),
    );
  }
}