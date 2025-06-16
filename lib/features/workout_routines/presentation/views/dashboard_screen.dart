import 'package:flutter/material.dart';
import 'package:open_workout/features/workout_routines/presentation/views/workouts_screen.dart';
import 'package:open_workout/generated/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const Center(child: Text('Home Dashboard (Coming Soon)')),

      WorkoutsScreen(),

      const Center(child: Text('Calendar View (Coming Soon)')),

      const Center(child: Text('Profile Settings (Coming Soon)')),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final String appBarTitle;
    switch (_selectedIndex) {
      case 0:
        appBarTitle = localizations.appTitle;
        break;
      case 1:
        appBarTitle = 'Workouts';
        break;
      case 2:
        appBarTitle = 'Calendar';
        break;
      case 3:
        appBarTitle = 'Profile';
        break;
      default:
        appBarTitle = localizations.appTitle;
    }

    return Scaffold(
      backgroundColor: Color(0xffFCFCF7),
      appBar: AppBar(
        backgroundColor: Color(0xffFCFCF7),
        title: Text(appBarTitle),
        actions: [
          if (_selectedIndex == 1)
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: localizations.addRoutineButton,
              onPressed: () {},
            ),
        ],
      ),
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFCFCF7),
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff1C1C0D),
        unselectedItemColor: Color(0xff9E9E47),

        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
