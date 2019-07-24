

import 'package:url_launcher/url_launcher.dart';


import 'package:first_ui/models/preset.dart';


class ServiceCenterInfo
{

  static String get version => Preset.version;


  static void launchFaqPage() async
  {
    if (await canLaunch(Preset.faqURL)) {
      await launch(Preset.faqURL);
    }
    else {
      throw 'Could not launch ${Preset.faqURL}';
    }
  }

  static void launchPrivacyPolicyPage() async
  {
    if (await canLaunch(Preset.privacyPolicyURL)) {
      await launch(Preset.privacyPolicyURL);
    }
    else {
      throw 'Could not launch ${Preset.privacyPolicyURL}';
    }
  }

  static void launchTermsOfUsePage() async
  {
    if (await canLaunch(Preset.termsOfUseURL)) {
      await launch(Preset.termsOfUseURL);
    }
    else {
      throw 'Could not launch ${Preset.termsOfUseURL}';
    }
  }


}