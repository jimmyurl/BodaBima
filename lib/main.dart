import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // Add Supabase import
import 'membership_page.dart';
import 'medical_insurance_page.dart';
import 'motor_insurance_page.dart';
import 'home_insurance_page.dart';
import 'travel_insurance_page.dart';
import 'emergency_assistance_page.dart';
import 'profile_page.dart';
import 'l10n/localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co',
    anonKey: 'your-anon-key',
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

    // Initialize Supabase client
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
        primaryColor: const Color.fromARGB(255, 45, 140, 255),
        primarySwatch: Colors.blue,
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
    );
  }
}

class RootPage extends StatefulWidget {
  final void Function(Locale) changeLanguage;
  final Locale selectedLocale;
  final SupabaseClient supabaseClient; // Use SupabaseClient

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

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
  }

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
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
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
