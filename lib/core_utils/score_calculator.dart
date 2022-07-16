int calculateListeningScore(int numberOfCorrect) {
  if (numberOfCorrect == 0) return 5;
  if (numberOfCorrect >= 96) return 495;
  if (numberOfCorrect >= 76) return (numberOfCorrect + 2) * 5 + 5;
  return (numberOfCorrect + 2) * 5;
}

int calculateReadingScore(int numberOfCorrect) {
  if (numberOfCorrect <= 2) return 5;
  if (numberOfCorrect >= 100) return 495;
  return (numberOfCorrect - 1) * 5;
}
