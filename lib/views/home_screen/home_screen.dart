import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_walking_detector/consts/consts.dart';
import 'package:sleep_walking_detector/views/home_screen/home_buttons.dart';
import 'card_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int bpmLoadedRowCount = 10; // Track the number of loaded BPM table rows
  int spo2LoadedRowCount = 10; // Track the number of loaded SpO2 table rows
  int tempLoadedRowCount = 10;
  // bool _showLessTemp = false;
  // bool _showLessBpm = false; // Track the visibility of "Show Less" button for BPM
  // bool _showLessSpo2 = false; // Track the visibility of "Show Less" button for SpO2

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void loadMoreBpmData() {
    setState(() {
      bpmLoadedRowCount += 10; // Increase the number of loaded BPM table rows by 10
      // _showLessBpm = true; // Show the "Show Less" button
    });
  }

  void loadMoreTempData() {
    setState(() {
      tempLoadedRowCount += 10; // Increase the number of loaded BPM table rows by 10
        // _showLessTemp = true; // Show the "Show Less" button
    });
  }

  void loadMoreSpo2Data() {
    setState(() {
      spo2LoadedRowCount += 10; // Increase the number of loaded SpO2 table rows by 10
        // _showLessSpo2 = true; // Show the "Show Less" button
    });
  }

  void showLessBpmData() {
    setState(() {
      bpmLoadedRowCount = 10; // Reset the loaded row count for BPM
        // _showLessBpm = false; // Hide the "Show Less" button
    });
  }

  void showLessSpo2Data() {
    setState(() {
      spo2LoadedRowCount = 10; // Reset the loaded row count for SpO2
        // _showLessSpo2 = false; // Hide the "Show Less" button
    });
  }

  void showLessTempData() {
    setState(() {
      spo2LoadedRowCount = 10; // Reset the loaded row count for SpO2
        // _showLessTemp = false; // Hide the "Show Less" button
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            CardViewer(dateTime: DateTime.now()),
            const SizedBox(height: 16), // Add spacing between the card viewer and the row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) => homeButtons(
                height: context.screenHeight * 0.15,
                width: context.screenWidth / 3.5,
                icon: index == 0 ? icHeart : index == 1 ? icFlashDeal : icArrow,
                title: index == 0 ? temperature : index == 1 ? bpm : spo2, 
              )),
            ),
            const SizedBox(height: 16), // Add spacing between the row and the tab switch area
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Temperature'),
                      Tab(text: 'BPM'),
                      Tab(text: 'SpO2'),
                    ],
                    labelColor: Colors.black, // Customize the selected tab label color
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Content for the 'Temperature' tab
                        Stack(
                    children: [
                      ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(1),
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  children: const [
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Time',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          'Reading',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                  const TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('2023-05-25'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('10:30 PM'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('98'),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (tempLoadedRowCount > 20) // Show "Load More" button if not all rows are loaded
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  tempLoadedRowCount += 10; // Increase loaded row count by 10
                                });
                              },
                              child: const Text('Load More'),
                            ),
                          ),
                        ),
                    ],
                  ),
                        // Content for the 'BPM' tab
                        ListView(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: Table(
                                border: TableBorder.all(),
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(1),
                                  2: FlexColumnWidth(1),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    children: const [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Date',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Time',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Reading',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('2023-05-25'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('10:30 AM'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('98'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('2023-05-26'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('09:45 AM'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('95'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Add more rows for additional readings
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Content for the 'SpO2' tab
                        ListView(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: Table(
                                border: TableBorder.all(),
                                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(1),
                                  2: FlexColumnWidth(1),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                    ),
                                    children: const [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Date',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Time',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text(
                                            'Reading',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('2023-05-25'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('10:30 AM'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('98'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('2023-05-26'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('09:45 AM'),
                                        ),
                                      ),
                                      TableCell(
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Text('95'),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Add more rows for additional readings
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
