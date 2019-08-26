import 'package:url_launcher/url_launcher.dart';


import 'package:first_ui/models/model_preset.dart';


class ManageServiceCenterInfo
{
  static void launchFaqPage() async
  {
    if (await canLaunch(ModelPreset.faqUrl)) {
      await launch(ModelPreset.faqUrl);
    }
    else {
      throw 'Could not launch ${ModelPreset.faqUrl}';
    }
  }

  static void launchPrivacyPolicyPage() async
  {
    if (await canLaunch(ModelPreset.privacyPolicyUrl)) {
      await launch(ModelPreset.privacyPolicyUrl);
    }
    else {
      throw 'Could not launch ${ModelPreset.privacyPolicyUrl}';
    }
  }

  static void launchTermsOfUsePage() async
  {
    if (await canLaunch(ModelPreset.termsOfUseUrl)) {
      await launch(ModelPreset.termsOfUseUrl);
    }
    else {
      throw 'Could not launch ${ModelPreset.termsOfUseUrl}';
    }
  }
}