import 'package:flutter/material.dart';
import 'package:lastfirebase/pages/settings_page.dart';
import 'package:lastfirebase/src/pallete.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35,
                    width: 500,
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
                ],
              ),
            ),
            // Sort button
            IconButton(
                onPressed: () {
                  // Here is for filter function...
                },
                icon: const Icon(Icons.sort),
                color: itemColor)
          ],
        ),
      ),
      // Vertical menu
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
            ListTile(
              leading: Icon(
                _selectedIndex == 1 ? Icons.download : Icons.download_outlined,
                color: _selectedIndex == 1 ? Pallete.hexocyan : itemColor,
              ),
              title: Text(
                'Import',
                style: TextStyle(
                    color: _selectedIndex == 1 ? Pallete.hexocyan : itemColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onMenuItemSelected(1);
              },
            ),
            ListTile(
              leading: Icon(
                _selectedIndex == 2 ? Icons.upload : Icons.upload_outlined,
                color: _selectedIndex == 2 ? Pallete.hexocyan : itemColor,
              ),
              title: Text(
                'Export',
                style: TextStyle(
                    color: _selectedIndex == 2 ? Pallete.hexocyan : itemColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400),
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                _onMenuItemSelected(2);
              },
            ),
            ListTile(
              leading: Icon(
                _selectedIndex == 3 ? Icons.settings : Icons.settings_outlined,
                color: _selectedIndex == 3 ? Pallete.hexocyan : itemColor,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                    color: _selectedIndex == 3 ? Pallete.hexocyan : itemColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400),
              ),
              selected: _selectedIndex == 3,
              onTap: () {
                _onMenuItemSelected(3);
                // Navigate to Settings Screen
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              },
            ),
          ],
        ),
      ),
      // Giao diện Home
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
                              child: Text(
                                'Danh sách thiết bị',
                                style: TextStyle(color: itemColor),
                              ),
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
                      DataColumn(label: Text('Date_Import')),
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
                            DataCell(Text(currentItem.Date_Import.toString())),
                            // Add more DataCell widgets for other properties
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation or other actions based on the selected index
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }
}
