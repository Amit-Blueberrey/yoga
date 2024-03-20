


import 'package:flutter/material.dart';

class ImageProvidermodel extends ChangeNotifier {
  // late List<> dataFor = [];
  bool skipHide = false;
  int vibratioDuration = 15;

  late int imageindex;
   List<String> welcomeImages = [
    "assets/images/yoga1.png",
    "assets/images/yoga2.png",
    "assets/animation/yoga1.json",
    // Add more image URLs as needed
  ];

   List<String> welcomeTextHeading = [
    "Free and Easy to use",
    "Quick and easy learning",
    "Create your own yoga plan",
    // Add more image URLs as neededs
  ]; 
  
  List<String> welcomeTextSubHeading = [
    "Free yoga for you to find your way to live healthy",
    "Easy and fast learning at anytime to help you improve various skills",
    "Study according to the study plan, make study more motivated",
    // Add more image URLs as neededs
  ];


  List<String> yogaImages = [
    "assets/images/001.png",
    "assets/images/002.png",
    "assets/images/003.png",
    "assets/images/004.png",
    "assets/images/005.png",
    "assets/images/006.png",
    "assets/images/007.png",
    "assets/images/008.png",
    "assets/images/009.png",
    "assets/images/010.png",
    // Add more image URLs as needed
  ];

  List<String> yogaNames = [
  "Hatha Yoga",
  "Vinyasa Yoga",
  "Ashtanga Yoga",
  "Iyengar Yoga",
  "Bikram Yoga",
  "Kundalini Yoga",
  "Yin Yoga",
  "Restorative Yoga",
  "Power Yoga",
  "Anusara Yoga",
];

List<String> yogaBenefits = [
  "Strengthens the arms and legs, stretches the hamstrings, calves, and hands, relieves back pain, improves digestion.",
  "Strengthens the legs, opens the hips and chest, improves balance and concentration, boosts confidence.",
  "Improves balance and stability, strengthens legs and feet, opens the hips and shoulders, improves focus.",
  "Stretches the hamstrings, groins, and hips, improves digestion, reduces anxiety, alleviates back pain.",
  "Relieves stress and fatigue, stretches the hips, thighs, and ankles, aids in relaxation, improves circulation.",
  "Strengthens the spine, stretches the chest, shoulders, and abdomen, firms the buttocks, improves mood.",
  "Strengthens the back, neck, and chest, improves posture, stimulates the lungs and thyroid glands.",
  "Stretches the spine, shoulders, and hamstrings, calms the brain, reduces anxiety and fatigue.",
  "Strengthens the legs, buttocks, and ankles, improves coordination and balance, enhances mental focus.",
  "Relaxes the body and mind, reduces stress and tension, promotes deep relaxation and better sleep."
];



  
}