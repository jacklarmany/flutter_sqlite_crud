class Todo {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  //create constructor
  Todo({
    this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,

  });

  //to save this data in database we need to convert it to a map
  //let's create a function for that
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate':
          creationDate.toString(), // sqlite doesn't support the date
      'isChecked':
          isChecked ? 1 : 0, // it doesn't support boolean, then we set to int
    };
  }

  // this function for debug only
  @override
  String toString() {
    return 'Todo(id:$id,title:$title,creationData:$creationDate,isChecked:$isChecked)';
  }
}
