import 'package:csc_picker/csc_picker.dart';
import 'package:east_bridge/generated/l10n.dart';
import 'package:east_bridge/utility/Colors.dart';
import 'package:east_bridge/utility/TextController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerSearch extends StatefulWidget {
  const CustomerSearch({super.key, TabController? controller});

  @override
  State<CustomerSearch> createState() => _CustomerSearchStat();
}

class _CustomerSearchStat extends State<CustomerSearch> {
  bool isCustomerSearch = false;

  // customer search
  TextEditingController ClientName = new TextEditingController();
  TextEditingController ClientEmail = new TextEditingController();
  TextEditingController CountryName = new TextEditingController();
  TextEditingController StateName = new TextEditingController();
  TextEditingController CityName = new TextEditingController();
  TextEditingController FromDate = new TextEditingController();
  TextEditingController ToDate = new TextEditingController();

  
  String? ClientTypeDropdownvalue;
  String? FundIndustryDropdownvalue;
  String? FundCategoryDropdownvalue;
  String? FundStatusDropdownvalue;

  // List of items in our dropdown menu
  var ClientTypeItem = [
    'Individual',
    'Corporate',
  ];
  var FundIndustryItem = [
    'Banking & Financial Services',
    'Information Technology',
    'Engineering & Capital Goods',
    'Oil & Gas',
    'Pharmaceuticals',
    'Automotive',
    'Chemicals',
    'Utilities',
    'Metals & Mining',
    'Cement & Construction',
    'Miscellaneous',
    'Tobacco',
    'Manufacturing',
    'Telecommunication',
    'Consumer Non-durables',
    'Services',
    'Conglomerates',
    'Retail & Real Estate',
    'Food & Beverages',
    'Media & Entertainment',
    'Consumer Durables',
    'Tourism',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: ColorSelect.tabBorderColor),
              bottom: BorderSide(width: 1, color: ColorSelect.tabBorderColor),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                  // color: isCustomerSearch
                  //     ? ColorSelect.east_blue
                  //     : ColorSelect.east_grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isCustomerSearch ? ColorSelect.east_grey : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isCustomerSearch = !isCustomerSearch;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        size: 25,
                        color: Color(0xFF565252),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).CustomerSearch,
                        style: TextController.BodyHeadingText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isCustomerSearch)
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: ColorSelect.tabBorderColor))),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            // color: ColorSelect.east_blue,
                            padding: EdgeInsets.all(10),
                            child: Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).ClientName,
                                    style: TextController.BodyHeadingText,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: double.infinity,
                                    height: 35,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: ColorSelect.textField)),
                                    child: TextFormField(
                                      controller: ClientName,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextController.BodyHeadingText,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          hintText: S.of(context).TypeHere,
                                          hintStyle: TextController.labelText,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            // color: ColorSelect.east_blue,
                            padding: EdgeInsets.all(10),
                            child: Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).ClientType,
                                    style: TextController.BodyHeadingText,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: double.infinity,
                                    height: 35,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: ColorSelect.textField)),
                                    child: DropdownButton(
                                      hint: Text("Select Here",
                                          style: TextController.labelText),
                                      value: ClientTypeDropdownvalue,
                                      isExpanded: true,
                                      underline: Container(),
                                      iconEnabledColor:
                                          ColorSelect.east_dark_blue,
                                      items: ClientTypeItem.map(
                                        (String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(
                                              items,
                                              style: TextController.BodyText,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (newValue) {
                                        setState(
                                          () {
                                            ClientTypeDropdownvalue = newValue;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            child: Container(
                              width: double.infinity,
                              // color: ColorSelect.east_blue,
                              padding: EdgeInsets.all(10),
                              child: Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).Address,
                                      style: TextController.BodyHeadingText,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 35,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                S.of(context).Country,
                                                style: TextController.BodyText,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: 200,
                                              height: 35,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          ColorSelect.textField)),
                                              child: TextFormField(
                                                controller: CountryName,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: TextController
                                                    .BodyHeadingText,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        S.of(context).TypeHere,
                                                    hintStyle:
                                                        TextController.labelText,
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 35,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                S.of(context).State,
                                                style: TextController.BodyText,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 28,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: 200,
                                              height: 35,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          ColorSelect.textField)),
                                              child: TextFormField(
                                                controller: StateName,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: TextController
                                                    .BodyHeadingText,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        S.of(context).TypeHere,
                                                    hintStyle:
                                                        TextController.labelText,
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 35,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                S.of(context).City,
                                                style: TextController.BodyText,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 35,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: 200,
                                              height: 35,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          ColorSelect.textField)),
                                              child: TextFormField(
                                                controller: CityName,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                style: TextController
                                                    .BodyHeadingText,
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        S.of(context).TypeHere,
                                                    hintStyle:
                                                        TextController.labelText,
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              // color: ColorSelect.east_blue,
                              padding: EdgeInsets.all(10),
                              child: Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).FromDate,
                                      style: TextController.BodyHeadingText,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.infinity,
                                      height: 35,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: ColorSelect.textField)),
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextController.BodyHeadingText,
                                        controller: FromDate,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 15,
                                            ),
                                            isDense: true,
                                            hintText: S.of(context).DateFormat,
                                            hintStyle: TextController.labelText,
                                            border: InputBorder.none),
                                        //readOnly: true,
                                        onTap: () async {
                                          DateTime? datepicked =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(3000));
                                          if (datepicked != null) {
                                            print(
                                                datepicked); //get the picked date in the format => 2022-07-04 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(datepicked!);
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) =>
                                                    setState((FromDate.text =
                                                            formattedDate)
                                                        as VoidCallback));
                                            // format date in required form here we use yyyy-MM-dd that means time is remove
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              // color: ColorSelect.east_blue,
                              padding: EdgeInsets.all(10),
                              child: Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.of(context).ToDate,
                                      style: TextController.BodyHeadingText,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.infinity,
                                      height: 35,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: ColorSelect.textField)),
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        style: TextController.BodyHeadingText,
                                        controller: ToDate,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 15,
                                            ),
                                            isDense: true,
                                            hintText: S.of(context).DateFormat,
                                            hintStyle: TextController.labelText,
                                            border: InputBorder.none),
                                        //readOnly: true,
                                        onTap: () async {
                                          DateTime? datepicked =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(3000));
                                          if (datepicked != null) {
                                            print(
                                                datepicked); //get the picked date in the format => 2022-07-04 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(datepicked!);
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) =>
                                                    setState((ToDate.text =
                                                            formattedDate)
                                                        as VoidCallback));
                                            // format date in required form here we use yyyy-MM-dd that means time is remove
                                          } else {
                                            print("Date is not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        height: 35,
                        width: 140,
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
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
                          onPressed: () {},
                          child: Text(
                            S.of(context).search,
                            style: TextController.btnText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        
      ],
    );
  }
}
