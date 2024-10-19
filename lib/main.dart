import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart'; // Ensure this file is correctly imported
=======
import 'package:supabase_flutter/supabase_flutter.dart'; // Add Supabase import
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
import 'membership_page.dart';
import 'medical_insurance_page.dart';
import 'motor_insurance_page.dart';
import 'home_insurance_page.dart';
import 'travel_insurance_page.dart';
import 'emergency_assistance_page.dart';
import 'profile_page.dart';
<<<<<<< HEAD
import 'l10n/localizations.dart'; // Custom localization
import 'package:google_fonts/google_fonts.dart';
=======
import 'l10n/localizations.dart';
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

<<<<<<< HEAD
  await Supabase.initialize(
    url: 'https://xfihpvkbzppaejluyqoq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaWhwdmtienBwYWVqbHV5cW9xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg1NDQzMzgsImV4cCI6MjA0NDEyMDMzOH0.U30_ovXdjGrovUZhBeVbeXtX-Xg29BPNZF9mhz7USfM',
=======
  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co',
    anonKey: 'your-anon-key',
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _selectedLanguageLocale = const Locale('en', 'US');
  late SupabaseClient _supabaseClient;

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
=======

    // Initialize Supabase client
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
    _supabaseClient = Supabase.instance.client;
  }

  void _changeLanguage(Locale newLocale) {
    setState(() {
      _selectedLanguageLocale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
<<<<<<< HEAD
        primaryColor: const Color(0xFF00BCD4),
        primarySwatch: Colors.cyan,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00BCD4),
          primary: const Color(0xFF00BCD4),
        ),
=======
        primaryColor: const Color.fromARGB(255, 45, 140, 255),
        primarySwatch: Colors.blue,
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('sw', 'TZ'),
      ],
      locale: _selectedLanguageLocale,
<<<<<<< HEAD
      home: RootPage(
        changeLanguage: _changeLanguage,
        selectedLocale: _selectedLanguageLocale,
        supabaseClient: _supabaseClient,
      ),
=======
      initialRoute: '/',
      routes: {
        '/': (context) => RootPage(
              changeLanguage: _changeLanguage,
              selectedLocale: _selectedLanguageLocale,
              supabaseClient: _supabaseClient, // Pass Supabase client
            ),
        '/home': (context) => HomePage(
              changeLanguage: _changeLanguage,
              selectedLocale: _selectedLanguageLocale,
              supabaseClient: _supabaseClient,
            ),
        '/emergency_assistance': (context) => EmergencyAssistancePage(
              changeLanguage: _changeLanguage,
              selectedLocale: _selectedLanguageLocale,
              localizations: AppLocalizations.of(context)!,
            ),
        '/call_us': (context) => MembershipPage(
              changeLanguage: _changeLanguage,
              localizations: AppLocalizations.of(context)!,
              selectedLocale: _selectedLanguageLocale,
            ),
        '/profile': (context) => ProfilePage(
              changeLanguage: _changeLanguage,
              localizations: AppLocalizations.of(context)!,
              selectedLocale: _selectedLanguageLocale,
              supabaseClient: _supabaseClient, // Pass Supabase client
            ),
        '/medical_insurance': (context) => const MedicalInsurancePage(),
        '/motor_insurance': (context) => const MotorInsurancePage(),
        '/home_insurance': (context) => const HomeInsurancePage(),
        '/travel_insurance': (context) => const TravelInsurancePage(),
      },
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale?.languageCode == locale.languageCode &&
              deviceLocale?.countryCode == locale.countryCode) {
            return deviceLocale;
          }
        }
        return null;
      },
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
    );
  }
}

class RootPage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final Locale selectedLocale;
<<<<<<< HEAD
  final SupabaseClient supabaseClient;
=======
  final SupabaseClient supabaseClient; // Use SupabaseClient
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b

  const RootPage({
    Key? key,
    required this.changeLanguage,
    required this.selectedLocale,
    required this.supabaseClient,
  }) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
<<<<<<< HEAD
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.selectedLocale.languageCode;
  }
=======
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
  }

