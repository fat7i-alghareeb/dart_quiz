import 'package:dart_quiz/library_management/author.dart';
import 'package:dart_quiz/library_management/book.dart';
import 'package:dart_quiz/library_management/library.dart';

////////////////////////////////////////
// this example is written by ChatGPT//
//////////////////////////////////////
void main() {
  // Create authors
  Author author1 = Author(id: 'A1', name: 'Author One', books: []);
  Author author2 = Author(id: 'A2', name: 'Author Two', books: []);

  // Create books
  Book book1 = Book(
    title: 'The Great Adventure',
    description: 'An epic adventure full of excitement.',
    releaseDate: DateTime(2022, 5, 20),
    sales: 1000,
    author: author1,
    category: BookCategory.fiction,
  );

  Book book2 = Book(
    title: 'Science Wonders',
    description: 'Exploring the wonders of science.',
    releaseDate: DateTime(2023, 1, 10),
    sales: 500,
    author: author2,
    category: BookCategory.science,
  );

  Book book3 = Book(
    title: 'Horror Night',
    description: 'A thrilling horror story.',
    releaseDate: DateTime(2021, 10, 31),
    sales: 1500,
    author: author1,
    category: BookCategory.horror,
  );

  // Add books to authors' books list
  author1.books.add(book1);
  author1.books.add(book3);
  author2.books.add(book2);

  // Create libraries
  Library cityLibrary = Library(name: 'City Library', books: []);
  Library townLibrary = Library(name: 'Town Library', books: []);

  // Add books to libraries
  cityLibrary.addBook(book1);
  cityLibrary.addBook(book3);

  townLibrary.addBook(book1);
  townLibrary.addBook(book2);

  // 1. Display library contents
  print('--- City Library Contents ---');
  for (var book in cityLibrary.books) {
    book.displayDetails();
  }

  print('--- Town Library Contents ---');
  for (var book in townLibrary.books) {
    book.displayDetails();
  }

  // 2. Search for books by title or author in City Library
  print('\n--- Search for "Adventure" in City Library ---');
  cityLibrary.searchBooks('Adventure');

  print('\n--- Search for books by Author One in City Library ---');
  cityLibrary.searchBooks('Author One');

  // 3. Search for books containing the query in title or description in Town Library
  print('\n--- Search for books containing "Science" in Town Library ---');
  var foundBooks = townLibrary.searchBooksByNameAndDescription('Science');
  for (var book in foundBooks) {
    book.displayDetails();
  }

  // 4. Sort books by release date and sales in City Library
  print('\n--- City Library Books Sorted by Date and Sales ---');
  cityLibrary.sortBooksByDateAndSales();
  for (var book in cityLibrary.books) {
    book.displayDetails();
  }

  // 5. Find the author and the libraries that contain the book (using Book class method)
  print('\n--- Find Author and Libraries for book1 ---');
  var authorAndLibraries =
      book1.findAuthorAndLibraries([cityLibrary, townLibrary]);
  print('Author: ${authorAndLibraries['author'].name}');
  print('Libraries: ${authorAndLibraries['libraries']}');
}
