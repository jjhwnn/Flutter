main(){
  int? num1 = null;
  print(num1);
  num1 ??= 8; // num1이 Null이면 8을 대입함
  print(num1);

  // 삼항 연산자 -> 화면 디자인시에도 사용함
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);

  int sum = 10;
  for(int i=1; i <= 10; i++){
    sum += i;
  }
  print(sum);

  List<int> numList = [1,2,5,6,8];
  for(int i in numList){
    sum+=i;
  }
  print(sum);
  
}