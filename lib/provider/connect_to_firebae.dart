import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectToFirebase {
  CollectionReference lyrics = FirebaseFirestore.instance.collection('Быстрые');

  Future<DocumentSnapshot<Object?>> addUser() {
    // Call the user's CollectionReference to add a new user
    return lyrics.doc('Быстрые').get();
  }

  Future addLyrics(String value) {
    return lyrics
        .doc('ROoUtWpsEqf3awBntHKj')
        .update({
          'Lyrics': value
//         {
//           'Lyrics': '''
//             Am       F
// Ты ярче солнца, и выше гор.\n
//            Am      C      G
// Ты глубже моря, Творец всего.\n
//          Am         C/E    F
// Ты утвердил меня в путях моих.\n
//           Dm      F         D/F#    F
// Сомнения все забрал, меня благословил.\n
//
// Припев:\n
//      C         G
// Ты Альфа и Омега, Начало и Конец.\n
// Am                     F
// Ты Первый и Последний, Великий мой Творец.\n
// C                 G
// Мою победу в скорби, предвидел ты давно.\n
// Am                  F
// Я убеждаюсь больше, что я с Тобой одно.\n
// \n
// Проигрыш: F G Am C\n
//           Am             F
// Мое свершение в руках Твоих.\n
//            Am        C     G
// Ты Царь победы, Творец всего.\n
//            Am        C/E      F
// В исходе всех путей моей судьбы\n
//        Dm     F        D/F#    F
// Ты сила и скала, сражения моего.'''
//         }
        })
        .then((value) => print('data'))
        .catchError((error) => print(error));
  }
}
