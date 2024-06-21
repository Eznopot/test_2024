import 'package:quizz/model/question.dart';

final List<Question> questions = [
  Question(
    text: "A quoi sert la solution Epseed ?",
    answers: [
      "Sécuriser le travail a distance depuis n'importe quelle ordinateur",
      "Sécuriser les téléphones utiliser dans le cadre professionel",
      "Sécuriser les plantes"
    ],
    correctIndex: 0,
  ),
  Question(
    text: "Qui n'est pas partenaire d'Epseed ?",
    answers: [
      "BPI France",
      "Horsinergia",
      "Nice Startup",
      "Cimgestion",
      "Microsoft"
    ],
    correctIndex: 4,
  ),
  Question(
    text: "Une seed c'est quoi ?",
    answers: [
      "Un triangle",
      "Un petit appareil conçu pour les entreprises, en particulier les petites et moyennes entreprises, où les employés utilisent leurs propres ordinateurs personnels pour travailler. Il permet aux utilisateurs d'accéder en toute sécurité à leur environnement de travail et à leurs fichiers depuis n'importe quel ordinateur en le branchant simplement via USB.",
      "Pas compris",
    ],
    correctIndex: 1,
  ),
];
