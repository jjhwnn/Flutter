main() {

  ThreeKingdoms threeKingdoms = ThreeKingdoms();
  print(threeKingdoms.name);
  threeKingdoms.sayName();

  ThreeKingdoms2 threeKingdoms2 = ThreeKingdoms2("유비", "촉");
  threeKingdoms2.saySomething();

} // main

class ThreeKingdoms{
  // Field
  String name = '유비';

  // Constructor

  // Method or Function
  sayName(){
    // this : field 명을 가리킴
    print("내 이름은 ${this.name} 입니다.");
  }
}

class ThreeKingdoms2 {
  // Field
  // 선언만 해줘야 할때 : late or 자료형앞에 ?
  late String name;
  String? nation;

  // constructor (필드 초기화 생성자)*********
  ThreeKingdoms2(String name, String nation)
  : this.name = name,
    this.nation = nation;

  // Method
  saySomething(){
    print('제 이름은 ${this.name}이고 조국은 ${this.nation}입니다.');

  }



}