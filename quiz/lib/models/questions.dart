class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}

const List<QuestionModel> questions = [
  QuestionModel(
      question: '1.who is capital of france',
      correctAnswerIndex: 1,
      options: ['a)2', 'b)marid', 'c)4', 'd)5']),
  QuestionModel(
      question:
          '2.which of the following device can store large amount of data',
      correctAnswerIndex: 2,
      options: ['a)floppy disk', 'b)razip disk', 'c)hard disk', 'd)COROM']),
  QuestionModel(
      question: '3.Computer memeory consists of',
      correctAnswerIndex: 4,
      options: ['a)RAM', 'b)ROM', 'c)PROM', 'd)All of the above']),
  QuestionModel(
      question: '4.Which transforms one interface to another',
      correctAnswerIndex: 2,
      options: ['a)program', 'b)computer', 'c)software', 'd)none']),
  QuestionModel(
      question: '5.which of the following not rational number',
      correctAnswerIndex: 2,
      options: ['a)0', 'b)-3', 'c)3/0', 'd)-3/4']),
  QuestionModel(
      question:
          '6.i eat grass and i provide milk to human beings i have 4 legs',
      correctAnswerIndex: 1,
      options: ['a)dog', 'b)cow', 'c)monkey', 'd)cat']),
];
