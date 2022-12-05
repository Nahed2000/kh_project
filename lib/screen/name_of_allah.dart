import 'package:flutter/material.dart';
import 'package:kh_project/constant.dart';

import '../clipBoard.dart';
import '../model/azkar_list.dart';

class AllahNames extends StatelessWidget {
  const AllahNames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            title: Text(
              'أسماء الله الحسنى',
              style: TextStyle(),
            ),
            centerTitle: true,
            backgroundColor: kPrimary,
            elevation: 0,
          ),
          body: GridView.builder(
            padding: EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 140 / 120
            ),
            itemCount: Azkar.namesOfAllah.length,
            itemBuilder: (context, i) {
              String name = Azkar.namesOfAllah[i][0];
              String mean = Azkar.namesOfAllah[i][1];
              return GestureDetector(
                onTap: () => dialog(context, name, mean),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimary,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  dialog(context, name, mean) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
                title: Text(
                  name,
                  style: TextStyle(
                    color: kPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                content: Text(
                  mean,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.right,
                ),
                actions: [
                  TextButton(
                    onPressed: () =>
                        getClipboard(context, mean, 'تم نسخ المعنى'),
                    child: Text(
                      'نسخ',
                      style: TextStyle(
                        color: kPrimary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    // color: Colors.teal,
                    autofocus: true,
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: Text(
                      'إغلاق',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ]));
  }
}
