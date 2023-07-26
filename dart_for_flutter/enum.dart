enum SocialMedia { // enum are classes and must be outside of main.
  facebook, // 0
  youtube, // 1
  instagram // 2
}

void main(){
  SocialMedia socialMedia = SocialMedia.facebook;

  switch(socialMedia){
    case SocialMedia.facebook:
      print('hello facebook ${SocialMedia.facebook.index}');
      return;
    case SocialMedia.youtube:
      print('hi youtube');
      return;
    case SocialMedia.instagram:
      print('hi story');
      return;
    default:
      print('default');
  }
}