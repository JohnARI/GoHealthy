import 'package:lottie/lottie.dart';

class LottieAnim {
  static LottieBuilder ForgotPassword(double width, double height) {
    return Lottie.asset('assets/images/login_anim.json',
        width: width, height: height);
  }

  static LottieBuilder LoginOrRegister(double width, double height) {
    return Lottie.asset('assets/images/forgot_password.json',
        width: width, height: height);
  }
}
