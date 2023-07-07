import 'package:flutter/material.dart';
import 'package:todo_list/My_task.dart';
import 'package:todo_list/database_repo/todoModel.dart';
import 'package:todo_list/home_page.dart';

import 'colors.dart' as color;
import 'database_repo/database_repository.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({Key? key}) : super(key: key);

  @override
  State<CreateNewTask> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateNewTask> {
  //  taskName: "Build an app",
  //       description: "This will enable the company to keep track to task",
  //       taskDate: "2022-03-04",
  //       startTime: "12:00 PM",
  //       endTime: "02:00 PM");
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var taskName = TextEditingController();
  var description = TextEditingController();
  var taskDate = TextEditingController();
  var startTime = TextEditingController();
  var endTime = TextEditingController();

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
                    padding: const EdgeInsets.only(
                        top: 70, left: 10, right: 10, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(
                                bottom: 30, top: 20, left: 10, right: 10),
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
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyHomePage()));
                                  }),
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 20,
                                    color: color.AppColor.homePageIcons,
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyTaskPage()));
                                      },
                                      child: Text(
                                        "Create New Task",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: color.AppColor.homePageTitle),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Icon(
                                  Icons.notifications,
                                  size: 20,
                                  color: color.AppColor.homePageIcons,
                                ),
                              ],
                            )),
        
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Task Name',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: taskName,
                                    autofocus: false,
                                    // ignore: prefer_const_constructors
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelStyle: const TextStyle(letterSpacing: 0.1),
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsetsDirectional.only(start: 2.0),
                                        child: Icon(Icons
                                            .design_services), // Change this icon as per your requirement
                                      ),
                                      labelText: 'UI Design',
                                    ),
                                    // validator: Validation().text,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 10),
                                  child: Text(
                                    'Date',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: taskDate,
                                    autofocus: false,
                                    // ignore: prefer_const_constructors
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelStyle: const TextStyle(letterSpacing: 0.1),
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsetsDirectional.only(start: 2.0),
                                        child: Icon(Icons
                                            .calendar_month), // Change this icon as per your requirement
                                      ),
                                      labelText: 'UI Design',
                                    ),
                                    // validator: Validation().text,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10, top: 10),
                                            child: Text(
                                              'Start Time',
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              controller: startTime,
                                              autofocus: false,
                                              // ignore: prefer_const_constructors
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelStyle: const TextStyle(
                                                    letterSpacing: 0.1),
                                                suffixIcon: const Padding(
                                                  padding: EdgeInsetsDirectional.only(
                                                      start: 2.0),
                                                  child: Icon(Icons
                                                      .arrow_drop_down), // Change this icon as per your requirement
                                                ),
                                                labelText: '9:10 am',
                                              ),
                                              // validator: Validation().text,
                                            ),
                                          ),
                                        ],
                                      )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10, top: 10),
                                            child: Text(
                                              'Start Time',
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w500,
                                              ), //Textstyle
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              controller: endTime,
                                              autofocus: false,
                                              // ignore: prefer_const_constructors
                                              decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelStyle: const TextStyle(
                                                    letterSpacing: 0.1),
                                                suffixIcon: const Padding(
                                                  padding: EdgeInsetsDirectional.only(
                                                      start: 2.0),
                                                  child: Icon(Icons
                                                      .arrow_drop_down), // Change this icon as per your requirement
                                                ),
                                                labelText: '10:00 AM',
                                              ),
                                              // validator: Validation().text,
                                            ),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
        
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  'Description',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                  ), //Textstyle
                                ),
                              ),
                              TextField(
                                controller: description,
                                decoration: InputDecoration(
                                  // labelText: 'Enter Name',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 40), // <-- SEE HERE
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Sized
        
                        Container(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Expanded(
                                    child: ElevatedButton(
                                      child: Text('Create Task'),
                                      onPressed: () {
                                        addTodo();
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }

  void addTodo() async {
    TodoModel todoData = TodoModel(
        taskName: taskName.text,
        description: description.text,
        taskDate: taskDate.text,
        startTime: startTime.text,
        endTime: endTime.text);

    await DatabaseRepository.instance.insert(todomodel: todoData);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyTaskPage()));
  }
}
