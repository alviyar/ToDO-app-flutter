class ToDo{
  String id;
  String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,

  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDo(id: '03', todoText: 'Check Emails', isDone: false),
      ToDo(id: '04', todoText: 'Team Meeting', isDone: false),
      ToDo(id: '05', todoText: 'Work on project', isDone: false),
      ToDo(id: '06', todoText: 'pet catto', isDone: false),
      ToDo(id: '07', todoText: 'dinner with bbg', isDone: false),
    ];
  }

}