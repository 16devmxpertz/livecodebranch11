import 'dart:convert';

import 'package:east_bridge/Advisory/AdvisoryAgreement/EditAdvisoryAgreement.dart';
import 'package:east_bridge/Advisory/AdvisoryAgreementNew/AgreementGlobal.dart';
import 'package:east_bridge/Advisory/AdvisoryGlobal.dart';
import 'package:east_bridge/Advisory/CustomerGetAdvisoryAgreement.dart';
import 'package:east_bridge/Advisory/CustomerGetAdvisoryAgreementdefault.dart';
import 'package:east_bridge/Global.dart';
import 'package:east_bridge/generated/l10n.dart';
import 'package:east_bridge/utility/Colors.dart';
import 'package:east_bridge/utility/TextController.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdvisorygreementSearch extends StatefulWidget {
  AdvisorygreementSearch({super.key, TabController? controller});

  @override
  State<AdvisorygreementSearch> createState() =>
      _EditAdvisorygreementSearchState();
  static ValueNotifier<int> id = new ValueNotifier(0);
}

class _EditAdvisorygreementSearchState extends State<AdvisorygreementSearch> {
  List title = [];
  String dropdownvalue = 'Item 1';
  List li = [];
  List key = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void getData() async {
    try {
      //Map fetchedData = await fetchData();

      setState(() {
        //title = fetchedData as List ;
      });
    } catch (e) {
      print(e);
    }
  }

  var services = [
    'DPM',
    'Non DPM',
    'Advisory',
    'Arranging',
    'Fund',
  ];

  double yOffset = 0;
  double xOffset = 0;
  bool sidBarOpen = false;
  bool _sidebarVisible = false;

  bool get sidebarVisible => _sidebarVisible;

  Map map = {};

  void toggleSidebar() {
    _sidebarVisible = !_sidebarVisible;
  }

  void setSideBarState() {
    setState(() {
      xOffset = sidBarOpen ? 250 : 0;
    });
  }

