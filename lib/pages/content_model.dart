class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: '롤링페이퍼를 \n만들어볼까요?',
      image: 'assets/onboarding_letter.png',
      discription: "화분 모양의 롤링페이퍼를\n"
          "정해진 시간에 전달할 수 있어요"),
  UnbordingContent(
      title: '화분 만들기',
      image: 'assets/onboarding_vase.png',
      discription: "화분은 작성된 잎편지들을\n"
          "모아서 전달하는 역할을 해요"),
  UnbordingContent(
      title: '잎편지 쓰기',
      image: 'assets/onboarding_letter.png',
      discription: "잎편지에 전하고 싶은\n"
          "감사의 말을 작성하세요"),
];
