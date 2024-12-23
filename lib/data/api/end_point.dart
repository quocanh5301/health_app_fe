class Endpoints {
  static String login = 'authenticate/logIn';
  static String register = 'register/registerUser';
  static String changePass = 'register/registerUser';
  static String refreshToken = 'authenticate/refreshToken';

  static String getExercise = 'exercise/getExercises';
  static String getExerciseDetail = 'exercise/getExerciseDetail';
  static String markAsFavoriteExercise = 'exercise/markAsFavorite';
  static String getFavoriteExercise = 'exercise/getFavorites';

  static String getHeartRateData = 'heartRateData/getHeartRateData';
  static String saveHeartRateData = 'heartRateData/saveHeartRateData';
  static String deleteHeartRateData = 'heartRateData/deleteHeartRateData';

  static String getRunData = 'runData/getRunData';
  static String saveRunData = 'runData/saveRunData';
  static String deleteRunData = 'runData/deleteRunData';

  static String getHeartRateDataForLast7Days = 'heartRateData/getHeartRateDataForLast7Days';
  static String getRunDataForCurrentAndPreviousWeek = 'runData/getRunDataForCurrentAndPreviousWeek';
}