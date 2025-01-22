import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:medicalassiss/core/theming/colors.dart';
import 'package:medicalassiss/features/realtime_chat/chats/chats_screen.dart';
import 'package:medicalassiss/features/user_features/user_home/ui/homepage.dart';
import 'package:medicalassiss/features/user_features/user_profile/profile_page.dart';
import 'package:medicalassiss/ui/map/map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // Determine if the current locale is RTL
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Homepage(),
          ChatsScreen(),
          StreetMap(),
          UserProfilePage(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            // Icon and text alignment for RTL or LTR
            icon: isRtl
                ? const Icon(Icons.home, textDirection: TextDirection.rtl)
                : const Icon(Icons.home),
            title: Text(
              AppLocalizations.of(context)!.home,
              textAlign: isRtl
                  ? TextAlign.right
                  : TextAlign.left, // Adjust text alignment for RTL
            ),
            activeColor: ColorManager.buttons,
            activeTitleColor: ColorManager.buttons,
          ),
          BottomBarItem(
            icon: isRtl
                ? const Icon(Icons.message, textDirection: TextDirection.rtl)
                : const Icon(Icons.message),
            title: Text(
              AppLocalizations.of(context)!.chats,
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
            ),
            activeColor: ColorManager.chatMainColor,
          ),
          BottomBarItem(
            icon: isRtl
                ? const Icon(Icons.map_sharp, textDirection: TextDirection.rtl)
                : const Icon(Icons.map_sharp),
            title: Text(
              AppLocalizations.of(context)!.map,
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
            ),
            activeColor: Colors.orange,
            activeIconColor: Colors.orange.shade600,
            activeTitleColor: Colors.orange.shade700,
          ),
          BottomBarItem(
            icon: isRtl
                ? const Icon(Icons.person, textDirection: TextDirection.rtl)
                : const Icon(Icons.person),
            title: Text(
              AppLocalizations.of(context)!.account,
              textAlign: isRtl ? TextAlign.right : TextAlign.left,
            ),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.greenAccent.shade700,
          ),
        ],
      ),
    );
  }
}
