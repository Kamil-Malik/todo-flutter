class Todo {
  String todoTitle;
  String todoSubtitle;
  bool todoStatus;

  Todo(
      {required this.todoTitle,
      required this.todoSubtitle,
      this.todoStatus = false});
}
