# Online-Bulletin-Board-Web-Application
Description: Apache Tomcat 10.1.x 환경에서 JSP와 MySQL을 연동하여 학생 정보 관리 및 게시판 기능을 갖춘 웹 애플리케이션 개발.

## Key Achievements

### Database Integration
JDBC Driver를 설정하고, auto_increment 속성을 가진 테이블을 설계하여 데이터 무결성을 유지하며 게시글 데이터를 관리함.

### CRUD Implementation
my_board.jsp 모듈을 통해 사용자가 텍스트를 INSERT하고, 목록을 SELECT하며, 특정 ID의 게시글을 DELETE하는 Web Application의 핵심 기능을 독자적으로 구현함.

### Server Configuration 
server.xml의 `<Context>` 설정을 통해 웹 애플리케이션의 경로를 재설정하고, logging.properties를 수정하여 Encoding 문제(한글 깨짐 현상)를 해결하는 등 서버 최적화 작업을 수행함.

### Network & Logic
외부 서버와의 통신 상태를 확인하고, 연결 불가 시 로컬 데이터베이스로 우회하여 서비스를 지속하는 조건부 로직을 구현하여 애플리케이션의 가용성을 높임.

### Data Visualization 
HTML `<table>` 태그와 반복문을 활용하여 데이터베이스의 다중 레코드(학생 정보, 친구 목록, 수강 과목 등)를 표 형태로 구조화하여 출력함.
