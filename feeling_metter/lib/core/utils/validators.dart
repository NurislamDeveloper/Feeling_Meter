String getAdviceForStressLevel(double value) {
  if (value <= 25) return 'Relax, you’re doing great!';
  if (value <= 50) return 'You might want to take a short break.';
  if (value <= 75) return 'Consider relaxing activities.';
  return 'It’s time to unwind; focus on self-care.';
}
