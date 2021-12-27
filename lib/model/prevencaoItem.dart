import 'package:flutter/material.dart';

class PrevencaoModel {
  final String imagem;
  final String descricao;

  PrevencaoModel({
    @required this.imagem,
    @required this.descricao
  });
}

final sintomasList = [
  PrevencaoModel(
    imagem: 'assets/Sintomas/1.PNG',
    descricao: 'Evite sair de casa se tiver ao mesmo tempo tosse ou espirro e febre. Utilize lenço descartável ou cubra a boca com a parte interna do cotovelo ao tossir ou espirrar.'
  ),
  PrevencaoModel(
    imagem: 'assets/Sintomas/2.PNG', 
    descricao: 'Se além dos sintomas acima estiver com dificuldade para respirar e sentindo-se cansado e/ou com dores no corpo'
  ),
  PrevencaoModel(
    imagem: 'assets/Sintomas/3.PNG', 
    descricao: 'Viajou para fora do país ou teve contacto com donte que esteve no exterior nos últimos 14 dias'
  ),
  PrevencaoModel(
    imagem: 'assets/Sintomas/4.PNG', 
    descricao: 'Esteve com alguém que teve diagnóstico confirmado de COVID-19'
  ),
  PrevencaoModel(
    imagem: 'assets/Sintomas/5.PNG', 
    descricao: 'Em qualquer um dos casos acima, procure assistência médica e informe sinceramente da sua situação'
  ),
];

final medidasList = [
  PrevencaoModel(
    imagem: 'assets/Prevencao/1.PNG', 
    descricao: 'Evite encostar as mãos no rosto antes de lavá-las'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/2.PNG', 
    descricao: 'Lavar as mãos com sabão por 20 segundos. Onde lavar: debaixo das unhas, entre os dedos, punho, na frente e atrás'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/3.PNG', 
    descricao: 'Limpar objectos de uso colectivo antes de usá-los. Exemplos: maçanetas, talheres, copos, botão do elevador, mouse, teclados'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/4.PNG', 
    descricao: 'Mantenha distância de no mínimo 2 metros se vir alguém tossindo ou espirrando'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/5.PNG', 
    descricao: 'Mantenha-se hidratado e alimente bem'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/6.PNG', 
    descricao: 'Evite cumprimentar com beijos no rosto, abraçando ou apertando as mãos'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/7.PNG', 
    descricao: 'Evite frequentar eventos em estádios, shows, teatros e igrejas. Se for, mantenha distância das outras pessoas e redobre os cuidados com higiene'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/8.PNG', 
    descricao: 'NO transporte público, tente não ter contacto comoutras pessoas ou não pegar colectivos lotados. Evite levar as mãos ao rosto e redobre os cuidados com a higiene'
  ),
  PrevencaoModel(
    imagem: 'assets/Prevencao/9.PNG', 
    descricao: 'Evite efectuar viagens. COmo a viagem em geral é mais longa, o risco de exposição aumenta'
  ),
];