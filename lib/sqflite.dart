import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/dbmanager.dart';


class SqfLite extends StatefulWidget {
  @override
  _SqfLiteState createState() => _SqfLiteState();
}

class _SqfLiteState extends State<SqfLite> {
  final DbStudentManager dbmanager = DbStudentManager();

  final _nameController = TextEditingController();

  final _courseController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isEdit = false;
  int id = 0;

  Student? student;

  List<Student>? studentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite demo'),
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: _nameController,
                      validator: (value) =>
                      value!.isNotEmpty ? null : 'Enter Name'),
                  TextFormField(
                      decoration: InputDecoration(labelText: 'Course'),
                      controller: _courseController,
                      validator: (value) =>
                      value!.isNotEmpty ? null : 'Enter Course'),
                  ElevatedButton(

                      child: Text(isEdit ? 'Update' : 'Submit'),
                      onPressed: () {
                        isEdit ? _editStudent(id) : _submitStudent(context);
                        setState(() {
                          studentList = studentList;
                        });
                      }),
                  FutureBuilder(
                    future: dbmanager.getStudentList(),
                    builder: (context, snapshot) {
                      snapshot.hasData ? studentList = snapshot.data as List<Student>? : null;
                      return studentList != null
                          ? ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                        studentList == null ? 0 : studentList!.length,
                        itemBuilder: (context, index) {
                          Student st = studentList![index];
                          return Card(
                            child: Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Name: ${st.name}'),
                                    Text('Course: ${st.course}'),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEdit = true;
                                        id = st.id;
                                      });

                                      _nameController.text = st.name;
                                      _courseController.text = st.course;
                                      setState(() {
                                        studentList = studentList;
                                      });
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      dbmanager.deleteStudent(st.id);
                                      setState(() {
                                        studentList = studentList;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          );
                        },
                      )
                          : Container();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (student == null) {
        Student st =
        Student(name: _nameController.text, course: _courseController.text, id: 0);
        dbmanager.insertStudent(st).then((value) {
          _nameController.clear();
          _courseController.clear();
        });
      }
    }
  }

  void _editStudent(int id) {
    if (_formKey.currentState!.validate()) {
      if (student == null) {
        Student st = Student(
            id: id, name: _nameController.text, course: _courseController.text);
        dbmanager.updateStudent(st).then((value) {
          _nameController.clear();
          _courseController.clear();
          setState(() {
            isEdit = false;
          });
        });
      }
    }
  }
}
