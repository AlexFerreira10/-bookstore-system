import 'dart:io';
import 'entities/book.dart';
import 'entities/bookstore.dart';
import 'utils/category.dart';

void main() {
  // Register a bookstore
  clearConsole();
  stdout.write('Digite o nome da Loja: ');
  var name = stdin
      .readLineSync()
      ?.trim(); // Trim the input to remove leading/trailing spaces

  while (name == null || name.isEmpty) {
    stdout.write('Nome da loja inválido. Digite novamente: ');
    name = stdin.readLineSync()?.trim();
  }

  Bookstore bookstore = Bookstore(name);
  clearConsole();
  int option = 0;

  do {
    stdout.write(menu(bookstore));
    var optionInput = stdin.readLineSync()?.trim();

    while (optionInput == null || int.tryParse(optionInput) == null) {
      stdout.write('Opção inválida! Por favor, insira um número válido: ');
      optionInput = stdin.readLineSync()?.trim();
    }

    option = int.parse(optionInput);

    clearConsole();

    switch (option) {
      case 1: // Completar Cadastro
        completeRegistration(bookstore);
        break;
      case 2: // Adicionar Livro
        addBook(bookstore);
        break;
      case 3: // Consultar Livro
        consultBook(bookstore);
        toContiue();
        break;
      case 4: // Listar Livros
        bookstore.showBooks();
        toContiue();
        break;
      case 5: // Vender Livro
        sellBook(bookstore);
        break;
      case 6: // Adicionar cupom de Desconto no Livro
        addCupom(bookstore);
        clearConsole();
        break;
      case 7: // Checar dados da loja
        print(bookstore);
        toContiue();
        break;
      default:
        print('Opção inválida!');
    }
  } while (option != 0);
}

String menu(Bookstore bookstore) {
  StringBuffer menuBuffer = StringBuffer();

  menuBuffer.writeln('Portal da ${bookstore.getName}!');
  menuBuffer.writeln('Escolha uma opção:');
  menuBuffer.writeln('0 - Sair');
  menuBuffer.writeln('1 - Editar Dados da Loja');
  menuBuffer.writeln('2 - Adicionar Livro');
  menuBuffer.writeln('3 - Consultar Livro');
  menuBuffer.writeln('4 - Listar Livros');
  menuBuffer.writeln('5 - Vender Livro');
  menuBuffer.writeln('6 - Adicionar cupom de Desconto no Livro');
  menuBuffer.writeln('7 - Checar dados da loja.');
  menuBuffer.write('Digite uma opção: ');

  return menuBuffer.toString();
}

void clearConsole() {
  if (Platform.isWindows) {
    print('\x1B[2J\x1B[H'); // Comando para limpar o console em Windows
  } else {
    print('\x1B[H\x1B[2J'); // Comando para limpar o console em Unix-like
  }
}

void completeRegistration(Bookstore bookstore) {
  stdout.write('Digite o endereço da Loja: ');
  var address = stdin.readLineSync()?.trim();
  while (address == null || address.isEmpty) {
    stdout.write('Endereço inválido. Digite novamente: ');
    address = stdin.readLineSync()?.trim();
  }
  bookstore.setAddress = address;

  stdout.write('Digite o novo CNPJ da Loja: ');
  var cnpj = stdin.readLineSync()?.trim();
  while (cnpj == null || cnpj.isEmpty) {
    stdout.write('CNPJ inválido. Digite novamente: ');
    cnpj = stdin.readLineSync()?.trim();
  }
  bookstore.setCnpj = cnpj;

  stdout.write('Digite o telefone da Loja: ');
  var tell = stdin.readLineSync()?.trim();
  while (tell == null || tell.isEmpty) {
    stdout.write('Telefone inválido. Digite novamente: ');
    tell = stdin.readLineSync()?.trim();
  }
  bookstore.setTell = tell;

  stdout.write('Digite o email da Loja: ');
  var email = stdin.readLineSync()?.trim();
  while (email == null || email.isEmpty) {
    stdout.write('E-mail inválido. Digite novamente: ');
    email = stdin.readLineSync()?.trim();
  }
  bookstore.setEmail = email;

  clearConsole();
  print('Dados da Loja atualizados com sucesso!');
  sleep(Duration(seconds: 3)); // Syncronous Programming
  clearConsole();
}

