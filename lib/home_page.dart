import 'dart:async';
import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'creat_new_task.dart';
import 'database_repo/database_repository.dart';
import 'database_repo/todoModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyHomePage> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();
  
  List<TodoModel> myTodos = [];

  @override
  void initState() {
    getTodos();
    super.initState();
  }
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightGreen[100],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(255, 131, 117, 117),
                offset: const Offset(5, 6),
                blurRadius: 4,
              ),
              BoxShadow(
                color: Color.fromARGB(255, 131, 117, 117),
                offset: const Offset(-3, -3),
                blurRadius: 4,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.green,
            unselectedItemColor: Colors.black45,
            selectedItemColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: "Calendar"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Message"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ), // backgroundColor: color.AppColor.homePageBackground,

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.only(
                        top: 70, left: 10, right: 10, bottom: 70),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                              // padding: const EdgeInsets.only(bottom: 20),
                              decoration:
                                  BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: const Offset(5, 6),
                                    color:
                                        color.AppColor.gradientSecond.withOpacity(0.1))
                              ]),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    size: 40,
                                    color: color.AppColor.homePageIcons,
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "Homepage",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: color.AppColor.homePageTitle),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Icon(
                                    Icons.notifications,
                                    size: 40,
                                    color: color.AppColor.homePageIcons,
                                  ),
                                ],
                              )),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Card(
                                elevation: 0,
                                color: Colors.greenAccent[100],
                                child: SizedBox(
                                  width: 380,
                                  height: 90,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          'GeeksforGeeks',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          '15 task',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ), //Textstyle
                                        ), //Text
                                      ],
                                    ), //Column
                                  ), //Padding
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Todays's Task",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: color.AppColor.homePageTitle),
                                ),
                                Expanded(child: Container()),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: color.AppColor.homePageTitle),
                                ),
                              ],
                            ),
                          ),

                          
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 0,
                                ),
                                child: GridView.count(
                                  crossAxisCount: 1,
                                  childAspectRatio: (1 / .3),
                                  shrinkWrap: true,
                                  children: List.generate(myTodos.length, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:
                                                    Color.fromARGB(255, 91, 151, 93))),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.settings,
                                                size: 30,
                                                color: color.AppColor.homePageIcons,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Expanded(
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.only(top: 20),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          
                                                        "${myTodos[index].taskName}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: color.AppColor
                                                                .homePageTitle),
                                                      ),
                                                      Text(
                                                        "${myTodos[index].startTime}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey),
                                                      ),
                                                       Text(
                                                        "${myTodos[index].startTime}",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios_outlined,
                                                size: 20,
                                                color: color.AppColor.homePageIcons,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                )),
                          )
                          //Sized
                          ,
                          Center(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100))),
                                  child: const Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const CreateNewTask()));
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
  void getTodos() async {
    await DatabaseRepository.instance.getAllTodos().then((value) {
      setState(() {
        myTodos = value;
        print( myTodos );
      });
    }).catchError((e) => debugPrint(e.toString()));
  }

}
