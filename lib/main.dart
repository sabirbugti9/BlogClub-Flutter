import 'package:blogclub/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'article.dart';
import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defultFontFamily = 'Avenir';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
        ),
        snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          surface: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStateProperty.all(const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: defultFontFamily,
        )))),
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
              fontFamily: defultFontFamily,
              fontWeight: FontWeight.w200,
              color: secondaryTextColor,
              fontSize: 18),
          titleSmall: TextStyle(
              fontFamily: defultFontFamily,
              fontWeight: FontWeight.w400,
              color: primaryTextColor,
              fontSize: 14),
          titleLarge: TextStyle(
              fontFamily: defultFontFamily,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 18),
          headlineMedium: TextStyle(
              fontFamily: defultFontFamily,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 24),
          headlineSmall: TextStyle(
              fontFamily: defultFontFamily,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 20),
          bodyLarge: TextStyle(
              fontFamily: defultFontFamily,
              color: primaryTextColor,
              fontSize: 14),
          bodyMedium: TextStyle(
              fontFamily: defultFontFamily,
              color: secondaryTextColor,
              fontSize: 12),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeindex = 0;
const int articleindex = 1;
const int searchindex = 2;
const int menuindex = 3;
const double bottomNavigationHeigt = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = homeindex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeindex: _homeKey,
    articleindex: _articleKey,
    searchindex: _searchKey,
    menuindex: _menuKey,
  };

  Future<bool> _onWillpop() async {
    final NavigatorState curentSelectedNavigatorState =
        map[selectedTabIndex]!.currentState!;

    if (curentSelectedNavigatorState.canPop()) {
      curentSelectedNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedTabIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillpop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeigt,
              child: IndexedStack(
                index: selectedTabIndex,
                children: [
                  _navigator(_homeKey, homeindex, const HomeScreen()),
                  _navigator(_articleKey, articleindex, const ArticleScreen()),
                  _navigator(_searchKey, searchindex, const SearchScreen()),
                  _navigator(_menuKey, menuindex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNavigattion(
                onTab: (int index) {
                  setState(() {
                    _history.remove(selectedTabIndex);
                    _history.add(selectedTabIndex);
                    selectedTabIndex = index;
                  });
                },
                selextedIndex: selectedTabIndex,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedTabIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) =>
                  Offstage(offstage: selectedTabIndex != index, child: child),
            ),
          );
  }
}

int screenNumber = 1;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Screen #$screenNumber'),
          ),
          ElevatedButton(
              onPressed: () {
                screenNumber++;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ));
              },
              child: const Text('click'))
        ],
      ),
    );
  }
}

///////////////////////////////
class _BottomNavigattion extends StatelessWidget {
  final Function(int index) onTab;
  final selextedIndex;
  const _BottomNavigattion(
      {super.key, required this.onTab, required this.selextedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9B8487).withOpacity(0.3),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeiconFileName: 'Home.png',
                    titel: 'Home',
                    onTap: () {
                      onTab(homeindex);
                    },
                    isActive: selextedIndex == homeindex,
                  ),
                  BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeiconFileName: 'Articles.png',
                      onTap: () {
                        onTab(articleindex);
                      },
                      isActive: selextedIndex == articleindex,
                      titel: 'Article'),
                  Expanded(
                    child: Container(),
                  ),
                  BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeiconFileName: 'Search.png',
                      onTap: () {
                        onTab(searchindex);
                      },
                      isActive: selextedIndex == searchindex,
                      titel: 'Serarch'),
                  BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeiconFileName: 'Menu.png',
                      onTap: () {
                        onTab(menuindex);
                      },
                      isActive: selextedIndex == menuindex,
                      titel: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: bottomNavigationHeigt,
                decoration: BoxDecoration(
                    color: const Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeiconFileName;
  final String titel;
  final Function() onTap;
  final bool isActive;
  const BottomNavigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeiconFileName,
      required this.titel,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/$iconFileName',
              color: isActive
                  ? themeData.colorScheme.primary
                  : themeData.textTheme.bodySmall!.color,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              titel,
              style: themeData.textTheme.bodySmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.bodySmall!.color),
            ),
          ],
        ),
      ),
    );
  }
}
