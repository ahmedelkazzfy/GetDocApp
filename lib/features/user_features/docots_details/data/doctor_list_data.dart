class DoctorListData {
  DoctorListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<DoctorListData> hotelList = <DoctorListData>[
    DoctorListData(
      imagePath: "assets/images/doctors/doctor2.jpg",
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,
    ),
    DoctorListData(
      imagePath: "assets/images/doctors/doctor5.jpg",
      titleTxt: 'DR. Amanda Kaream',
      subTxt: 'Specialist in kids medicine',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 200,
    ),
    DoctorListData(
      imagePath: "assets/images/doctors/doctor4.jpg",
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 60,
    ),
    DoctorListData(
      imagePath: "assets/images/doctors/doctor3.jpg",
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    DoctorListData(
      imagePath: "assets/images/doctors/doctor1.jpg",
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
