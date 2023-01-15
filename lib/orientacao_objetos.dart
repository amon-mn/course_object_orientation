
void main() {

  Fruta melancia = Fruta('Melancia', 1500.0, 'Verde', 'Doce', 40); // Aula 3.4
  melancia.estaMadura(43);

  Legumes mandioca1 = Legumes('Macaxeira', 'Marrom', 1200, true);
  Citricas limao1 = Citricas('Limão', 100, 'Verde', 'Azedo', 5, 9);
  Nozes macadamia1 = Nozes("Macadamia", 200, "Branca e Amarelada", "Doce", 27, 35);
  Fruta banana1 = Fruta("Banana", 200, "Amarela", "Doce", 33);
  mandioca1.printAlimento();
  limao1.printAlimento();
  mandioca1.cozinhar();
  limao1.fazerSuco();
  banana1.separarIngredientes();
  macadamia1.fazerMassa();

}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

void funcMostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor.");
  }
}

void funcQuantosDiasMadura(String nome, int dias) {
  int diasParamadura = 30;
  if (dias >= diasParamadura) {
    print("A $nome está madura.");
  } else {
    int quantosDiasFaltam = diasParamadura - dias;
    print("Faltam $quantosDiasFaltam dias para a $nome estar madura.");
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este(a) $nome pesa $peso gramas e é $cor");
  }
}

class Fruta extends Alimento implements Bolo{
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida a $diasDesdeColheita dias e precisa de $diasParaMadura dias para poder comer. \n"
            "Ela está madura? $isMadura");
  }

  void fazerSuco() {
    print("Você fez um ótimo suco de $nome!");
  }

  @override
  void assar() {
    print("Colocar no forno.");
  }

  @override
  void fazerMassa() {
    print("Misturar a $nome com farinha, açucar, ovos...");
  }

  @override
  void separarIngredientes() {
    print("Catar a $nome.");
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;

  Legumes(String nome, String cor, double peso, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print("Pronto, o $nome está cozinhando!");
    } else {
      print("Nem precisa cozinhar");
    }
  }

  @override
  void assar(){

  }
  @override
  void fazerMassa(){

  }
  @override
  void separarIngredientes(){

  }

}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print("Existe refrigerante de $nome.");
    } else {
      print("Não existe refri de $nome.");
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa(){
    print("Tirar a casca");
    super.fazerMassa();
  }

}

abstract class Bolo {

  void separarIngredientes();

  void fazerMassa();

  void assar();

}
