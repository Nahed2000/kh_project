import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';
import 'package:kh_project/provider/azkary_provider.dart';
import 'package:provider/provider.dart';

import '../../model/zekery.dart';
import '../../provider/theme_provider.dart';

class AddAkar extends StatefulWidget {
  const AddAkar({Key? key, this.azkaryModel}) : super(key: key);

  final AzkaryModel? azkaryModel;

  @override
  State<AddAkar> createState() => _AddAkarState();
}

class _AddAkarState extends State<AddAkar> {
  late TextEditingController titleController;

  @override
  void initState() {
    // TODO: implement initState
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: BackButton(
          color: kPrimary,
        ),
        centerTitle: true,
        title: Text(
          'دعاء جديد ',
          style: GoogleFonts.amiri(
            color: kWhite,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: TextField(
              controller: titleController,
              cursorColor: Colors.teal,
              cursorRadius: const Radius.circular(15),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'اضف ذكر',
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1)),
                  hintStyle: GoogleFonts.amiri(fontSize: 22)),
              maxLines: 7,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await PerformZeker();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Text(
              'أضف ذكر ',
              style: GoogleFonts.amiri(
                color: Colors.teal,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> PerformZeker() async {
    if (checkData()) {
      await createZeker();
    }
  }

  bool checkData() {
    if (titleController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'الرجاء اضافة الذكر الذي تريده',
          style: GoogleFonts.amiri(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  Future<void> createZeker() async {
    Provider.of<AzkaryProvider>(context, listen: false)
        .create(azkaryModel: azkaryModel);
    Navigator.pop(context);
  }

  AzkaryModel get azkaryModel {
    AzkaryModel azkaryModel = AzkaryModel();
    azkaryModel.title = titleController.text;
    return azkaryModel;
  }

  void clear() {
    titleController.text = '';
  }
}
