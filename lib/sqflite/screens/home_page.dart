// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../model/car_model.dart';
import '../utils/db_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Car> car = [];
  List<Car> carByName = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController milesController = TextEditingController();
  TextEditingController queryController = TextEditingController();
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController idDeleteController = TextEditingController();

  TextEditingController milesUpdateController = TextEditingController();

  // void _showMessageInScaffold(String message) {
  //   _scaffoldKey.currentState?.showBottomSheet(
  //     (context) => SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Car App SQL"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Insert",
              ),
              Tab(
                text: "View",
              ),
              Tab(
                text: "query",
              ),
              Tab(
                text: "update",
              ),
              Tab(
                text: "delete",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Car Name",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: milesController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Car Miles",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      int miles = int.parse(milesController.text);
                      _insert(name, miles);
                    },
                    child: const Text("Ekle"),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black26,
              child: ListView.builder(
                itemCount: car.length + 1,
                padding: const EdgeInsets.all(8),
                itemBuilder: ((context, index) {
                  if (index == car.length) {
                    return ElevatedButton(
                      child: const Text("Refresh"),
                      onPressed: () {
                        setState(() {
                          _queryAll();
                        });
                      },
                    );
                  }
                  return SizedBox(
                    height: 40,
                    child: Center(
                      child: Text(
                        "[${car[index].id}] - ${car[index].name} - ${car[index].miles} miles",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Car name",
                      ),
                      onChanged: (value) {
                        if (value.length >= 2) {
                          setState(() {
                            _query(value);
                          });
                        } else {
                          setState(() {
                            carByName.clear();
                          });
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: carByName.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 50,
                            margin: const EdgeInsets.all(2),
                            child: Center(
                              child: Text(
                                "[${carByName[index].id}] - ${carByName[index].name} - ${carByName[index].miles} miles",
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: idUpdateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Car id",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: nameUpdateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Car Name Update",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: milesUpdateController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Car Miles",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        int id = int.parse(idUpdateController.text);
                        String name = nameUpdateController.text;
                        int miles = int.parse(milesUpdateController.text);
                        _update(id, name, miles);
                      },
                      child: const Text("Update"),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: idDeleteController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Car id",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int id = int.parse(idDeleteController.text);
                      _delete(id);
                    },
                    child: const Text("Update"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _delete(int id) async {
    final rowsDeleted = await dbHelper.delete(id);
    //_showMessageInScaffold("deleed $rowsDeleted row(s) $id");
    print(rowsDeleted);
  }

  void _update(int id, String name, int miles) async {
    Car car = Car(id, name, miles);
    final rowAffected = await dbHelper.update(car);
    print(rowAffected);
    //_showMessageInScaffold("güncellendi $rowAffected ");
  }

  void _query(String name) async {
    final allRows = await dbHelper.queryRows(name);
    carByName.clear();
    allRows?.forEach((element) => carByName.add(Car.fromMap(element)));
  }

  void _insert(String name, int miles) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnMiles: miles,
    };

    Car car = Car.fromMap(row);
    final id = await dbHelper.insert(car);
    print(id);
    //_showMessageInScaffold("insert row id: $id");
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    car.clear();
    allRows?.forEach((element) => car.add(Car.fromMap(element)));
    //_showMessageInScaffold("Query done.");
    setState(() {});
  }
}
