main() {
  // 동기처리 방식 : a,b,c 가 순서대로 차근차근 작업을 수행

  checkVersion();
  print('End process');
}

// 비동기처리 방식 : a, b, c가 한번에 같이 작업을 수행
// -> 작업이 끝나는 순서를 정하는게 어려움 -> await : 모든 프로세스가 끝날 때까지 기다려줌
// Future async await 는 한 세트
Future checkVersion() async {
  var version = await lookupVersion();
  print(version);
}

int lookupVersion() {
  return 12;
}
