import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'pages/containerScreen.dart';
import 'providers/adminProvider.dart';
import 'providers/donorProvider.dart';
import 'providers/patientProvider.dart';
import 'providers/donationProvider.dart';
import 'providers/bloodBankProvider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PatientProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DonorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BloodBankProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DonationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Blood Donation Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: ContainerScreen(),
        routes: routes,
      ),
    );
  }
}
