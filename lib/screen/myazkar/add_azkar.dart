import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';
import 'package:kh_project/provider/azkary_provider.dart';
import 'package:provider/provider.dart';

import '../../model/zekery.dart';

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
          TextField(
            controller: titleController,
            cursorColor: Colors.teal,
            cursorRadius: const Radius.circular(15),
            maxLines: 7,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: ()async =>await PerformZeker(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
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
          'الرجاء اضفافة الذكر الذي تريده',
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
    Provider.of<AzkaryProvider>(context,listen: false).create(azkaryModel: azkaryModel);
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