void addBook(Bookstore bookstore) {
  stdout.write('Digite o título do Livro: ');
  var title = stdin.readLineSync()?.trim();
  while (title == null || title.isEmpty) {
    stdout.write('Título inválido. Digite novamente: ');
    title = stdin.readLineSync()?.trim();
  }

  stdout.write('Digite o autor do Livro: ');
  var author = stdin.readLineSync()?.trim();
  while (author == null || author.isEmpty) {
    stdout.write('Autor inválido. Digite novamente: ');
    author = stdin.readLineSync()?.trim();
  }

  stdout.write('Digite a descrição do Livro: ');
  var description = stdin.readLineSync()?.trim();
  while (description == null || description.isEmpty) {
    stdout.write('Descrição inválida. Digite novamente: ');
    description = stdin.readLineSync()?.trim();
  }

  stdout.write('Digite o preço do Livro: ');
  var price = double.tryParse(stdin.readLineSync()?.trim() ?? '0') ?? 0.0;
  while (price <= 0) {
    stdout.write('Preço inválido. Digite novamente: ');
    price = double.tryParse(stdin.readLineSync()?.trim() ?? '0') ?? 0.0;
  }

  stdout.write('Digite a quantidade em estoque do Livro: ');
  var inStock = int.tryParse(stdin.readLineSync()?.trim() ?? '0') ?? 0;
  while (inStock < 0) {
    stdout.write('Quantidade inválida. Digite novamente: ');
    inStock = int.tryParse(stdin.readLineSync()?.trim() ?? '0') ?? 0;
  }

  Category? category;
  do {
    print('Categoria do Livro: ');
    for (var category in Category.values) {
      print('- ${category.name}');
    }

    stdout.write('Digite a categoria do livro: ');
    var categoryInput = stdin.readLineSync()?.trim();
    category = CategoryExtension.getCategoryFromString(categoryInput!);

    if (category == null) {
      print('Categoria inválida! Por favor, tente novamente.');
    }
  } while (category == null);

  stdout.write('Digite o prêmio do Livro: ');
  var award = stdin.readLineSync()?.trim();

  Book book = Book(title, author, description, price, inStock, category, award);
  bookstore.addBook(book);

  clearConsole();
  print('Livro adicionado com sucesso: $book');
  sleep(Duration(seconds: 3));
  clearConsole();
}

void addCupom(Bookstore bookstore) {
  stdout.write('Digite o título do Livro: ');
  var title = stdin.readLineSync()?.trim();

  while (title == null || title.isNotEmpty == false) {
    stdout.write('Título inválido. Digite novamente: ');
    title = stdin.readLineSync()?.trim();
  }

  var book = bookstore.getBook(title);

  stdout.write(
      'Digite o cupom de desconto: (10OFF, 20OFF, 30OFF, 40OFF, 50OFF) - ');
  var cupom = stdin.readLineSync()?.trim();
  book.addCupom(cupom!);
  clearConsole();
}

void toContiue() {
  stdout.write('Digite enter para continuar...');
  stdin.readLineSync();
  clearConsole();
}

void sellBook(Bookstore bookstore) {
  stdout.write('Digite o título do Livro: ');
  var title = stdin.readLineSync()?.trim();

  while (title == null || title.isEmpty) {
    stdout.write('Título inválido. Digite novamente: ');
    title = stdin.readLineSync()?.trim();
  }

  bookstore.buyBook(title);
}

void consultBook(Bookstore bookstore) {
  stdout.write('Digite o título do Livro: ');
  var title = stdin.readLineSync()?.trim();

  while (title == null || title.isEmpty) {
    stdout.write('Título inválido. Digite novamente: ');
    title = stdin.readLineSync()?.trim();
  }

  bookstore.findBook(title);
}
