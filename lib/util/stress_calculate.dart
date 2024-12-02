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

  // Function to calculate stress level percentage
  static double calculateStressLevelPercentage(int age, int bpm) {
    final int rhr = calculateRHR(age); // Determine RHR based on age
    final int maxHeartRate = 220 - age; // Calculate Maximum Heart Rate (MHR)
    final int heartRateReserve = maxHeartRate - rhr; // Calculate Heart Rate Reserve (HRR)

    if (heartRateReserve <= 0) {
      throw ArgumentError("Heart Rate Reserve (HRR) must be greater than zero.");
    }

    return ((bpm - rhr) / heartRateReserve) * 100; // Calculate Stress Level Percentage
  }

  // Function to determine stress category based on stress level percentage
  static String determineStressCategory(double stressLevelPercentage) {
    if (stressLevelPercentage < 50) {
      return "Low stress (Relaxed state)";
    } else if (stressLevelPercentage >= 50 && stressLevelPercentage < 75) {
      return "Moderate stress (Alert or active)";
    } else {
      return "High stress (Anxious or overexerted)";
    }
  }
}
