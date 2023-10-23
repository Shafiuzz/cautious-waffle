import 'package:flutter/material.dart';
import 'package:flutter_basic/student.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key, required this.title});
  final String title;

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  List<Student> listStudent = [
    Student(nrp: 210609001, name: 'Yunus', address: 'Cibiru'),
    Student(nrp: 210609012, name: 'Zakaria', address: 'Cikadut'),
    Student(nrp: 210609032, name: 'Yahya', address: 'Bihbul'),
    Student(nrp: 210609028, name: 'Idris', address: 'Cihanjuang'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          //objek mahasiswa (alternate)
          final mahasiswa = listStudent[index];
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Data Mahasiswa'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama : ${mahasiswa.name}'),
                        Text('NRP : ${mahasiswa.nrp}'),
                        Text('Alamat : ${mahasiswa.address}'),
                        // Text('Alamat : ${listStudent[index].name}')
                        // Text('NRP : ${listStudent[index].nrp}')
                        // Text('Alamat : ${listStudent[index].address}')
                      ],
                    ),
                  );
                },
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(mahasiswa.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${mahasiswa.nrp}'),
                    Text(mahasiswa.address.toString()),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: listStudent.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
