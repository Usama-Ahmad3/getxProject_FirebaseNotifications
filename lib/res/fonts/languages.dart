import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'pass_hint':'Enter Password',
        'internet_exception': "We're enable to show results\nPlease check your data\nConnection",
          'general_exception':"We're enable to process your request\nPlease try again",
          'welcome': 'Welcome\nBack',
          'login':'LogIn',
          'email': 'Please Enter Email',
          'password':'Please Enter Password',
        },
        'ur_PK': {'email_hint': 'ای میل درج کریں'}
      };
}
