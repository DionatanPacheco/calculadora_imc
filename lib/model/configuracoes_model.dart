class ConfiguracoesModel {
  String nomeUsuario = "";
  double altura = 0;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  ConfiguracoesModel.vazio() {
    nomeUsuario = "";
    altura = 0;
    receberNotificacoes = false;
    temaEscuro = false;
  }

  ConfiguracoesModel(
      this.nomeUsuario, this.altura, this.receberNotificacoes, this.temaEscuro);
}
