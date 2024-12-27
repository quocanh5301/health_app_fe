class StressCalculator {
  // Helper function to calculate RHR based on age
  static int calculateRHR(int age) {
    if (age >= 0 && age <= 1) return 105; // Average RHR for Newborn and Infants
    if (age > 1 && age <= 2) return 95; // Average RHR for Toddlers
    if (age > 2 && age <= 5) return 85; // Average RHR for Preschool
    if (age > 5 && age <= 11) return 75; // Average RHR for School-age
    if (age > 11 && age <= 15) return 65; // Average RHR for Adolescents
    if (age > 15 && age <= 64) return 65; // Average RHR for Adults
    if (age > 64) return 55; // Average RHR for Older Adults
    throw ArgumentError("Invalid age. Unable to calculate RHR.");
  }

  static Map<String, String> stressDescriptions = {
    "0-20": "Very Low Stress: You're in a relaxed and calm state. Keep it up!",
    "21-40": "Low Stress: Slight signs of stress, but overall manageable.",
    "41-60":
        "Moderate Stress: Noticeable stress levels. Consider taking short breaks.",
    "61-80":
        "High Stress: Elevated stress levels. Relaxation techniques are recommended.",
    "81-100":
        "Very High Stress: Critical stress levels. Immediate intervention may be needed."
  };

  static String getStressDescription(int stressPercentage) {
    if (stressPercentage >= 0 && stressPercentage <= 20) {
      return "Very Low Stress: You're in a relaxed and calm state. Keep it up!";
    } else if (stressPercentage >= 21 && stressPercentage <= 40) {
      return "Low Stress: Slight signs of stress, but overall manageable.";
    } else if (stressPercentage >= 41 && stressPercentage <= 60) {
      return "Moderate Stress: Noticeable stress levels. Consider taking short breaks.";
    } else if (stressPercentage >= 61 && stressPercentage <= 80) {
      return "High Stress: Elevated stress levels. Relaxation techniques are recommended.";
    } else if (stressPercentage >= 81 && stressPercentage <= 100) {
      return "Very High Stress: Critical stress levels. Immediate intervention may be needed.";
    } else {
      return "Invalid Stress Percentage";
    }
  }

  // Function to calculate stress level percentage
  static double calculateStressLevelPercentage(int age, int bpm) {
    final int rhr = calculateRHR(age); // Determine RHR based on age
    final int maxHeartRate = 220 - age; // Calculate Maximum Heart Rate (MHR)
    final int heartRateReserve =
        maxHeartRate - rhr; // Calculate Heart Rate Reserve (HRR)

    if (heartRateReserve <= 0) {
      throw ArgumentError(
          "Heart Rate Reserve (HRR) must be greater than zero.");
    }

    return ((bpm - rhr) / heartRateReserve) *
        100; // Calculate Stress Level Percentage
  }

  // // Function to determine stress category based on stress level percentage
  // static String determineStressCategory(double stressLevelPercentage) {
  //   if (stressLevelPercentage < 50) {
  //     return "Low stress (Relaxed state)";
  //   } else if (stressLevelPercentage >= 50 && stressLevelPercentage < 75) {
  //     return "Moderate stress (Alert or active)";
  //   } else {
  //     return "High stress (Anxious or overexerted)";
  //   }
  // }
}