<<<<<<< HEAD
  void _onLanguageChanged(String languageCode) {
    widget.changeLanguage(Locale(languageCode));
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  Widget _buildLanguageSwitcher() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildLanguageOption('ENG', 'en'),
          const SizedBox(width: 6),
          _buildLanguageOption('SW', 'sw'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String display, String langCode) {
    bool isSelected = langCode == _selectedLanguage;

    return GestureDetector(
      onTap: () => _onLanguageChanged(langCode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00BCD4) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          display,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : const Color(0xFF00BCD4),
          ),
        ),
      ),
    );
  }

  void _showInsuranceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Image.asset('assets/icons/medical.png',
                  width: 24, height: 24),
              title: const Text('Medical Insurance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MedicalInsurancePage()),
                );
              },
            ),
            ListTile(
              leading:
                  Image.asset('assets/icons/motor.png', width: 24, height: 24),
              title: const Text('Motor Insurance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MotorInsurancePage()),
                );
              },
            ),
            ListTile(
              leading:
                  Image.asset('assets/icons/home.png', width: 24, height: 24),
              title: const Text('Home Insurance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeInsurancePage()),
                );
              },
            ),
            ListTile(
              leading:
                  Image.asset('assets/icons/travel.png', width: 24, height: 24),
              title: const Text('Travel Insurance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TravelInsurancePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BCD4),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 2,
              child: Image.asset(
                'assets/icons/logo.png',
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            Flexible(
              flex: 3,
              child: _buildLanguageSwitcher(),
            ),
          ],
        ),
      ),
      body: _getPage(currentPage),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInsuranceOptions,
        backgroundColor: const Color(0xFF00BCD4),
        child: Image.asset(
          'assets/icons/logo.png',
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              width: 24,
              height: 24,
              color: currentPage == 0 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ambulance.png',
              width: 24,
              height: 24,
              color: currentPage == 1 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/membership.png',
              width: 24,
              height: 24,
              color: currentPage == 2 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Membership',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 24,
              height: 24,
              color: currentPage == 3 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        onTap: _onPageSelected,
        currentIndex: currentPage,
        selectedItemColor: const Color(0xFF00BCD4),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(currentPage),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        backgroundColor: const Color.fromARGB(255, 48, 45, 255),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Emergency Assistance'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership_rounded), label: 'Call Us'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: currentPage,
        onTap: _onPageSelected,
        selectedItemColor: const Color.fromARGB(255, 48, 45, 255),
        unselectedItemColor: Colors.grey,
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
<<<<<<< HEAD
        return Homepage(
          supabaseClient: widget.supabaseClient,
          changeLanguage: widget.changeLanguage,
          selectedLocale: widget.selectedLocale,
        );
=======
        return HomePage(
          changeLanguage: widget.changeLanguage,
          selectedLocale: widget.selectedLocale,
          supabaseClient: widget.supabaseClient,
        );
      case 1:
        return EmergencyAssistancePage(
            changeLanguage: widget.changeLanguage,
            selectedLocale: widget.selectedLocale,
            localizations: AppLocalizations.of(context)!);
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
      case 2:
        return MembershipPage(
          changeLanguage: widget.changeLanguage,
          localizations: AppLocalizations.of(context)!,
          selectedLocale: widget.selectedLocale,
        );
      case 3:
        return ProfilePage(
          changeLanguage: widget.changeLanguage,
          localizations: AppLocalizations.of(context)!,
          selectedLocale: widget.selectedLocale,
          supabaseClient: widget.supabaseClient,
        );
      default:
        return Container();
    }
  }
}
<<<<<<< HEAD
=======

class HomePage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final Locale selectedLocale;
  final SupabaseClient supabaseClient;

  const HomePage({
    Key? key,
    required this.changeLanguage,
    required this.selectedLocale,
    required this.supabaseClient,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'en'; // Default language is English ('en')

  void _onLanguageChanged(String selectedLanguage) {
    widget.changeLanguage(Locale(selectedLanguage));
    setState(() {
      _selectedLanguage = selectedLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 45, 255),
        title: Text(localizations.translate('app_title')!),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    _onLanguageChanged('en');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedLanguage == 'en'
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'EN',
                      style: TextStyle(
                        color: _selectedLanguage == 'en'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    _onLanguageChanged('sw');
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _selectedLanguage == 'sw'
                          ? const Color.fromARGB(255, 48, 45, 255)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'SW',
                      style: TextStyle(
                        color: _selectedLanguage == 'sw'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your Supabase-driven content here.
          ],
        ),
      ),
    );
  }
}
>>>>>>> 0097b14add9085455e321c434cb17c149eae833b
