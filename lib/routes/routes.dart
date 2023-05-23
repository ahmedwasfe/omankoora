

import 'package:amankoora/ui/auth/login_screen.dart';
import 'package:amankoora/ui/auth/verification_screen.dart';
import 'package:amankoora/ui/reservation/add_reservation_screen.dart';
import 'package:amankoora/ui/search/search_screen.dart';
import 'package:amankoora/ui/team/player_screen.dart';
import 'package:amankoora/ui/home/home_screen.dart';
import 'package:amankoora/ui/matches/match_screen.dart';
import 'package:amankoora/ui/matches/matches_screen.dart';
import 'package:amankoora/ui/news_details/news_details_screen.dart';
import 'package:amankoora/ui/settings/about_us_screen.dart';
import 'package:amankoora/ui/settings/contact_us_screen.dart';
import 'package:amankoora/ui/settings/privacy_policy_screen.dart';
import 'package:amankoora/ui/splash_screen.dart';
import 'package:amankoora/ui/stadium/stadium_screen.dart';
import 'package:amankoora/ui/team/team_screen.dart';
import 'package:amankoora/ui/team/teams_screen.dart';
import 'package:get/get.dart';

class AppRoutes {

  static final routesPages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.teams, page: () => TeamsScreen()),
    GetPage(name: Routes.team, page: () => TeamScreen()),
    GetPage(name: Routes.newsDetails, page: () => NewsDetailsScreen()),
    GetPage(name: Routes.matches, page: () => MatchesScreen()),
    GetPage(name: Routes.match, page: () => MatchScreen()),
    GetPage(name: Routes.player, page: () => PlayerScreen()),
    GetPage(name: Routes.stadium, page: () => StadiumScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.verification, page: () => VerificationScreen()),
    GetPage(name: Routes.addReservation, page: () => AddReservationScreen()),
    GetPage(name: Routes.search, page: () => SearchScreen()),
    GetPage(name: Routes.contactUs, page: () => ContactUsScreen()),
    GetPage(name: Routes.aboutUs, page: () => AboutUsScreen()),
    GetPage(name: Routes.privacyPolicy, page: () => PrivacyPolicyScreen()),
  ];

}

class Routes{
  static const splash = '/splash';
  static const home = '/home';
  static const teams = '/teams';
  static const team = '/team';
  static const newsDetails = '/news_details';
  static const matches = '/matches';
  static const match = '/match';
  static const player = '/player';
  static const stadium = '/stadium';
  static const login = '/login';
  static const verification = '/verification';
  static const addReservation = '/add_reservation';
  static const search = '/search';
  static const contactUs = '/contact_us';
  static const aboutUs = '/about_us';
  static const privacyPolicy = '/privacy_policy';
}