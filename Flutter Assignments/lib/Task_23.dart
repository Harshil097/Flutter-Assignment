import 'package:flutter/material.dart';

class DrawerNavigationScreen extends StatefulWidget {
  const DrawerNavigationScreen({super.key});

  @override
  State<DrawerNavigationScreen> createState() => _DrawerNavigationScreenState();
}

class _DrawerNavigationScreenState extends State<DrawerNavigationScreen> {

  int selectedIndex = 0;

  // Screens list
  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.pop(context); // drawer close
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Navigation"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => onItemTapped(0),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => onItemTapped(1),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () => onItemTapped(2),
            ),
          ],
        ),
      ),

      body: screens[selectedIndex],
    );
  }
}

// ---------------- Screens ----------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home Screen 🏠",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile Screen 👤",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Settings Screen ⚙️",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}