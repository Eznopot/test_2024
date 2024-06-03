import 'package:quizz/model/question.dart';

final List<Question> questions = [
    Question(
      text: "A quoi sert la solution Epseed ?",
      answers: [
        "Sécuriser les ordinateurs n'importe où",
        "Sécuriser les téléphones au travails",
        "Sécuriser les ordinateurs au travail"
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
        "Epitech"
      ],
      correctIndex: 1,
    ),
    Question(
      text: "Tu veux un stage à Epseed ?",
      answers: ["Oui", "Non"],
      correctIndex: 0,
    )
  ];