
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/presentation/owner_side/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/view/employees_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/employees_screen/view/employees_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_adding_screen/view/service_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/view/service_screen.dart';


void main() {
  runApp(
    MultiProvider(providers: [
    
    ChangeNotifierProvider(create: (_) => OwnerBottomNavigationController()),
  ], child:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Base design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ServiceScreen(),
        );
      },
    );
  }
}
