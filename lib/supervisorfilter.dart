import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samtry/safetyreport.dart';
import 'package:samtry/supervisorreport.dart';

class Book {
  final String category;
  final String ticketNo;
  final String tokenId;
  final String date;
  final String options;
  final String location;
  final String time;
  final String status;
  final String details;
  final String 	company;
  final String 	imgpt;

  Book({
    required this.category,
    required this.ticketNo,
    required this.tokenId,
    required this.date,
    required this.options,
    required this.location,
    required this.time,
    required this.status,
    required this.details,
    required this.company,
    required this.imgpt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      category: json['category'] ?? '[]',
      ticketNo: json['ticket_no'] ?? '[]',
      tokenId: json['token_id'] ?? '[]',
      date: json['date'] ?? '[]',
      options: json['options'] ?? '[]',
      location: json['location'] ?? '[]',
      time: json['time'] ?? '[]',
      status: json['status'] ?? '[]',
      details: json['detials'] ?? '[]',
      company: json['company'] ?? '[]',
      imgpt: json['image1'] ?? '[]',
    );
  }
}

class supervisorfilter extends StatefulWidget {
  @override
  _supervisorfilterState createState() => _supervisorfilterState();
}

class _supervisorfilterState extends State<supervisorfilter> {
  
  List<Book> _books = [];
  List<Book> _filteredBooks = [];
  String _selectedCategory = '';
  String _selectedSubcategory = '';
  Map<String, List<String>> _subcategoryMap = {
    'USA': ['ID', 'Gloves', 'Apron', 'Glasses', 'Helmet'],
    'USC': ["A - Actuator",
    "B - Big",
    "C - Car",
    "D - Drop",
    "E - Electrical",
    "F - Fire",
    "G - Gillette",
    "H - Health",],
  };
  List<String> _subcategories = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      final response = await http.get(Uri.parse(
          'http://117.16.136.181/dootedemo/reportdata.php')); // Replace with your server URL
      if (response.statusCode == 200) {
        List<dynamic> jsonDataList = json.decode(response.body);
        setState(() {
          _books = jsonDataList.map((data) => Book.fromJson(data)).toList();
          _filteredBooks = _books;
        });
      } else {
        throw Exception('Failed to fetch data from the server.');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  void _updateSubcategories() {
    setState(() {
      _subcategories = _subcategoryMap[_selectedCategory] ?? [];
      _selectedSubcategory = '';
      _filterBooks();
    });
  }

  void _filterBooks() {
    setState(() {
      _filteredBooks = _books
          .where((book) =>
              (_selectedCategory.isEmpty ||
                  book.category.toLowerCase() ==
                      _selectedCategory.toLowerCase()) &&
              (_selectedSubcategory.isEmpty ||
                  book.options.toLowerCase() ==
                      _selectedSubcategory.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.notes_outlined),
          iconSize: 30,
          color: Colors.black,
          onPressed: () {
            // code to navigate back
          },
        ),
        title: Container(
          width: 210,
          height: 56,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 210,
                    child: Text(
                      "Report",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfff48732),
                        fontSize: 24,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 211,
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(Icons.help),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Category',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                        _updateSubcategories();
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('All'),
                        value: '',
                      ),
                      DropdownMenuItem(
                        child: Text('USA'),
                        value: 'USA',
                      ),
                      DropdownMenuItem(
                        child: Text('USC'),
                        value: 'USC',
                      ),
                    ],
                    hint: Text('Filter by Category'),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Subcategory',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedSubcategory,
                    onChanged: (value) {
                      setState(() {
                        _selectedSubcategory = value!;
                        _filterBooks();
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('All'),
                        value: '',
                      ),
                      ..._subcategories.map(
                        (subcategory) => DropdownMenuItem(
                          child: Text(subcategory),
                          value: subcategory,
                        ),
                      ),
                    ],
                    hint: Text('Filter by Subcategory'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 170,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 107, 106, 106),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Category: ${_filteredBooks[index].category}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Ticket No: ${_filteredBooks[index].ticketNo}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Token ID: ${_filteredBooks[index].tokenId}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Date: ${_filteredBooks[index].date}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Options: ${_filteredBooks[index].options}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Supervisorreport(Category:_filteredBooks[index].category, date: _filteredBooks[index].date, Company: _filteredBooks[index].company, details: _filteredBooks[index].details, imgpt: _filteredBooks[index].imgpt, location:_filteredBooks[index].location, status: _filteredBooks[index].status, ticket_no:_filteredBooks[index].ticketNo, time:_filteredBooks[index].time, token_id: _filteredBooks[index].tokenId,),
                                      ),
                                    );
                                  },
                                  child: Text('Details'),
                                ),
                              ],
                            ),
                          ),
                           Padding(padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'status: ${_filteredBooks[index].status}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),textAlign: TextAlign.left,
                                ),])
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

