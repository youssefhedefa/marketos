double calculateHeight({required bool isDrawerOpened,required double heightWhenDrawerOpened,required double heightWhenDrawerClosed}){
  return isDrawerOpened ? heightWhenDrawerOpened : heightWhenDrawerClosed;
}