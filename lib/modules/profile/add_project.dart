import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/utils/colors.dart';
import 'package:hakathon_elancer/widgets/custom_button.dart';
import 'package:hakathon_elancer/widgets/custom_text_feild.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({Key? key}) : super(key: key);

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  late TextEditingController _nameTextController;
  late TextEditingController _detailsTextController;
  late TextEditingController _imageTextController;
  late TextEditingController _linkedTextController;

  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _detailsTextController = TextEditingController();
    _imageTextController = TextEditingController();
    _linkedTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _detailsTextController.dispose();
    _imageTextController.dispose();
    _linkedTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('اضافة عمل',
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
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('عنوان العمل',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'اضف عنوان العمل',
                keyboardType: TextInputType.emailAddress,
                controller: _nameTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('تفاصيل العمل',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'اضف تفاصيل العمل',
                keyboardType: TextInputType.emailAddress,
                controller: _detailsTextController,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('رابط العمل',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'اضف رابط العمل',
                obscureText: _obscure,
                keyboardType: TextInputType.text,
                controller: _imageTextController,
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
                child: Text('صورة العمل',
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              AppTextField(
                hint: 'اضف صورة العمل',
                keyboardType: TextInputType.emailAddress,
                controller: _linkedTextController,
                suffix: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.upload),
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              CustomButton(onPress: () {}, text: 'اضافة', color: primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
