import 'book.dart';
import 'contact.dart';

class Bookstore with Contact {
  String name;
  List<Book> books = [];

  Bookstore(this.name);

  void addBook(Book book) {
    books.add(book);
  }

  void buyBook(String title) {
    var book = books.firstWhere((element) => element.title == title);
    if (book.inStock > 0) {
      book.inStock--;
      print('Book $title bought with success!');
    } else {
      print('Book $title out of stock!');
    }
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
    print('Cupom: ${book.getCupom}');
  }

  void showBooks() {
    for (var book in books) {
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
}
