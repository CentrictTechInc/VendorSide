import 'package:mixpanel_flutter/mixpanel_flutter.dart';

class MixpanelManager {
  static Mixpanel? _instance;
  static String projectToken = "6217bbe7df9db92855243aaba5809c04";
  static Future<Mixpanel> initMixpanel() async {
    _instance ??= await Mixpanel.init(projectToken, trackAutomaticEvents: true);
    return _instance!;
  }

  static Mixpanel get instance {
    assert(_instance != null, "Mixpanel must be initialized first");
    return _instance!;
  }
}
