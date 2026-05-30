class ProductModel {
  final String nome;
  final String imagem;
  final String preco;
  final String descricao;

  ProductModel({
    required this.nome,
    required this.imagem,
    required this.preco,
    required this.descricao,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      nome: json['nome'],
      imagem: json['imagem'],
      preco: json['preco'],
      descricao: json['descricao'],
    );
  }
}
