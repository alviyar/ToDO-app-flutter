// ignore_for_file: deprecated_member_use

import "package:flutter/cupertino.dart";
import"package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/widgets.dart";
import "package:todo/constants/colors.dart";
import "package:todo/model/todo.dart";
import "package:todo/screens/theme.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:todo/widgets/todo_item.dart";

class Home extends StatefulWidget {
  final ThemeSwitch themeSwitch;

  Home({Key? key, required this.themeSwitch}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist= ToDo.todoList();
    List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

    @override
  void initState() {
    _foundToDo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body:Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical:15,horizontal: 20),
              child:Column(
                children: [
                  searchBox(context),
                  Expanded(
                    child: ListView(
                      children: [
                          Container(
                            margin:EdgeInsets.only(top:30,bottom:20),
                            child: Text(
                              "All ToDos",
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                          for( ToDo todoo in todoslist )
                          TodoItem(todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  )
              ],
              ),
            ),
            Align(alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      boxShadow: [BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,)],
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Add a new Todo item",
                          hintStyle: TextStyle(color:Colors.black),
                          border: InputBorder.none
                        ),
                      ),
                    ) ,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child:ElevatedButton(
                    child: Text("+", style: TextStyle(fontSize: 40,),),
                    onPressed:(){},
                    style:ElevatedButton.styleFrom(
                      backgroundColor:Theme.of(context).colorScheme.secondary,
                      minimumSize: Size(60, 60),
                      elevation: 10
                    ),
                    ),
                    ),
              ]
                )
            )
              ],
            ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState((){
      todo.isDone= !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoslist.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }


Widget searchBox(BuildContext context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    height:45,
    width:double.infinity,
    decoration: BoxDecoration(
      border:Border.all(
      color:Theme.of(context).colorScheme.secondary ,
      width:4,),
      borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:9),
          prefixIcon: Icon(Icons.search,
          color:Theme.of(context).colorScheme.onSecondary,
          size:20),
          prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth:25
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color:Theme.of(context).colorScheme.onSecondary,),
        ),
      ),
    );
}

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children:[
          Row(
            children: [
          Icon(Icons.menu,
          color:Theme.of(context).colorScheme.primary,
          size:30),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(
              widget.themeSwitch.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: (){
              widget.themeSwitch.toggleTheme();
            },
          ),
            ],
            ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Image.network("https://i.pinimg.com/564x/26/ff/3c/26ff3cee7eef73c77239edb5e2542c6a.jpg"),)
          )
        ],
      ),
      );
  }
  }

