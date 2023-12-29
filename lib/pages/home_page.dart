import 'package:flutter/material.dart';
import 'package:lastfirebase/function/add_data/add_RQ35K.dart';
import 'package:lastfirebase/function/retrieve_data/getData.dart';
import 'package:lastfirebase/pages/login_screen.dart';
import 'package:lastfirebase/src/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController searchController = TextEditingController();
  String email = '';

  @override
  initState()  {
    getData();
    // TODO: implement initState
    super.initState();
    getEmail();
  }
  getData() async {
    listRQ35K = await getDataRQ35K();
  }


  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }



  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: itemColor),
        backgroundColor: appBarColor,
        title: Row(
          children: [
            Text(
              "Project Manager",
              style: TextStyle(
                  color: itemColor, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // Search box
            Expanded(
              child: Container(
                height: 35,
                child: TextField(
                  style: TextStyle(color: itemColor),
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      // Here is for searchBox function...
                    });
                  },
                  // Decoration searchBox
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(bottom: 4.0),
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w100),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                      size: 17,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Pallete.hexocyan,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Pallete.hexocyan,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Sort button
            IconButton(
                onPressed: () {
                  // Here is for filter function...
                  logOut(context);
                },
                icon: const Icon(Icons.sort),
                color: itemColor)
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: resItemColor,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 65,
              child: DrawerHeader(
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: itemColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                color: _selectedIndex == 0 ? Pallete.hexocyan : itemColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: _selectedIndex == 0 ? Pallete.hexocyan : itemColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400),
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onMenuItemSelected(0);
              },
            ),
            // ... Other Drawer items ...
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Danh sách thiết bị'),
                            ),
                            // SlidingInfoButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Projector')),
                      DataColumn(label: Text('Projector S/N')),
                      DataColumn(label: Text('IP Address')),
                      DataColumn(label: Text('Light source hours')),
                      DataColumn(label: Text('Projector hours')),
                      DataColumn(label: Text('Main SW ver')),
                      DataColumn(label: Text('Country of Loan')),
                      DataColumn(label: Text('Ngày nhập')),
                      DataColumn(label: Text('Note')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: List.generate(
                      listRQ35K.length,
                          (index) {
                        var currentItem = listRQ35K[index];
                        return DataRow(
                          cells: [
                            DataCell(Text(currentItem.No.toString())),
                            DataCell(Text(currentItem.Projector.toString())),
                            DataCell(
                              Text(
                                currentItem.Projector_Serial_Number.toString(),
                              ),
                            ),
                            DataCell(Text(currentItem.IP_Address.toString())),
                            DataCell(Text(
                                currentItem.Light_source_hours.toString())),
                            DataCell(
                                Text(currentItem.Projector_hours.toString())),
                            DataCell(Text(currentItem.Main_SW_ver.toString())),
                            DataCell(
                                Text(currentItem.Country_of_Loan.toString())),
                            DataCell(Text(currentItem.Date_Import.toString())),
                            DataCell(Text(currentItem.Note.toString())),
                            DataCell(Text(currentItem.Status.toString())),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      addData();
                    });
              }, child: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }
}
