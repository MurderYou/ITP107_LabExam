import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Personal Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E5339),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  final String studentName = 'Mark James T. Punongbayan';
  final String professorName = 'Prof. Albert Alforja';
  final String examDate = 'September 3, 2026';

  // Color palette used throughout the screen.
  static const Color forestGreen = Color(0xFF2E5339);
  static const Color deepForest = Color(0xFF1B3322);
  static const Color amber = Color(0xFFC98A2C);
  static const Color paleAmber = Color(0xFFFBF1DF);
  static const Color mutedText = Color(0xFF5A6B5E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F6),
      body: CustomScrollView(
        slivers: [
          // ---- Gradient header with overlapping avatar ----
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [forestGreen, deepForest],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      'My Personal Portfolio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -45,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundColor: amber,
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 55)),

          // ---- Name + role ----
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  studentName,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: deepForest,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'BSIT Student  •  Mobile App Developer',
                  style: TextStyle(fontSize: 13, color: mutedText),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // ---- Skills as chips ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: const [
                  _SkillChip(label: 'Dart'),
                  _SkillChip(label: 'Flutter'),
                  _SkillChip(label: 'Java'),
                  _SkillChip(label: 'Kotlin'),
                  _SkillChip(label: 'UI Design'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 24)),

          // ---- Info row: education + course, side by side ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.school,
                      title: 'Education',
                      subtitle: 'Pamantasan ng Cabuyao\nCollege of IT',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.menu_book,
                      title: 'Course',
                      subtitle: 'ITP107\nMobile App Dev',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 24)),

          // ---- Gesture section, outlined style instead of filled ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: paleAmber, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Try the Gesture Button',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: deepForest,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Single tap, double tap, or long press — check the Debug Console.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: mutedText),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => print('Exam Date: $examDate'),
                      onDoubleTap: () => print('Professor Name: $professorName'),
                      onLongPress: () => print('Student Name: $studentName'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 36),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: amber, width: 2),
                        ),
                        child: const Text(
                          'Click Me',
                          style: TextStyle(
                            color: amber,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
        ],
      ),
    );
  }
}

/// Small pill-shaped chip used for the skills list.
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: PortfolioHomePage.paleAmber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: PortfolioHomePage.deepForest,
        ),
      ),
    );
  }
}

/// Compact icon + title + subtitle tile, used for education/course info.
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: PortfolioHomePage.forestGreen, size: 22),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: PortfolioHomePage.deepForest,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: PortfolioHomePage.mutedText),
          ),
        ],
      ),
    );
  }
}