import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kh_project/constant.dart';
import 'package:kh_project/provider/azkary_provider.dart';
import 'package:kh_project/screen/myazkar/add_azkar.dart';
import 'package:provider/provider.dart';

import '../../clipBoard.dart';

class myAzkarList extends StatefulWidget {
  const myAzkarList({Key? key}) : super(key: key);

  @override
  State<myAzkarList> createState() => _myAzkarListState();
}

class _myAzkarListState extends State<myAzkarList> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AzkaryProvider>(context, listen: false).read();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        centerTitle: true,
        title: Text(
          'أذكاري الخاصة ',
          style: GoogleFonts.amiri(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actionsIconTheme: IconThemeData(color: kWhite),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAkar(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<AzkaryProvider>(
        builder: (context, value, child) {
         if (value.azkary.isNotEmpty) {
            print('we are here');
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Text(value.azkary[index].title),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () => getClipboard(context,
                                  value.azkary[index].title, 'تم نسخ الذكر'),
                              icon: Icon(
                                Icons.copy,
                                color: kPrimary,
                                size: 24,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () => deleteZiker(index),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              physics: const BouncingScrollPhysics(),
              itemCount: value.azkary.length,
            );
          } else {
            return const Text('No Data',style: TextStyle(color: Colors.white),);
          }
        },
      ),
    );
  }
  void deleteZiker(int index) async {
    await Provider.of<AzkaryProvider>(context, listen: false).delete(index);
  }
}
