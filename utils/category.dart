enum Category {
  FICCAO,
  CIENCIA,
  BIOGRAFIAS,
  TECNOLOGIA,
  AUTOAJUDA,
}

extension CategoryExtension on Category {
  static Category? getCategoryFromString(String input) {
    try {
      return Category.values.firstWhere(
        (e) => e.name.toUpperCase() == input.toUpperCase(),
        orElse: () => throw Exception('Categoria inválida'),
      );
    } catch (e) {
      return null;
    }
  }
}
