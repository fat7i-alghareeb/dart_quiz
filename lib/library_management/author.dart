import 'book.dart';

class Author {
  final String id;
  final String name;
  final List<Book> books;

  Author({required this.id, required this.name, required this.books});

  void displayDetails() {
    print('Author: $name');
    print('Books: ${books.map((book) => book.title).join(', ')}');
  }
}
