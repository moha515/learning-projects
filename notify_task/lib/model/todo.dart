// import '../utils.dart';

// class TodoFields {
//   static const createTime = 'createdTime';
// }

// class Todo {
//   DateTime? createdTime;
//   String? title;
//   String? id;
//   bool? isDone;
//   Todo(
//       {required this.createdTime,
//       required this.title,
//       this.id,
//       this.isDone = false});
//       static Todo fromJson(Map<String,dynamic>json)=>Todo(createdTime: Util.toDatetime(json['createdTime']),
//        title: 'title',
//        id: json['id'],
//        isDone: json['isDone']);
//   Map<String, dynamic> toJson() => {
//         'createdTime': Util.FromDateTimeTOJson(createdTime!),
//         'title': title,
//         'id': id,
//         'isDone': isDone,
//       };
// }
