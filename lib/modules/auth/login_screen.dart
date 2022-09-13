import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/database/controllers/user_db_controller.dart';
import 'package:hakathon_elancer/models/process_response.dart';
import 'package:hakathon_elancer/prefs/shared_pref_controller.dart';
import 'package:hakathon_elancer/utils/colors.dart';
import 'package:hakathon_elancer/utils/context_extenssion.dart';
import 'package:hakathon_elancer/widgets/custom_button.dart';
import 'package:hakathon_elancer/widgets/custom_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true;
  late String _language;

  @override
  void initState() {
    super.initState();
    _language =
        SharedPrefController().getValueFor(PrefKeys.language.name) ?? 'en';
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('تسجيل دخول',
            style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(
                image: AssetImage('images/logo.png'),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Text('البريد الالكتروني',
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            AppTextField(
              hint: 'البريد',
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Text('كلمة المرور',
                  style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            AppTextField(
              hint: 'كلمة المرور',
              obscureText: _obscure,
              keyboardType: TextInputType.text,
              controller: _passwordTextController,
              suffix: IconButton(
                onPressed: () {
                  setState(() => _obscure = !_obscure);
                },
                icon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
                onPress: () {}, text: 'تسجيل الدخول', color: primaryColor),
            // ElevatedButton(
            //   onPressed: () {},
            //   //  _performLogin(),
            //   style: ElevatedButton.styleFrom(
            //       minimumSize: const Size(double.infinity, 50),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(5))),
            //   child: Text(
            //     'تسجيل الدخول',
            //     style: GoogleFonts.cairo(),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ليس لديك حساب ؟',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/register_screen'),
                  child: Text('أنشئ حساب',
                      style: GoogleFonts.cairo(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: primaryColor)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
