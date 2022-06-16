class ImageConstants {
  String toSVG(String name) => 'assets/svg/$name.svg';
  String toPng(String name) => 'assets/images/$name.png';
  String toJPG(String name) => 'assets/images/$name.jpg';

  //PNG
  String get splash => toJPG('salus');

  //PNG
  String get image1 => toPng('image1');

  //SVG
  String get image2 => toSVG('image2');
}
