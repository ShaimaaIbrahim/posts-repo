import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:posts_repo/features/home/views/screens/home_screen.dart';
import 'package:posts_repo/features/settings/views/screens/settings_screen.dart';
import 'package:posts_repo/gen/app_localizations.dart';


class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);

    Widget buildNavItem(int index, IconData icon, String label) {
      final isSelected = currentIndex.value == index;

      return GestureDetector(
        onTap: () => {currentIndex.value = index},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF6C5CE7) : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF6C5CE7) : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
        children: [
          HomeScreen(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: Container(
        height: 70, // Increased height for FAB
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Navigation Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(0, Icons.home_outlined, AppLocalizations.of(context)!.home),
                buildNavItem(1, Icons.settings, AppLocalizations.of(context)!.settings),
              ],
            )
          ],
        ),
      ),
    );
  }

}



