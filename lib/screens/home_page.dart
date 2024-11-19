import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bima/l10n/localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  final SupabaseClient supabaseClient;
  final Function(Locale) changeLanguage;
  final Locale selectedLocale;

  const Homepage({
    Key? key,
    required this.supabaseClient,
    required this.changeLanguage,
    required this.selectedLocale,
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> medicalPlans = [];
  List<dynamic> motorPlans = [];
  List<dynamic> homePlans = [];
  List<dynamic> travelPlans = [];
  bool isLoading = true;
  String? errorMessage;
  int _currentCarouselIndex = 0;

  final List<Map<String, String>> insuranceOverviews = [
    {
      'title': 'medical_insurance',
      'icon': 'assets/images/medical.jpg',
      'description': 'medical_insurance_description'
    },
    {
      'title': 'motor_insurance',
      'icon': 'assets/images/car.jpg',
      'description': 'motor_insurance_description'
    },
    {
      'title': 'home_insurance',
      'icon': 'assets/images/home.png',
      'description': 'home_insurance_description'
    },
    {
      'title': 'travel_insurance',
      'icon': 'assets/images/travel.jpg',
      'description': 'travel_insurance_description'
    },
  ];

  @override
  void initState() {
    super.initState();
    fetchInsurancePlans();
  }

  Future<void> fetchInsurancePlans() async {
    try {
      final medicalResponse = await widget.supabaseClient
          .from('medical_insurance')
          .select()
          .limit(10);
      final motorResponse = await widget.supabaseClient
          .from('motor_insurance')
          .select()
          .limit(10);
      final homeResponse =
          await widget.supabaseClient.from('home_insurance').select().limit(10);
      final travelResponse = await widget.supabaseClient
          .from('travel_insurance')
          .select()
          .limit(10);

      setState(() {
        medicalPlans = medicalResponse;
        motorPlans = motorResponse;
        homePlans = homeResponse;
        travelPlans = travelResponse;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = error.toString();
      });
    }
  }

  Widget buildHeroMessage(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.translate('hero_title') ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              localizations?.translate('hero_subtitle') ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
              ),
              child: Text(localizations?.translate('get_started') ?? ''),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInsuranceCarousel(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
          items: insuranceOverviews.map((insurance) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        insurance['icon']!,
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        localizations?.translate(insurance['title']!) ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          localizations?.translate(insurance['description']!) ??
                              '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: insuranceOverviews.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(
                    _currentCarouselIndex == entry.key ? 0.9 : 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : errorMessage != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(localizations?.translate('error_loading') ?? ''),
                    ElevatedButton(
                      onPressed: fetchInsurancePlans,
                      child: Text(localizations?.translate('try_again') ?? ''),
                    ),
                  ],
                ),
              )
            : ListView(
                children: [
                  buildHeroMessage(context),
                  buildInsuranceCarousel(context),
                  buildInsuranceSection(
                      context,
                      localizations?.translate('medical_insurance') ?? '',
                      medicalPlans),
                  buildInsuranceSection(
                      context,
                      localizations?.translate('motor_insurance') ?? '',
                      motorPlans),
                  buildInsuranceSection(
                      context,
                      localizations?.translate('home_insurance') ?? '',
                      homePlans),
                  buildInsuranceSection(
                      context,
                      localizations?.translate('travel_insurance') ?? '',
                      travelPlans),
                ],
              );
  }

  Widget buildInsuranceSection(
      BuildContext context, String title, List<dynamic> plans) {
    final localizations = AppLocalizations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(localizations
                    ?.translate('plans_available')
                    ?.replaceAll('{count}', plans.length.toString()) ??
                ''),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: plans.length,
            itemBuilder: (context, index) {
              final plan = plans[index];
              return ListTile(
                title: Text(plan['plan_name'] ?? ''),
                subtitle: Text(plan['description'] ??
                    localizations?.translate('no_description') ??
                    ''),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '${localizations?.translate('insurance_plan_coverage')}: ${plan['coverage_amount'] ?? ''}'),
                    Text(
                        '${localizations?.translate('insurance_plan_premium')}: ${plan['monthly_premium'] ?? ''}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
