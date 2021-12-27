import 'package:flutter/material.dart';

class TransmissaoModel {
  final String imagem;
  final String descricao;

  TransmissaoModel({
    @required this.imagem,
    @required this.descricao
  });
}

final transmissaoList = [
  TransmissaoModel(
    imagem: 'assets/Transmissao/1.PNG',
    descricao: 'A transmissão pode acontecer quando alguém tosse ou espirra perto de você'
  ),
  TransmissaoModel(
    imagem: 'assets/Transmissao/2.PNG',
    descricao: 'A transmissão pode acontecer quando você encosta em uma gotícula de um doente deixada em algum lugar e toca o rosto'
  ),
  TransmissaoModel(
    imagem: 'assets/Transmissao/3.PNG',
    descricao: 'A transmissão pode acontecer quando tocar as mãos de doentes e objectos de uso colectivo (se usados por alguém infectado)'
  ),
];