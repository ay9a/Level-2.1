import 'dart:io';

void main(List<String> args) {
  NoteApp noteApp = NoteApp();
  noteApp.run();
}

class Note {
  String? title;
  String? content;

  Note({this.title, this.content});
}

class NoteApp {
  List<Note> notes = [];

  void menu() {
    print("Display menu:");
    print("1- Create a new Note");
    print("2- Edit an existing note");
    print("3- Delete a note");
    print("4- Searching for a note");
    print("5- Exit");
  }

  void Edit() {
    if (notes.isEmpty) {
      print('Nothing to edit.');
      return;
    }
    print('Enter the index of the note you want to edit:');
    int? index = int.tryParse(stdin.readLineSync() ?? '');
    if (index == null || index < 0 || index >= notes.length) {
      print('Invalid index.');
      return;
    }
    print('Enter new title:');
    String? newTitle = stdin.readLineSync();
    print('Enter new content:');
    String? newContent = stdin.readLineSync();
    notes[index].title = newTitle;
    notes[index].content = newContent;
    print('Note edited successfully.');
  }

  void Delete() {
    if (notes.isEmpty) {
      print('Nothing to delete.');
      return;
    }
    print('Enter the index of the note you want to delete:');
    int? index = int.tryParse(stdin.readLineSync() ?? '');
    if (index == null || index < 0 || index >= notes.length) {
      print('Invalid index.');
      return;
    }
    notes.removeAt(index);
    print('Note deleted successfully.');
  }

  void Search() {
    if (notes.isEmpty) {
      print('Nothing to search.');
      return;
    }
    print('Enter the title of the note you want to search for:');
    String? title = stdin.readLineSync();
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].title == title) {
        print('Note found.');
        print('Title: ${notes[i].title}');
        print('Content: ${notes[i].content}');
        return;
      }
    }
    print('Note not found.');
  }

  void Add() {
    print('Enter title:');
    String? title = stdin.readLineSync();
    print('Enter content:');
    String? content = stdin.readLineSync();
    notes.add(Note(title: title, content: content));
    print('Note added successfully.');
    print('Title: ${notes[notes.length - 1].title}');
  }

  void run() {
    menu();
    while (true) {
      stdout.write('Enter your choice: '); // Using stdout.write to prompt user input
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        int? choice = int.tryParse(input);
        if (choice != null) {
          switch (choice) {
            case 1:
              Add();
              break;
            case 2:
              Edit();
              break;
            case 3:
              Delete();
              break;
            case 4:
              Search();
              break;
            case 5:
              exit(0);
              break;
            default:
              print('Invalid choice.');
          }
        } else {
          print('Please enter a valid number.');
        }
      } else {
        print('Please enter a choice.');
      }
    }
  }
}

