import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/view/start_featurePage.dart';
import 'package:yoga/viewModel/provider_controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageProvidermodel()),
        // ChangeNotifierProvider(create: (_) => PageNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // Define your app theme here
            ),
        home: startApp(), // Use Home() instead of home()
      ),
    );
  }
}

