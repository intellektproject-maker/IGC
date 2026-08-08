import 'package:flutter/material.dart';

import '../models/student_dashboard_model.dart';

class DashboardBody extends StatelessWidget {
  final StudentDashboardModel student;

  const DashboardBody({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          90,
          20,
          100,
        ),
        child: Column(
          children: [
            _HeroCard(student: student),

            const SizedBox(height: 16),

            const _GoalCard(),

            const SizedBox(height: 16),

            const _MissionCard(),

            const SizedBox(height: 16),

            const _ProgressCard(),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final StudentDashboardModel student;

  const _HeroCard({
    required this.student,
  });

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${getGreeting()} 👋",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Color(0xff000351),
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),

                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      student.level,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "Active",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "🔥 ${student.xp}",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000351),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Daily Streak",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "#${student.rank}",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000351),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "Current Rank",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Divider(
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _StatItem(
                  title: "Score",
                  value: student.score.toString(),
                ),
              ),

              Expanded(
                child: _StatItem(
                  title: "Rank",
                  value: "#${student.rank}",
                ),
              ),

              Expanded(
                child: _StatItem(
                  title: "Projects",
                  value: student.projects.toString(),
                ),
              ),

              Expanded(
                child: _StatItem(
                  title: "Skills",
                  value: student.skillPoints.toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff000351),
          ),
        ),

        const SizedBox(height: 6),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.flag_rounded,
                color: Color(0xff000351),
              ),
              SizedBox(width: 8),
              Text(
                "Next Goal",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Complete 2 Innovation Challenges",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 24),

          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const LinearProgressIndicator(
              value: 0.60,
              minHeight: 10,
              backgroundColor: Color(0xffE9EDF5),
              valueColor: AlwaysStoppedAnimation(
                Color(0xff000351),
              ),
            ),
          ),

          const SizedBox(height: 14),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "12 / 20 Tasks Completed",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "60%",
                style: TextStyle(
                  color: Color(0xff000351),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              label: const Text("View Details"),
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  const _MissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.task_alt,
                color: Color(0xff000351),
              ),
              SizedBox(width: 8),
              Text(
                "Today's Mission",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _MissionTile(
            title: "Complete AI Quiz",
            subtitle: "Completed",
            completed: true,
          ),

          const SizedBox(height: 14),

          _MissionTile(
            title: "Submit Innovation Idea",
            subtitle: "60% Completed",
            completed: false,
          ),

          const SizedBox(height: 14),

          _MissionTile(
            title: "Upload Project Proposal",
            subtitle: "Pending",
            completed: false,
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text("View All"),
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool completed;

  const _MissionTile({
    required this.title,
    required this.subtitle,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          completed
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.insights,
                color: Color(0xff000351),
              ),
              SizedBox(width: 8),
              Text(
                "Innovation Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _ProgressItem(
                  title: "Level",
                  value: "IV",
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  title: "XP",
                  value: "845",
                ),
              ),
              Expanded(
                child: _ProgressItem(
                  title: "Projects",
                  value: "8",
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const LinearProgressIndicator(
              value: 0.72,
              minHeight: 12,
              backgroundColor: Color(0xffE9EDF5),
              valueColor: AlwaysStoppedAnimation(
                Color(0xff000351),
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "72% to Level V",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff000351),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final String value;

  const _ProgressItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff000351),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}