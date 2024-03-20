import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:yoga/uttils/color.dart';
import 'package:yoga/uttils/container_design.dart';
import 'package:yoga/uttils/font_style.dart';
import 'package:yoga/viewModel/provider_controller.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final PageController _pageController = PageController(initialPage: 0);
   String count1 = "";
   double percentage= 0.73;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<ImageProvidermodel>(
        builder: (context, imageProvider, _) {
          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics:
                    NeverScrollableScrollPhysics(), // Disable swipe gesture
                itemCount: imageProvider.yogaImages.length,
                onPageChanged: (value) {
                  setState(() {
                    
                  });
                },
                itemBuilder: (context, index) {
                  count1 = imageProvider.yogaImages[index];
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.02),
                    child: Column(
                      children: [
                        SizedBox(
                        height: screenHeight * 0.05,
                      ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.asset(imageProvider.yogaImages[index])),
                        ),
                        SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          imageProvider.yogaNames[index],
                          style: Fontstyle.getHeading(screenWidth),
                          textAlign: TextAlign.center,
                        ),
                      ),
                        SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          imageProvider.yogaBenefits[index],
                          style: Fontstyle.getSubHeading(screenWidth),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: screenHeight*0.03,),

                      CircularPercentIndicator(
                        lineWidth: screenWidth*0.025,
                            radius: screenWidth * 0.15,
                            percent: percentage,
                            animation: true,
                            animationDuration: 1700,
                            progressColor: buttonColor,
                            backgroundColor: containerLightColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(
                              "01/10",
                              style: Fontstyle.getSubHeading(screenWidth),
                            ),
                          ),
                      SizedBox(height: screenHeight*0.02,),
                      Text(
                            "00:01",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.075,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),

                        
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight*0.05),
                child: Align(alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      count1 != "0"?
                      InkWell(
                        onTap: () {
                          if (_pageController.page != 0) {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                        },
                        child: Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration: ContainerDesigns.simpleContainer(
                              borderWidth: screenWidth * 0.005,
                              borderColor: buttonColor),
                          child: Center(
                              child: Text(
                            "Previous",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              color: buttonColor,
                            ),
                          )),
                        ),
                      ):Container(),
                      
                      IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_outlined ,color: buttonColor,size: screenWidth*0.1,)),
                  
                      InkWell(
                        onTap: () {
                          if (_pageController.page != imageProvider.yogaImages.length-1) {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }
                        },
                        child: Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.3,
                          decoration:
                              ContainerDesigns.simpleContainer(color: buttonColor),
                          child: Center(
                              child: Text(
                            "Next",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: buttonColor,
      //   onPressed: (){},child: Text(
      //                       "Next",
      //                       style: GoogleFonts.poppins(
      //                         fontSize: screenWidth * 0.04,
      //                         fontWeight: FontWeight.w600,
      //                         color: white,
      //                       ),
      //                     ),),
      
    );
  }
}
