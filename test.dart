main(){
  String displayCharacter = "Hello";
  String character;
  List str = [];

  str = displayCharacter.split('');
  print(str);
  character = str[0];
  character += str[1];
  character += str[2];
  print(str[0]);

  print(character);
}