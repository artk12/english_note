class Tense {
  String tense;
  String name;
  String persionName;
  String mainDescription;
  List<String> positiveExample;
  String positiveFormula;
  List<String> negativeExample;
  String negativeFormula;
  String negativeDescription;
  List<String> questionExample;
  String questionFormula;
  String questionDescription;

  Tense(
      {required this.tense,
      required this.name,
      required this.persionName,
      required this.mainDescription,
      required this.positiveExample,
      required this.positiveFormula,
      required this.negativeExample,
      required this.negativeFormula,
      required this.negativeDescription,
      required this.questionExample,
      required this.questionFormula,
      required this.questionDescription});

  factory Tense.formJson(Map parsedJson) {
    return Tense(
      tense: parsedJson['tense'],
      name: parsedJson['name'],
      persionName: parsedJson['persion_name'],
      mainDescription: parsedJson['description'],
      positiveExample: [
        parsedJson['ex1'],
        parsedJson['ex2'],
        parsedJson['ex3']
      ],
      positiveFormula: parsedJson['formula'],
      negativeExample: [
        parsedJson['ex4'],
        parsedJson['ex5'],
        parsedJson['ex6'],
      ],
      negativeFormula: parsedJson['negative_formula'],
      negativeDescription: parsedJson['negative_description'],
      questionExample: [
        parsedJson['ex7'],
        parsedJson['ex8'],
        parsedJson['ex9'],
      ],
      questionFormula: parsedJson['question_formula'],
      questionDescription: parsedJson['question_description'],
    );
  }
}
