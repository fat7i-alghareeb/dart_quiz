import 'author.dart';
import 'library.dart';

enum BookCategory { fiction, horror, science, history }

class Book {
  static int staticId = 0;
  late final int id;
  final String title;
  final String description;
  final DateTime releaseDate;
  final int sales;
  final Author author;
  final BookCategory category;

  Book({
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.sales,
    required this.author,
    required this.category,
  }) {
    id = staticId;
    staticId++;
  }

  void displayDetails() {
    print('Title: $title');
    print('Description: $description');
    print('Release Date: $releaseDate');
    print('Sales: $sales');
    print('Author: ${author.name}');
    print('Category: $category');
  }

  Map<String, dynamic> findAuthorAndLibraries(List<Library> libraries) {
    List<String> containingLibraries = [];

    // Search through each library to find which contains this book
    for (var library in libraries) {
      if (library.books.any((book) => book.id == id)) {
        containingLibraries.add(library.name);
      }
    }

    return {
      'author': author,
      'libraries': containingLibraries,
    };
  }
}
