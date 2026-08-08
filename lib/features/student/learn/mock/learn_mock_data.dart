import '../models/training_model.dart';

class LearnMockData {
  LearnMockData._();

  static final List<TrainingModel> trainings = [

    TrainingModel(
      id: "L001",
      title: "AI Architectures",
      description:
      "Advanced AI architectures for Smart Infrastructure and Intelligent Systems.",
      type: "expert",
      status: "in_progress",
      xp: 200,
      progress: 0.55,
      duration: "2 Hours",
      instructor: "Dr. Arun Kumar",
      image: "assets/images/learn/ai_architecture.png",
      certificateAvailable: false,
      mandatory: true,
    ),

    TrainingModel(
      id: "L002",
      title: "Robotics",
      description:
      "Industrial robotics and collaborative automation systems.",
      type: "expert",
      status: "pending",
      xp: 180,
      progress: 0.0,
      duration: "3 Hours",
      instructor: "Prof. Rahul Sharma",
      image: "assets/images/learn/robotics.png",
      certificateAvailable: false,
      mandatory: true,
    ),

    TrainingModel(
      id: "L003",
      title: "Smart Infrastructure",
      description:
      "IoT, Smart Cities and Intelligent Infrastructure.",
      type: "expert",
      status: "in_progress",
      xp: 180,
      progress: 0.30,
      duration: "2 Hours",
      instructor: "Dr. Meena Krishnan",
      image: "assets/images/learn/smart_infra.png",
      certificateAvailable: false,
      mandatory: true,
    ),

    TrainingModel(
      id: "L004",
      title: "Prompt Engineering",
      description:
      "Build professional prompts for AI applications.",
      type: "masterclass",
      status: "in_progress",
      xp: 250,
      progress: 0.80,
      duration: "6 Weeks",
      instructor: "Mr. Suresh Kumar",
      image: "assets/images/learn/prompt_engineering.png",
      certificateAvailable: false,
      mandatory: false,
    ),

    TrainingModel(
      id: "L005",
      title: "ROS Systems",
      description:
      "Robot Operating System for intelligent robotics.",
      type: "masterclass",
      status: "completed",
      xp: 300,
      progress: 1.0,
      duration: "8 Weeks",
      instructor: "Dr. Vignesh",
      image: "assets/images/learn/ros.png",
      certificateAvailable: true,
      mandatory: false,
    ),

    TrainingModel(
      id: "L006",
      title: "Industrial Automation",
      description:
      "PLC, SCADA and Industry 4.0 implementation.",
      type: "masterclass",
      status: "in_progress",
      xp: 350,
      progress: 0.65,
      duration: "8 Weeks",
      instructor: "Mr. Prakash",
      image: "assets/images/learn/automation.png",
      certificateAvailable: false,
      mandatory: false,
    ),

    TrainingModel(
      id: "L007",
      title: "Data Analytics",
      description:
      "Python, SQL and Data Visualization.",
      type: "masterclass",
      status: "completed",
      xp: 220,
      progress: 1.0,
      duration: "5 Weeks",
      instructor: "Dr. Priya",
      image: "assets/images/learn/data_analytics.png",
      certificateAvailable: true,
      mandatory: false,
    ),
  ];
}