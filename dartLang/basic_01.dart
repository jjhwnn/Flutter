main(){
  // 화면 출력
  print("Hello WOrld!");

  // 변수 선언
  String name = "Kim";
  var name1 = "Kim";
  var intNum1 = 1;
  dynamic name2 = 20;
  name2 = 20;

  // 정수
  int int1 = 30;
  int int2 = 20;
  print(int1 / int2); // / 연산자 : 나눗셈
  print(int1 % int2); // 나머지
  print(int1 ~/int2); // 몫

  // 문자열
  String str1 = '유비';
  String str2 = '장비';

  print(str1 + " : " + str2);

  // 문자열 보간법
  print("$str1 : $str2");

  // 문자열 보간 계산법 
  print("int1과 int2의 합은 ${int1 + int2} 입니다.");
}