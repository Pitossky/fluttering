import 'question.dart';

class QuizComponents {

  int _questionNumber = 0;

  List<QuestionBank> _questionList = [
    QuestionBank(questionText: 'You can lead a cow down stairs but not up stairs.', questionAnswer: false),
    QuestionBank(questionText: 'Approximately one quarter of human bones are in the feet.', questionAnswer: true),
    QuestionBank(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    QuestionBank(questionText: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', questionAnswer: true),
    QuestionBank(questionText: 'It is illegal to pee in the Ocean in Portugal.', questionAnswer: true),
    QuestionBank(
        questionText: 'No piece of square dry paper can be folded in half more than 7 times.',
        questionAnswer: false),
    QuestionBank(
        questionText: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        questionAnswer: true),
    QuestionBank(
        questionText: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        questionAnswer: false),
    QuestionBank(
        questionText: 'The total surface area of two human lungs is approximately 70 square metres.',
        questionAnswer: true),
    QuestionBank(questionText: 'Google was originally called \"Backrub\".', questionAnswer: true),
    QuestionBank(
        questionText: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        questionAnswer: true),
    QuestionBank(
        questionText: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionList[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionList[_questionNumber].questionAnswer;
  }

  bool quizIsFinished(){
    if (_questionNumber >= _questionList.length - 1) {
      return true;
    }else{
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}