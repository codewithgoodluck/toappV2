import 'package:flutter/material.dart';
import 'package:todo_list/home_page.dart';

import 'Edit_task.dart';
import 'colors.dart' as color;
import 'creat_new_task.dart';
import 'database_repo/database_repository.dart';
import 'database_repo/todoModel.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  State<MyTaskPage> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskPage> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<TodoModel> myTodos = [];

  @override
  void initState() {
    getTodos();
    super.initState();
  }

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

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.only(
                  top: 70, left: 10, right: 10, bottom: 30),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(bottom: 20),
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyHomePage()));
                            },
                            child: Icon(
                              Icons.menu,
                              size: 40,
                              color: color.AppColor.homePageIcons,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            "My Task",
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

                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(),
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
                                                        "${myTodos[index].startTime}"  "${myTodos[index].endTime}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditTask(
                                                                todo: myTodos[
                                                                    index],
                                                              )));
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 25,
                                                  color: color
                                                      .AppColor.homePageIcons,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2),
                                              child: InkWell(
                                                onTap: () {
                                                  deleteData(myTodos[index]);
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 25,
                                                  color: color
                                                      .AppColor.homePageIcons,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }),
                        )),
                  ),

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
                                    builder: (context) =>
                                        const CreateNewTask()));
                          },
                        ),
                      ],
                    ),
                  )
                  //Sized
                ],
              )),
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

  void deleteData(TodoModel todo) async {
    DatabaseRepository.instance.delete(todo.id!).then((value) {
      getTodos();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Deleted')));
    }).catchError((e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error Deleting data")));
    });
  }
}
