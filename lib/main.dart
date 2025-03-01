import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/presentation/owner_side/add_branches_screen/view/add_branches_screen.dart';
import 'package:salonrabcode/presentation/owner_side/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:salonrabcode/presentation/owner_side/company_profile_screen/controller/company_profile_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/company_profile_screen/view/company_profile_screen.dart';
import 'package:salonrabcode/presentation/owner_side/employee_profile_owner_screen/controller/employee_profile_owner_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/employee_profile_owner_screen/view/employee_profile_owner_screen.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/controller/employees_adding_controller.dart';
import 'package:salonrabcode/presentation/owner_side/employees_adding_screen/view/employees_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/owner_profile_screen/controller/owner_profile_screen_controller.dart';
import 'package:salonrabcode/presentation/owner_side/owner_profile_screen/view/owner_profile_screen.dart';
import 'package:salonrabcode/presentation/owner_side/partners_adding_screen/view/partners_adding_screen.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/controller/service_details_controller.dart';
import 'package:salonrabcode/presentation/owner_side/service_details_screen/view/service_details_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OwnerBottomNavigationController()),
    ChangeNotifierProvider(create: (_) => ServiceDetailsScreenController()),
    ChangeNotifierProvider(create: (_) => SelectedServiceProvider()),
    ChangeNotifierProvider(create: (_) => EmployeeProfileScreenController()),
    ChangeNotifierProvider(create: (_) => OwnerProfileScreenController()),
    ChangeNotifierProvider(create: (_)=>CompanyProfileScreenController())
  ], child: MyApp()));
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
          home: AddBranchesScreen(),
        );
      },
    );
  }
}
