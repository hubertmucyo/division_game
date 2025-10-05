import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const DivisionGame());
}

class DivisionGame extends StatelessWidget {
  const DivisionGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Division Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final Random _random = Random();
  int dividend = 1;
  int divisor = 1;
  int grade = 1;
  int questionCount = 0;
  int correctCount = 0;
  int wrongCount = 0;
  final TextEditingController _answerController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String feedback = "";

  int timeLeft = 10;
  Timer? _timer;
  bool isTimeUp = false;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    // generate questions similar to multiplication levels
    int a, b;
    switch (grade) {
      case 1:
        a = _random.nextInt(5) + 1;
        b = _random.nextInt(5) + 1;
        break;
      case 2:
        a = _random.nextInt(9) + 1;
        b = _random.nextInt(9) + 1;
        break;
      case 3:
        a = _random.nextInt(8) + 2;
        b = _random.nextInt(8) + 2;
        break;
      default:
        a = _random.nextInt(12) + 1;
        b = _random.nextInt(12) + 1;
    }
    dividend = a * b; // make sure it's divisible
    divisor = a;

    _answerController.clear();
    _answered = false;
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _focusNode.requestFocus();
    });
    _startTimer();
  }

  void _checkAnswer() {
    if (_answerController.text.isEmpty || isTimeUp || _answered) return;
    _answered = true;
    _timer?.cancel();
    int userAnswer = int.tryParse(_answerController.text) ?? 0;
    int correctAnswer = dividend ~/ divisor;

    setState(() {
      questionCount++;
      if (userAnswer == correctAnswer) {
        correctCount++;
        feedback = "✅ Correct!";
      } else {
        wrongCount++;
        feedback = "❌ Oops! Correct: $correctAnswer";
      }

      if (questionCount == 10) {
        _showLevelResult();
      } else {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) setState(() => feedback = "");
          _generateQuestion();
        });
      }
    });
  }

  void _showLevelResult() async {
    String resultMsg;
    if (correctCount >= 7 && grade < 20) {
      grade++;
      resultMsg = "Great job! You advance to Grade $grade.";
    } else if (correctCount < 4 && grade > 1) {
      grade--;
      resultMsg = "Try again! You go back to Grade $grade.";
    } else if (grade == 20) {
      resultMsg = "Congratulations! You've reached the highest grade!";
    } else {
      resultMsg = "You stay at Grade $grade.";
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Level Complete"),
        content: Text("Correct: $correctCount\nWrong: $wrongCount\n\n$resultMsg"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                questionCount = 0;
                correctCount = 0;
                wrongCount = 0;
                feedback = "";
                _generateQuestion();
              });
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }

  void _resetGame() {
    _timer?.cancel();
    setState(() {
      grade = 1;
      questionCount = 0;
      correctCount = 0;
      wrongCount = 0;
      feedback = "";
      _generateQuestion();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    timeLeft = _getTimeLimit();
    isTimeUp = false;
    _answered = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        if (_answered) return; // Prevent double-counting
        setState(() {
          isTimeUp = true;
          _answered = true;
          wrongCount++;
          feedback = "⏰ Time's up! Correct: ${dividend ~/ divisor}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) setState(() => feedback = "");
          if (questionCount == 10) {
            _showLevelResult();
          } else {
            _generateQuestion();
          }
        });
      }
    });
  }

  int _getTimeLimit() {
    if (grade <= 5) return 10;
    if (grade <= 10) return 15;
    if (grade <= 15) return 20;
    return 25;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Division Game",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Grade $grade",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 10),
                Text("Question: ${questionCount + 1}/10",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 10),
                Text("Correct: $correctCount   Wrong: $wrongCount",
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 10),
                Text("Time Left: $timeLeft s",
                    style: TextStyle(
                        fontSize: 18,
                        color: timeLeft <= 3 ? Colors.red : Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Text("$dividend ÷ $divisor = ?",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: 20),
                SizedBox(
                  width: 180,
                  child: TextField(
                    key: const Key('answerField'), // <-- Add this line
                    controller: _answerController,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Your Answer",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _checkAnswer(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  key: const Key('checkButton'), // <-- Add this line
                  onPressed: _checkAnswer,
                  child: const Text("Check"),
                ),
                const SizedBox(height: 20),
                Text(feedback,
                    style: TextStyle(
                        fontSize: 20,
                        color: feedback.startsWith("✅") ? Colors.green : Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
