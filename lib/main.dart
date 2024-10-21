import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart';
import 'membership_page.dart';
import 'medical_insurance_page.dart';
import 'motor_insurance_page.dart';

import 'home_insurance_page.dart';

import 'travel_insurance_page.dart';

import 'emergency_assistance_page.dart';

import 'profile_page.dart';

import 'l10n/localizations.dart';

import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xfihpvkbzppaejluyqoq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmaWhwdmtienBwYWVqbHV5cW9xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg1NDQzMzgsImV4cCI6MjA0NDEyMDMzOH0.U30_ovXdjGrovUZhBeVbeXtX-Xg29BPNZF9mhz7USfM',
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
        primaryColor: const Color(0xFF00BCD4),
        primarySwatch: Colors.cyan,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00BCD4),
          primary: const Color(0xFF00BCD4),
        ),
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
      home: RootPage(
        changeLanguage: _changeLanguage,
        selectedLocale: _selectedLanguageLocale,
        supabaseClient: _supabaseClient,
      ),
    );
  }
}

class RootPage extends StatefulWidget {
  final void Function(Locale) changeLanguage;

  final Locale selectedLocale;

  final SupabaseClient supabaseClient;

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

  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();

    _selectedLanguage = widget.selectedLocale.languageCode;
  }

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
  }

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
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/icons/medical.png',
                    width: 24, height: 24),
                title: Text('Medical Insurance'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicalInsurancePage()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset('assets/icons/motor.png',
                    width: 24, height: 24),
                title: Text('Motor Insurance'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MotorInsurancePage()),
                  );
                },
              ),
              ListTile(
                leading:
                    Image.asset('assets/icons/home.png', width: 24, height: 24),
                title: Text('Home Insurance'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeInsurancePage()),
                  );
                },
              ),
              ListTile(
                leading: Image.asset('assets/icons/travel.png',
                    width: 24, height: 24),
                title: Text('Travel Insurance'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TravelInsurancePage()),
                  );
                },
              ),
            ],
          ),
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
              'assets/icons/emergency.png',
              width: 24,
              height: 24,
              color: currentPage == 1 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/call-us.png',
              width: 24,
              height: 24,
              color: currentPage == 2 ? const Color(0xFF00BCD4) : Colors.grey,
            ),
            label: 'Call Us',
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
        currentIndex: currentPage,
        onTap: _onPageSelected,
        selectedItemColor: const Color(0xFF00BCD4),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return Homepage(
          supabaseClient: widget.supabaseClient,
          changeLanguage: widget.changeLanguage,
          selectedLocale: widget.selectedLocale,
        );
      case 1:
        return EmergencyAssistancePage(
          changeLanguage: widget.changeLanguage,
          selectedLocale: widget.selectedLocale,
          localizations: AppLocalizations.of(context)!,
        );
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
