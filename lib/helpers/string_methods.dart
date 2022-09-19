// Variables
double btnScaleValue = 1;

// Showing elements UI delay
int delay = 300;

// email RegExp
RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// Capitalize Strings in sentences
capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  // in case of last letter is " " it makes an error so first :
  if (text[text.length - 1] == " ") {
    return text.trim().split(' ').map((word) {
      return "${word[0].toUpperCase()}${word.substring(1)} ";
    }).join(' ');
  }
  //
  return text.split(' ').map((word) {
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
