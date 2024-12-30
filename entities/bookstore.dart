import 'book.dart';
import '../utils/contact.dart';

class Bookstore with Contact {
  String name;
  List<Book> books = [];

  Bookstore(this.name);

  void addBook(Book book) {
    books.add(book);
  }

  String get getName => this.name;

  set setName(String name) => this.name = name;

  void buyBook(String title) {
    var book = books.firstWhere((element) => element.title == title);
    if (book.inStock > 0) {
      book.inStock--;
      print('Book $title bought with success!');
    } else {
      print('Book $title out of stock!');
    }
  }

  Book getBook(String title) {
    return books.firstWhere((element) => element.title == title);
  }

  void findBook(String title) {
    var book = books.firstWhere((element) => element.title == title);
    print('Title: ${book.title}');
    print('Author: ${book.author}');
    print('Description: ${book.description}');
    print('Price: ${book.price}');
    print('In Stock: ${book.inStock}');
    print('Category: ${book.category}');
    print('Award: ${book.award}');
  }

  void showBooks() {
    for (var book in books) {
      print('----------------------');
      print('Title: ${book.title}');
      print('Author: ${book.author}');
      print('Description: ${book.description}');
      print('Price: ${book.price}');
      print('In Stock: ${book.inStock}');
      print('Category: ${book.category}');
      print('Award: ${book.award}');
      print('Cupom: ${book.getCupom}');
      print('----------------------');
    }
  }

  @override
  String toString() {
    return 'Bookstore: $name, Address: ${getAddress}, Email: ${getEmail}, Phone: ${getTell}';
  }
}
