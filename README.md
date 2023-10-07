# 내일배움캠프 앱 개발 심화 개인과제

1. UserDefaults 와 CoreData 의 차이점
  - UserDefaults 는 Key 와 Value 를 사용해서 데이터를 저장하고, 사용자가 정의한 객체를 저장하기 위해서는 Codable 프로토콜을 채택한 뒤 NSData 객체로 변환해서 저장해야한다.
  - CoreData 는 Entity 데이터를 객체로 만들어서 사용하기 때문에, UserDefaults 보다 쉽게 사용자가 정의한 클래스 데이터를 관리할 수 있다.
