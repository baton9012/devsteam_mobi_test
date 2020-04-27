class ImagesInfo {
  String _smallImageUrl;
  String _fullImageUrl;
  String _first_name_user;
  String _name_image;

  ImagesInfo(this._first_name_user, this._name_image, this._smallImageUrl, this._fullImageUrl);

  String get smallImageUrl => _smallImageUrl;
  String get fullImageUrl => _fullImageUrl;
  String get firstNameUser => _first_name_user;
  String get nameImage => _name_image;
}