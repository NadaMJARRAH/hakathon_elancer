import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/database/controllers/user_db_controller.dart';
import 'package:hakathon_elancer/models/process_response.dart';
import 'package:hakathon_elancer/models/skill.dart';
import 'package:hakathon_elancer/models/user.dart';
import 'package:hakathon_elancer/utils/colors.dart';
import 'package:hakathon_elancer/utils/context_extenssion.dart';
import 'package:hakathon_elancer/widgets/custom_button.dart';
import 'package:hakathon_elancer/widgets/custom_text_feild.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  bool _obscure = true;
  int? _selectedSkillId;

  late ImagePicker _imagePicker;
  XFile? _pickedImage;

  final List<Skill> _skills = <Skill>[
    const Skill(id: 1, title: 'مصمم جرافيك'),
    const Skill(id: 2, title: 'مبرمج ويب'),
    const Skill(id: 3, title: 'مبرمج موبايل'),
    const Skill(id: 4, title: 'مصمم UX/UI'),
  ];

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _imagePicker = ImagePicker();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
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
        title: Text('انشاء حساب',
            style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    ClipOval(
                        child: _imagePicker == null
                            ? const Image(
                                image: AssetImage('images/freelancer.png'),
                              )
                            : Image.file(File(_pickedImage!.path))
                        // Image(
                        //     image: NetworkImage(
                        //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4rsSzLimlQyniEtUV4-1raljzFhS45QBeAw&usqp=CAU'),
                        //     fit: BoxFit.cover,
                        //     width: 120,
                        //     height: 120,
                        //   )

                        ),
                    ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        color: Colors.white,
                        child: ClipOval(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: primaryColor,
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('الاسم كاملا',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'الاسم',
                keyboardType: TextInputType.emailAddress,
                controller: _emailTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('البريد الالكتروني',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'البريد الالكتروني',
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
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رقم الجوال',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'رقم الجوال',
                keyboardType: TextInputType.emailAddress,
                controller: _emailTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('الجنس',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('الجنس',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print('Tapped');
                  },
                  dropdownColor: textFieldBackground,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('المهارة',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('اختر مهارة',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print('Tapped');
                  },
                  dropdownColor: textFieldBackground,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('مستوى الخبرة',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBackground,
                    border: Border.all(color: const Color(0xFFDFDEDE))),
                child: DropdownButton<int>(
                  isExpanded: true,
                  hint: Text('مستوى الخبرة',
                      style: GoogleFonts.cairo(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFCCCCCC))),
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                  ),
                  onChanged: (int? value) {
                    setState(() => _selectedSkillId = value);
                  },
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    print('Tapped');
                  },
                  dropdownColor: textFieldBackground,
                  icon: const Icon(Icons.keyboard_arrow_down_sharp),
                  itemHeight: 48,
                  value: _selectedSkillId,
                  underline:
                      const Divider(color: Colors.transparent, height: 0),
                  items: _skills.map(
                    (skill) {
                      return DropdownMenuItem<int>(
                        value: skill.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(skill.title),
                            // Divider(
                            //   thickness: 0.8,
                            //   color: Colors.grey.shade400,
                            // )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                  onPress: () {}, text: 'انشاء حساب', color: primaryColor)
              // ElevatedButton(
              //   onPressed: () {},
              //   // _performRegister(),
              //   style: ElevatedButton.styleFrom(
              //       minimumSize: const Size(double.infinity, 50),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5))),
              //   child: Text(
              //     'انشاء حساب',
              //     style: GoogleFonts.cairo(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // void _performRegister() async {
  //   if (_checkData()) {
  //     await _register();
  //   }
  // }

  // bool _checkData() {
  //   if (_nameTextController.text.isNotEmpty &&
  //       _emailTextController.text.isNotEmpty &&
  //       _passwordTextController.text.isNotEmpty) {
  //     return true;
  //   }
  //   context.showSnackBar(message: 'Enter required data', error: true);
  //   return false;
  // }

  // Future<void> _register() async {
  //   ProcessResponse processResponse =
  //       await UserDbController().register(user: user);
  //   if (processResponse.success) {
  //     Navigator.pop(context);
  //   }
  //   context.showSnackBar(
  //     message: processResponse.message,
  //     error: !processResponse.success,
  //   );
  // }

  // User get user {
  //   User user = User();
  //   user.name = _nameTextController.text;
  //   user.email = _emailTextController.text;
  //   user.password = _passwordTextController.text;
  //   return user;
  // }
}
