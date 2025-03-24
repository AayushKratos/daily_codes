import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json/controller/controller.dart';
import 'package:json/model/note.dart';
import 'package:json/pages/details.dart';

class HomeScreen extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: Obx(() {
        if (noteController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (_, index) {
            Note note = noteController.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle:
                  Text(note.body, maxLines: 1, overflow: TextOverflow.ellipsis),
              onTap: () => Get.to(() => NoteDetails(note: note)),
            );
          },
        );
      }),
    );
  }
}
