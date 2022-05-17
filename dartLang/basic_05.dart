main(){
  //Function
  List<int> list = [1,3,5,7,9];
  int sum = 0;
  for(int i in list){
    sum += i;
  }
  print("합계 : $sum");

  List<int> list2 = [10,30,50,70,90];
  List<int> list1 = [1,3,5,7,9];

  // _ : private (변수 혹은 클래명 앞에 붙여줌 - 생략시 public)
  addList(List list) {
    int sum = 0;
    for(int i in list1){
      sum += i;
    }
    print("합계 : $sum");
  }

  int addList2(List list) {
    int sum = 0;
    for(int i in list1){
      sum += i;
    }
    return sum;
  }

  addList(list2);
  addList2(list1);

  int result = addList2(list2);
  print(result);
  
}

