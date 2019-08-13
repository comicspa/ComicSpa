import 'package:url_launcher/url_launcher.dart';


import 'package:first_ui/models/model_preset.dart';


class ManageServiceCenterInfo
{
  static void launchFaqPage() async
  {
    if (await canLaunch(ModelPreset.faqURL)) {
      await launch(ModelPreset.faqURL);
    }
    else {
      throw 'Could not launch ${ModelPreset.faqURL}';
    }
  }

  static void launchPrivacyPolicyPage() async
  {
    if (await canLaunch(ModelPreset.privacyPolicyURL)) {
      await launch(ModelPreset.privacyPolicyURL);
    }
    else {
      throw 'Could not launch ${ModelPreset.privacyPolicyURL}';
    }
  }

  static void launchTermsOfUsePage() async
  {
    if (await canLaunch(ModelPreset.termsOfUseURL)) {
      await launch(ModelPreset.termsOfUseURL);
    }
    else {
      throw 'Could not launch ${ModelPreset.termsOfUseURL}';
    }
  }
}