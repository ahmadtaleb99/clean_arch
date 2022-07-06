class SliderPageObject {
  final String title;
  final String subTitle;
  final String image;

  SliderPageObject(this.title, this.subTitle, this.image);
}

class SliderPageViewObject{


  SliderPageObject sliderPageObject;
  int numberOfPages;
  int currentPageIndex;

  SliderPageViewObject(
      this.sliderPageObject, this.numberOfPages, this.currentPageIndex);
}
