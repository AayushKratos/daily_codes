import 'package:get/get.dart';
import 'package:json/API/services.dart';
import 'package:json/model/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNotes();
    super.onInit();
  }

  void fetchNotes() async {
    try {
      isLoading(true);
      var result = await ApiService.fetchNotes();
      notes.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