  void fetchData() async {
    print("Shah");
    final response = await http.get(Uri.parse(
        '${GlobalPermission.urlLink}/api/ClientAdvisoiryAgreementLink/GetClientAdvisoryAgreementTemplateNames'));

    print(AdvisorygreementSearch.id.value);

    if (response.statusCode == 200) {
      final json = response.body;
      //print(json.decode(response.body));
      var data = jsonDecode(json);
      print(data);
      setState(() {
        for (var i in data) {
          map[i.split("~")[0]] = i.split("~")[1];
        }
        print(map);
      });

      // title=json.decode(response.body);
      li = map.values.toList();
      key = map.keys.toList();
      print(li);
      print("Shah3");
    } else {
      print("ShahError");
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            margin: EdgeInsets.only(
              top: 40,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(height: 20,),
            Row(children: [Text("Service Name: ", style: TextController.InvA,), Text("${GlobalPermissionAdvisory.AdvisoryServiceNameGlobal}", style: TextController.InvA,),]),
            SizedBox(height: 20,),
            Row(children: [Text("Client Name: ", style: TextController.InvA,), Text("${GlobalPermissionAdvisory.clientNameGlobal}", style: TextController.InvA,),]),
            SizedBox(height: 20,),
                  // Container(
                  //   margin: EdgeInsets.symmetric(
                  //     horizontal: 10,
                  //   ),
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     border: Border(
                  //       bottom: BorderSide(
                  //         color: ColorSelect.east_grey,
                  //         width: 1,
                  //       ),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Flexible(
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               S.of(context).TemplateName,
                  //               style: TextController.BodyText,
                  //             ),
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //             Flexible(
                  //               child: Container(
                  //                 padding: EdgeInsets.symmetric(horizontal: 10),
                  //                 width: 280,
                  //                 height: 35,
                  //                 alignment: Alignment.centerLeft,
                  //                 decoration: BoxDecoration(
                  //                     color: Colors.white,
                  //                     border: Border.all(
                  //                         color: ColorSelect.textField)),
                  //                 child: TextFormField(
                  //                   textAlignVertical: TextAlignVertical.center,
                  //                   style: TextController.BodyHeadingText,
                  //                   decoration: InputDecoration(
                  //                       isDense: true,
                  //                       hintText: S.of(context).TypeHere,
                  //                       hintStyle: TextController.labelText,
                  //                       border: InputBorder.none),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorSelect.east_grey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                            height: 35,
                            width: 100,
                            color: ColorSelect.east_blue,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                side: BorderSide(
                                  width: 1.0,
                                  color: Color(0xFFC9BBBB),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        // customerGetAdvisoryAgreement(AdvisorygreementSearch.id.value)));
                                        DefaulAgreementCreation(
                                            // GlobalPermissionAdvisory.AdvisoryIdglobal
                                            )));
                              },
                              child: Text(
                                S.of(context).CreateNew,
                                style: TextController.btnText,
                              ),
                            ),
                          ),
                        ),
                        // Flexible(
                        //   child: Container(
                        //     margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                        //     height: 35,
                        //     width: 100,
                        //     color: ColorSelect.east_blue,
                        //     child: TextButton(
                        //       style: TextButton.styleFrom(
                        //         side: BorderSide(
                        //           width: 1.0,
                        //           color: Color(0xFFC9BBBB),
                        //         ),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(0),
                        //         ),
                        //       ),
                        //       onPressed: () {
                        //         //SearchTemplate();
                        //       },
                        //       child: Text(
                        //         S.of(context).search,
                        //         style: TextController.btnText,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 1000,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Table(
                      border:
                          TableBorder.all(color: ColorSelect.tabBorderColor),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1)
                        // 0: FixedColumnWidth(500),
                        // 1: FixedColumnWidth(500)
                      },
                      children: [
                        TableRow(children: [
                          Container(
                              height: 50,
                              color: ColorSelect.east_grey,
                              child: Center(
                                  child: Text(
                                S.of(context).AgreementId,
                                style: TextController.tableHeading,
                              ))),
                          Container(
                              height: 50,
                              color: ColorSelect.east_grey,
                              child: Center(
                                  child: Text(
                                S.of(context).AgreementName,
                                style: TextController.tableHeading,
                              ))),
                          Container(
                              height: 50,
                              color: ColorSelect.east_grey,
                              child: Center(
                                  child: Text(
                                S.of(context).Edit,
                                style: TextController.tableHeading,
                              ))),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    // height: 800,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: li.length,
                      itemBuilder: (BuildContext context, int index) {
                        return table(li[index], key[index], context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget table(String templateName, String templateKeys, BuildContext context) {
  return SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Container(
            width: 1000,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              border: TableBorder.all(color: ColorSelect.tabBorderColor),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(1)},
              children: [
                TableRow(children: [
                  Container(
                      height: 50,
                      child: Center(
                          child: Text(
                        templateName,
                        style: TextController.BodyText,
                      ))),
                  Container(
                      height: 50,
                      child: Center(
                          child: Text(
                        templateKeys,
                        style: TextController.BodyText,
                      ))),
                  GestureDetector(
                    onTap: () {
                      print(int.parse(templateKeys));
                      EditDefaulAgreementCreation.AdvisoryId.value =
                          int.parse(templateKeys);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              new EditDefaulAgreementCreation()));
                      // customerGetAdvisoryAgreementdefault(
                      //     AdvisorygreementSearch.id.value))
                      //   );
                    },
                    child: Icon(
                      Icons.edit,
                      color: ColorSelect.tabTextColor,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget card(String templateName, String templateKeys, BuildContext context) {
  return SingleChildScrollView(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: Container(
            //height: 80,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorSelect.tabBorderColor, width: 1))),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Container(
              //color: Colors.white,
              //elevation: 5.0,
              margin: EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      templateName,
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      templateKeys,
                      style: TextStyle(
                        fontFamily: 'Gotham',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                customerGetAdvisoryAgreement(templateKeys)));
                        customerGetAdvisoryAgreementdefault.id.value;
                        // customerGetAdvisoryAgreementdefault(
                        //     AdvisorygreementSearch.id.value)));
                      },
                      child: Icon(
                        Icons.edit,
                        color: ColorSelect.tabTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}