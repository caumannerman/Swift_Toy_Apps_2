# Swift_Toy_Apps_2

# 1. Brewery 앱

> ## 1.1. URLSession
Foundation에서 기본 제공하는 Class. HTTP포함 OSI(Open System INterconnection)7계층의 Protocol을 지원
네트워크 인증, 쿠키, 캐시 관리 등 지원 

> ## 1.1.1 URLSession LifeCycle
![IMG_7F92C200D7D0-1](https://user-images.githubusercontent.com/75043852/163135717-6277f074-e57f-48e5-b040-c77073b9b744.jpeg)





# 4. CreditCardListApp (신용카드 추천 앱) using Firebase RealTime Database
<p>
<img width="200" alt="3" src="https://user-images.githubusercontent.com/75043852/160754227-13101c08-2a29-4d65-9c40-bd54350e6f4e.png">
 <img width="200" alt="6" src="https://user-images.githubusercontent.com/75043852/160754502-c8d37544-3bf2-4911-a5e7-94277e789c7a.PNG">
  <img width="200" alt="7" src="https://user-images.githubusercontent.com/75043852/160754591-2113ab7d-03c0-476c-b337-6f9b787372a0.PNG">
 <img width="200" alt="4" src="https://user-images.githubusercontent.com/75043852/160754382-abeeb832-a374-4fb4-adee-6f7b0f82e8af.PNG">
 <img width="200" alt="5" src="https://user-images.githubusercontent.com/75043852/160754467-235dfec6-910e-4130-b809-004622a5af02.PNG">
</p>
<img width="400" alt="1" src="https://user-images.githubusercontent.com/75043852/160754702-cee11c76-9bd4-4a2b-95b6-fbe87ec33999.png">
<img width="400" alt="2" src="https://user-images.githubusercontent.com/75043852/160754708-fed5fbca-afd1-4098-bf28-842dd6371fed.png">

# 5. 물마시기 알림 앱 

### 5-1. UNNotificationRequest (User Notification)

##### identifier 작성해주어야 함 .(UUID 와 같은)
##### UNMutableNotificationContent - 알림에 나타날 내용들을 정의  (ex. Content.title, Content.body ... 뱃지, 소리 등 ..)
##### Trigger( 어떤 조건에서 알림을 발생시킬지 ) - Calendar(날짜 기준), TimeInterval(시간 간격으로), Location(위치 기준)..

Request들은 UNNotificationCenter에 저장되어있다가, 조건에 부합하는 순간에 Trigger

### 5-2. UserDefaults 사용 ( Notification들을 저장 )

<img width="707" alt="스크린샷 2022-03-30 오후 5 45 36" src="https://user-images.githubusercontent.com/75043852/160790624-9d1f2ad9-8179-424d-95b8-7b447b676329.png">

##### -> UserDefaults는 싱글톤 패턴으로 설계되어, 앱 전체에서 "하나의 instance"만 존재한다!
##### -> 추가: UserDefaults.standard.set(~~, forkey: "key")와 같이
##### -> 가져오기: let year = UserDefaults.standard.integer(forKey: "year")
##### -> 삭제: UserDefaults.standard.removeObject(forKey: "age")


