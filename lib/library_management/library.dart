import 'book.dart';

class Library {
  final String name;
  List<Book> books;

  Library({required this.name, required this.books});

  void addBook(Book book) {
    books.add(book);
  }

  /// searches for books by title or author and display book details.
  void searchBooks(String query) {
    for (var book in books) {
      if (book.title.contains(query) || book.author.name.contains(query)) {
        book.displayDetails();
      }
    }
  }

  /// searches for books that contain the query in title or description
  List<Book> searchBooksByNameAndDescription(String query) {
    return books
        .where((book) =>
            book.title.contains(query) || book.description.contains(query))
        .toList();
  }

  /// sorts books by release date and sales
  void sortBooksByDateAndSales() {
    books.sort((a, b) {
      if (a.releaseDate.compareTo(b.releaseDate) == 0) {
        return b.sales.compareTo(a.sales);
      }
      return b.releaseDate.compareTo(a.releaseDate);
    });
  }
}
