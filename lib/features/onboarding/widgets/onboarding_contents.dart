class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "DocConnect",
    image: "assets/images/onboarding/onboarding-3.png",
    desc:
        "Welcome to DocConnect – Easily Connect with Doctors and Book Your Appointments in Minutes!",
  ),
  OnboardingContents(
    title: "Connect with the Best Doctors",
    image: "assets/images/onboarding/onboarding-1.png",
    desc:
        "Choose from a list of specialists, ask your questions anytime, and receive expert advice whenever you need it.",
  ),
  OnboardingContents(
    title: "Book Your Appointment in a Snap",
    image: "assets/images/onboarding/onboarding-2.png",
    desc:
        "Select the medical specialty, pick a time that works for you, and get instant confirmation from the doctor.",
  ),
];
