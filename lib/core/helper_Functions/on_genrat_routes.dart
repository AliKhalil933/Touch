import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/Widget_SizeSelectionPage.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Address_AddPage.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Address_Home.dart';
import 'package:flutter_project/feathuer/AddressHomePage/presentation/views/Page_Map_View.dart';
import 'package:flutter_project/feathuer/Cart/presentation/views/Cart_Page_view.dart';
import 'package:flutter_project/feathuer/Chat/Designer_Chat.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Category_page_View.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Designer_List_View_Every.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Prodect_List_Evrey.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/Profile_Designer_page_view.dart';
import 'package:flutter_project/feathuer/Home/presentation/views/StoryListVieyEvery.dart';
import 'package:flutter_project/feathuer/NavigationBar/presentation/views/Custom_Navigation_Bar.dart';
import 'package:flutter_project/feathuer/OTP/presentation/views/Otp_view.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/Payment_Page_View.dart';
import 'package:flutter_project/feathuer/Payment/presentation/views/SuccessOrder_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/%D9%90About_US_pageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Complaints_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/ContactUsPage.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Developer_Info_Page.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/FAQ_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Favorites_PageView.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Privacy_Policy.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Setting_Of_Setting.dart';
import 'package:flutter_project/feathuer/Setting/presentation/views/Setting_Page_view.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Address_Privet_Order.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Terms_And_Conditions.dart';
import 'package:flutter_project/feathuer/TearmsAndConditions/presentation/views/Terms_And_Conditions2.dart';
import 'package:flutter_project/feathuer/TrackingPage/presentation/views/Tracking_PageView.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/SigunUp_View.dart';
import 'package:flutter_project/feathuer/auth/presentation/views/login_View.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Keds_Colthes.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Men_Colthes.dart';
import 'package:flutter_project/feathuer/category/presentation/views/Women_Colthes.dart';
import 'package:flutter_project/feathuer/onBording/presentation/views/onbording.dart';
import 'package:flutter_project/feathuer/splash/presentation/views/splash.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ContactUsPage.routeName:
      return MaterialPageRoute(builder: (context) => const ContactUsPage());
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBordingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBordingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case OtpPageView.routeName:
      return MaterialPageRoute(builder: (context) => const OtpPageView());

    case CustomNavigationBar.routeName:
      return MaterialPageRoute(
          builder: (context) => const CustomNavigationBar());

    case MenColthes.routeName:
      return MaterialPageRoute(builder: (context) => const MenColthes());

    case WomenColthes.routeName:
      return MaterialPageRoute(builder: (context) => const WomenColthes());
    case KidsColthes.routeName:
      return MaterialPageRoute(builder: (context) => const KidsColthes());

    case DesignerPageView.routeName:
      return MaterialPageRoute(builder: (context) => const DesignerPageView());

    case CategoryPageView.routeName:
      return MaterialPageRoute(builder: (context) => const CategoryPageView());

    case SizeSelectionPage.routeName:
      return MaterialPageRoute(builder: (context) => SizeSelectionPage());

    case SettingPageView.routeName:
      return MaterialPageRoute(builder: (context) => const SettingPageView());

    case CartPageview.routeName:
      return MaterialPageRoute(builder: (context) => CartPageview());

    case AddressPageView.routeName:
      return MaterialPageRoute(builder: (context) => const AddressPageView());
    case AddressAddPageView.routeName:
      return MaterialPageRoute(
          builder: (context) => const AddressAddPageView());

    case PageMapView.routeName:
      return MaterialPageRoute(
          builder: (context) => PageMapView(
                onSelectLocation: (LatLng) {},
              ));

    case PaymentPageView.routeName:
      return MaterialPageRoute(builder: (context) => const PaymentPageView());

    case TrackingPageView.routeName:
      return MaterialPageRoute(builder: (context) => const TrackingPageView());

    case SuccessorderPageview.routeName:
      return MaterialPageRoute(
          builder: (context) => const SuccessorderPageview());
    case StoriesListView.routeName:
      return MaterialPageRoute(builder: (context) => const StoriesListView());
    case TermsAndCondistionsPageView.routeName:
      return MaterialPageRoute(
          builder: (context) => const TermsAndCondistionsPageView());
    case AddressPagePrivetOrder.routeName:
      return MaterialPageRoute(
          builder: (context) => const AddressPagePrivetOrder());
    case ProductListPageEvrey.routeName:
      return MaterialPageRoute(builder: (context) => ProductListPageEvrey());
    case DesignersListViewEvery.routeName:
      return MaterialPageRoute(builder: (context) => DesignersListViewEvery());
    case DesignerchatPage.routeName:
      return MaterialPageRoute(builder: (context) => const DesignerchatPage());

    case TermsAndConditions2.routeName:
      return MaterialPageRoute(
          builder: (context) => const TermsAndConditions2());
    case ComplaintsPageview.routeName:
      return MaterialPageRoute(
          builder: (context) => const ComplaintsPageview());

    case FaqPageview.routeName:
      return MaterialPageRoute(builder: (context) => const FaqPageview());
    case FavoritesPageview.routeName:
      return MaterialPageRoute(builder: (context) => const FavoritesPageview());
    case AboutUsViewPage.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUsViewPage());

    case PrivacyPolicy.routeName:
      return MaterialPageRoute(builder: (context) => const PrivacyPolicy());
    case DeveloperInfoPage.routeName:
      return MaterialPageRoute(builder: (context) => const DeveloperInfoPage());
    case SettingOfSetting.routeName:
      return MaterialPageRoute(builder: (context) => const SettingOfSetting());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
