import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:html' as html;

void main() {
  runApp(const DivisionGame());
}

class DivisionGame extends StatelessWidget {
  const DivisionGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ben 10 Division Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 800 ? screenWidth * 0.92 : 700.0;
    final welcomeImageWidth = (screenWidth * 0.6).clamp(240.0, 450.0);
    final welcomeImageHeight = welcomeImageWidth * 0.67;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade900,
              Colors.green.shade700,
              Colors.black87,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: cardWidth,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
                border: Border.all(color: Colors.green.shade700, width: 5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title with Ben 10 style
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'BEN 10',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 8
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        'BEN 10',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade500,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.greenAccent,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'DIVISION CHALLENGE',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Ben 10 Welcome Image
                  Container(
                    width: welcomeImageWidth,
                    height: welcomeImageHeight,
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.shade600, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/ben10_welcome.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, err, st) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, size: 80, color: Colors.green.shade300),
                            const SizedBox(height: 10),
                            const Text(
                              'Ben 10 Welcome Image\n450x300px',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Mission Brief
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green.shade100, Colors.green.shade50],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green.shade400, width: 3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.flash_on, color: Colors.green.shade700, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              'MISSION BRIEFING',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade800,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(Icons.flash_on, color: Colors.green.shade700, size: 30),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '🎯 Solve 10 division problems per level\n'
                          '⚡ Beat the timer to advance grades\n'
                          '🏆 Get 7+ correct to level up\n'
                          '💪 Prove you\'re the ultimate hero!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Start Button - Ben 10 Omnitrix style
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.6),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const GamePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(30),
                        elevation: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow, size: 50, color: Colors.white),
                          const SizedBox(height: 5),
                          const Text(
                            'START',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Main Game Screen
class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin {
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

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _generateQuestion();
  }

  void _generateQuestion() {
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
    dividend = a * b;
    divisor = a;

    _answerController.clear();
    _answered = false;
    setState(() {
      feedback = "";
    });
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
        feedback = "✅ CORRECT!";
      } else {
        wrongCount++;
        feedback = "❌ WRONG! Answer: $correctAnswer";
      }

      if (questionCount == 10) {
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) _showLevelResult();
        });
      } else {
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            _generateQuestion();
          }
        });
      }
    });
  }

  void _showLevelResult() async {
    String resultMsg;
    String resultEmoji;
    Color resultColor;

    if (correctCount >= 7 && grade < 20) {
      grade++;
      resultMsg = "LEVEL UP! You advance to Grade $grade!";
      resultEmoji = "🎉";
      resultColor = Colors.green;
    } else if (correctCount < 4 && grade > 1) {
      grade--;
      resultMsg = "Keep training! You return to Grade $grade.";
      resultEmoji = "💪";
      resultColor = Colors.orange;
    } else if (grade == 20) {
      resultMsg = "ULTIMATE HERO! You've mastered all grades!";
      resultEmoji = "🏆";
      resultColor = Colors.amber;
    } else {
      resultMsg = "Good effort! You stay at Grade $grade.";
      resultEmoji = "⚡";
      resultColor = Colors.blue;
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, resultColor.withOpacity(0.1)],
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: resultColor, width: 4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                resultEmoji,
                style: const TextStyle(fontSize: 60),
              ),
              const SizedBox(height: 15),
              Text(
                "MISSION COMPLETE",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem("✅ Correct", correctCount, Colors.green),
                        _buildStatItem("❌ Wrong", wrongCount, Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                resultMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'CONTINUE MISSION',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, int value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
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
        if (_answered) return;
        setState(() {
          isTimeUp = true;
          _answered = true;
          wrongCount++;
          feedback = "⏰ TIME'S UP! Answer: ${dividend ~/ divisor}";
          questionCount++;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => feedback = "");
            if (questionCount == 10) {
              _showLevelResult();
            } else {
              _generateQuestion();
            }
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
    _pulseController.dispose();
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 600;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade800,
              Colors.green.shade600,
              Colors.black87,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 12 : 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade700, Colors.green.shade900],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left character image
                    Container(
                      width: isSmallScreen ? 50 : 70,
                      height: isSmallScreen ? 50 : 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.greenAccent, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ben10_character.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) => Icon(
                            Icons.person,
                            size: isSmallScreen ? 25 : 35,
                            color: Colors.green.shade300,
                          ),
                        ),
                      ),
                    ),

                    // Title
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'BEN 10',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 24 : 32,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = isSmallScreen ? 3 : 4
                                  ..color = Colors.black,
                              ),
                            ),
                            Text(
                              'BEN 10',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 24 : 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'DIVISION',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 12 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),

                    // Right alien image
                    Container(
                      width: isSmallScreen ? 50 : 70,
                      height: isSmallScreen ? 50 : 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.greenAccent, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/ben10_alien.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) => Icon(
                            Icons.stars,
                            size: isSmallScreen ? 25 : 35,
                            color: Colors.green.shade300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Info Bar
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 8 : 12,
                  horizontal: 12,
                ),
                color: Colors.black.withOpacity(0.3),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInfoChip('GRADE', '$grade', Colors.yellow, isSmallScreen),
                    _buildInfoChip('Q', '${questionCount + 1}/10', Colors.blue, isSmallScreen),
                    _buildInfoChip('✅', '$correctCount', Colors.green, isSmallScreen),
                    _buildInfoChip('❌', '$wrongCount', Colors.red, isSmallScreen),
                  ],
                ),
              ),

              // Main Content Area - Scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  child: Center(
                    child: Container(
                      width: isSmallScreen ? screenSize.width * 0.95 : 600,
                      margin: const EdgeInsets.all(16),
                      padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(color: Colors.green.shade600, width: 4),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Timer - Omnitrix style
                          ScaleTransition(
                            scale: timeLeft <= 3
                                ? _pulseAnimation
                                : const AlwaysStoppedAnimation(1.0),
                            child: Container(
                              padding: EdgeInsets.all(isSmallScreen ? 12 : 18),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(
                                  colors: timeLeft <= 3
                                      ? [Colors.red, Colors.red.shade900]
                                      : [Colors.green, Colors.green.shade700],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (timeLeft <= 3 ? Colors.red : Colors.green)
                                        .withOpacity(0.6),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                    size: isSmallScreen ? 30 : 40,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '$timeLeft',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 28 : 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'sec',
                                    style: TextStyle(
                                      fontSize: isSmallScreen ? 10 : 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 20 : 30),

                          // Question
                          Container(
                            padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.green.shade50, Colors.green.shade100],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.green.shade400, width: 3),
                            ),
                            child: Text(
                              '$dividend ÷ $divisor = ?',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 36 : 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 20 : 30),

                          // Answer Input
                          Container(
                            width: isSmallScreen ? 180 : 220,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              key: const Key('answerField'),
                              controller: _answerController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 24 : 32,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                labelText: "Your Answer",
                                labelStyle: TextStyle(color: Colors.green.shade700),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade600,
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade600,
                                    width: 3,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.green.shade800,
                                    width: 3,
                                  ),
                                ),
                              ),
                              onSubmitted: (_) => _checkAnswer(),
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 18 : 25),

                          // Check Button
                          ElevatedButton(
                            key: const Key('checkButton'),
                            onPressed: _checkAnswer,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 35 : 50,
                                vertical: isSmallScreen ? 14 : 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              elevation: 8,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: isSmallScreen ? 24 : 28,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'CHECK',
                                  style: TextStyle(
                                    fontSize: isSmallScreen ? 20 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: isSmallScreen ? 18 : 25),

                          // Feedback
                          if (feedback.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: feedback.startsWith("✅")
                                    ? Colors.green.shade100
                                    : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color:
                                      feedback.startsWith("✅") ? Colors.green : Colors.red,
                                  width: 3,
                                ),
                              ),
                              child: Text(
                                feedback,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 18 : 22,
                                  fontWeight: FontWeight.bold,
                                  color: feedback.startsWith("✅")
                                      ? Colors.green.shade800
                                      : Colors.red.shade800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Controls - Always visible
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 10 : 16,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade700, Colors.green.shade900],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _resetGame,
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: isSmallScreen ? 18 : 20,
                      ),
                      label: Text(
                        'RESTART',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade600,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12 : 20,
                          vertical: isSmallScreen ? 10 : 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        html.window.location.href = 'https://hubertmucyo.github.io/gamify';
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: isSmallScreen ? 18 : 20,
                      ),
                      label: Text(
                        'EXIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 12 : 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12 : 20,
                          vertical: isSmallScreen ? 10 : 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label, String value, Color color, bool isSmall) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 8 : 12,
        vertical: isSmall ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 10 : 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isSmall ? 14 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}