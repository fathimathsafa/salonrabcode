import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonrabcode/core/constants/colors.dart';
import 'package:salonrabcode/core/constants/text_styles.dart';
import 'package:salonrabcode/presentation/owner_side/bottom_navigation_screen/controller/bottom_navigation_controller.dart';
import 'package:salonrabcode/presentation/owner_side/service_screen/view/service_screen.dart';



class OwnerBottomNavigationScreen extends StatelessWidget {
  const OwnerBottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final List<Widget> _screens = [
      ServiceScreen(),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
      Container(
          color: Colors.white, child: Center(child: Text("Settings Screen"))),
    ];
    final List<Map<String, dynamic>> _navItems = [
      {
        "icon": "assets/images/serviceinactivebottom.png",
        "text": "Services",
        "activeIcon": "assets/images/serviceactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/employeesinactivebottom.png",
        "text": "Employees",
        "activeIcon": "assets/images/employeesactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/ownerinactivebottom.png",
        "text": "Owner",
        "activeIcon": "assets/images/owneractivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/companyinactivebottom.png",
        "text": "Company",
        "activeIcon": "assets/images/companyactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
      {
        "icon": "assets/images/settingsinactivebottom.png",
        "text": "Settings",
        "activeIcon": "assets/images/settingsactivebottom.png",
        "activeColor": ColorTheme.black,
        "inactiveColor": ColorTheme.white,
      },
    ];
    return Scaffold(
      body: Consumer<OwnerBottomNavigationController>(
          builder: (context, bottomNavigationcontroller, child) {
        return _screens[bottomNavigationcontroller.selectedIndex];
      }),
      bottomNavigationBar: Consumer<OwnerBottomNavigationController>(
          builder: (context, bottomNavigationcontroller, chile) {
        return BottomNavigationBar(
          currentIndex: bottomNavigationcontroller.selectedIndex,
          onTap: (index) {
            bottomNavigationcontroller.setSelectedIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorTheme.maincolor,
          items: List.generate(_navItems.length, (index) {
            final item = _navItems[index];
            return BottomNavigationBarItem(
                icon: Image.asset(
                  bottomNavigationcontroller.selectedIndex == index
                      ? item["activeIcon"]
                      : item["icon"],
                  width: size.width * .08,
                  height: size.height * .04,
                ),
                label: item["text"],
                backgroundColor: ColorTheme.white);
          }),
          selectedLabelStyle: GlobalTextStyles.bottomNavigationText(context),
          unselectedLabelStyle: GlobalTextStyles.bottomNavigationText(context),
          selectedItemColor: _navItems[bottomNavigationcontroller.selectedIndex]
              ['activeColor'],
          unselectedItemColor: ColorTheme.white,
        );
      }),
    );
  }
}
