import 'package:el_mango/util/const.dart';
import 'package:el_mango/widgets/radial_transition_overlay.dart';
import 'package:flutter/material.dart';
import '../screens/add.dart';
import '../screens/home.dart';
import '../screens/label.dart';
import '../screens/profile.dart';
import '../screens/notifications.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();

}

final List<GlobalKey> iconKeys = List.generate(5, (_) => GlobalKey());

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;
  Widget? _localRadialEntry;
  double _contentOpacity = 1.0;


  final List<IconData> icons = [
    Icons.home,
    Icons.label,
    Icons.add,
    Icons.notifications,
    Icons.person,
  ];

  final List<Widget> pages = [
    Home(),
    Label(),
    Add(),
    Notifications(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _contentOpacity,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: pages,
            ),
          ),
          if (_localRadialEntry != null) _localRadialEntry!,
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        color: Theme
            .of(context)
            .secondaryHeaderColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTabIcon(0),
                    buildTabIcon(1),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTabIcon(3),
                    buildTabIcon(4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Constants.primary, Constants.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, size: 32),
          onPressed: () => _pageController.jumpToPage(2),
        ),
      ),
    );
  }


  Widget buildTabIcon(int index) {
    final bool isActive = _page == index;

    return Container(
      key: iconKeys[index],
      child: IconButton(
        icon: Icon(icons[index], size: 26),
        color: isActive
            ? Theme
            .of(context)
            .colorScheme
            .secondary
            : Theme
            .of(context)
            .unselectedWidgetColor
            .withValues(alpha: 0.6),
        onPressed: () => animateTabTransition(index),
      ),
    );
  }

  void animateTabTransition(int newPage) {
    if (_page == newPage) return;

    final RenderBox renderBox =
    iconKeys[newPage].currentContext?.findRenderObject() as RenderBox;
    final Offset iconPosition =
    renderBox.localToGlobal(renderBox.size.center(Offset.zero));

    setState(() {
      _contentOpacity = 0.0;
      _localRadialEntry = RadialTransitionOverlay(
        center: iconPosition,
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        onComplete: () {
          setState(() {
            _page = newPage;
            _localRadialEntry = null;
            _contentOpacity = 1.0;
          });
          _pageController.jumpToPage(newPage);
        },
      );
    });
  }
}
