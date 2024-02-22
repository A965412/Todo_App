import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/Task.dart';

class Firebase {
  static CollectionReference<Task> getcollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionname)
        .withConverter<Task>(
            fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
            toFirestore: (Task, _) => Task.toJson());
  }

  static Future<void> addtasktofirestore(Task task) {
    CollectionReference<Task> taskCollection = getcollection();
    DocumentReference<Task> taskdocument = taskCollection.doc();
    task.id = taskdocument.id;
    return taskdocument.set(task);
  }

  static Future<void> deletetask(Task task) {
    return getcollection().doc(task.id).delete();
  }
}
