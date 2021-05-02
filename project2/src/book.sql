DROP TABLE BOOK
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BOOK;

CREATE TABLE BOOK (
    BOOKNUM NUMBER CONSTRAINT PK_BOOK_01 PRIMARY KEY,
    BOOKTITLE VARCHAR2(100),
    CATEGORIES NUMBER,
    BOOKREADCOUNT NUMBER,
    BOOKDEL NUMBER,
    GRADE NUMBER,
    AUTHOR VARCHAR2(100),
    ISSUEDATE DATE,
    BOOKHEADER VARCHAR2(4000),
    PUBLISHER VARCHAR2(100), 
    BOOKIMAGE VARCHAR2(100)
);


CREATE SEQUENCE SEQ_BOOK
START WITH 10000
INCREMENT BY 1;


SELECT * FROM BOOK;


-- DB추가 (1차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '고스트 인 러브', 100, 0, 0, 9.8, '마르크 레비 저/이원희 역', '2021-03-22', '사랑에 빠진 아버지 유령,
생의 소원을 이루기 위해 아들 앞에 나타나다!
매-프랑스 베스트셀러 등극,
세계에서 가장 많이 읽히는 프랑스 작가 마르크 레비 신작 장편소설', '작가정신', '98137764');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '모든 비밀에는 이름이 있다', 200, 0, 0, 8.0, '서미애 저', '2021-03-22', '연쇄살인범 이병도와의 사건이 벌어진 지 5년. 열여섯 살이 된 하영은 지속적으로 심리 상담을 받으며 그때의 트라우마를 극복하기 위해 애써왔지만 사춘기에 접어들며 여전히 혼란스러운 시간을 보낸다. 갑작스러운 이사까지 겹 예민해진 하영은 전학을 간 학교에서 벌어지는 폭력에 새로운 자극을 받기 시작한다. 자신의 그림자와 직면하게 된 하영은 과연 어떤 선택을 내리게 될 것인가?', '엘릭시르 ', '98353931');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '소설 보다 : 봄 2021', 200, 0, 0, 9.3, '김멜라, 나일선, 위수정 저', '2021-03-16', '[봄과 함께 찾아 온 소설의 새로운 풍경] <소설 보다> 시리즈가 봄을 맞아 새로이 옷을 갈아입고 찾아왔다. 이 계절이 주목한 작가는 김멜라, 나일선, 위수정이다. 펜데믹 시대의 불안과 소외된 존재들을 다시금 상기시키며 지금 이곳에 필요한 이야기를 전한다.', '문학과지성사 ', '98397454');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '어둠 속에서도 바다는 푸르다 1', 200, 0, 0, 9.6, '이철환 저', '2021-03-15', '세계를 덮친 코로나19가 일상을 송두리째 바꿔놓았다. 어쩔 수 없이 사람을 피해야 하고, 옆 사람을 감시하는 상황이 1-넘게 이어지면서 사람들의 피로감도 늘어가고 있다. 최근 그런 우리 사회를 따뜻하게 만든 뉴스가 있다. 어려운 형제에게 값을 받지 않고 치킨을 대접한 어느 치킨집에 관한 이야기다. 형제가 감사의 마음을 담아 쓴 손편지는 수많은 사람의 심금을 울렸다. 인정(人情)을 찾아보기 어려워진 사회지만, 그럼에도 사람들은 마음속 깊이 옛 이웃들의 따뜻한 정을 그리워하고 있었던 것이다. 특히 ‘거리두기 시대’를 맞이하며 이웃을 보듬기보단 피하게 되었기에 더더욱 인간애에 목말라 있다.', '특별한서재', '97813510');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '별들은 여름에 수군대는 걸 좋아해', 100, 0, 0, 10.0, '코이코이족, 산족 저/W. H. 블리크 편/이석호 역', '2021-03-02', '아프리카 코이코이족과 산족에서 이어져 내려온 이야기를 담은 시집. 최초의 감각과 공생의 세계관 그리고 자연과의 관계를 노래한다. 그 속엔 “부시먼”이라는 납작한 단어로 결코 대체될 수 없는 귀한 이야기가 숨어 있다. 각박한 현실에 지쳐 있는 우리에게 이 시는 한 숨의 영혼을 불어넣는다.', '갈라파고스', '97676465');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '자살일기', 100, 0, 0, 9.7, '파블로다니엘', '2021-03-15', '“날개마저 부러진 다리 없는 새는
적막하게 홀로 하늘을 바라볼 뿐이었다”
슬픔 속에 머무는 모든 이를 위한 65편의 시', '나슬', '98141980');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '야운하시곡', 200, 0, 0, 9.7, '하지은, 호인, 이재만, 김이삭, 한켠 저 외 2명', '2021-03-12', '『얼음나무 숲』의 하지은을 비롯해 한켠, 김이삭 등 젊은 장르 작가의 손끝에서 옛이야기가 현대적으로 재탄생했다. 역사 속 인물과 민담을 재해석한 동양풍의 단편소설을 한데 묶었다. 무협, SF, 호러 등 다채로운 장르의 조합으로 한시라도 지루할 틈이 없다.', '황금가지', '98467679');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리는 이 별을 떠나기로 했어', 200, 0, 0, 0, '천선란, 박해울, 박문영, 오정연, 이루카 저', '2021-03-02', '세계 여성의 날을 맞아 SF의 우아한 계보를 잇는 여성 작가 5인이 모여 ‘여성만의 우주‘를 그렸다. 소설 속 여성들은 제한된 시공간을 탈주하고 행성 시대의 새로운 공동체를 치열하게 고민한다. 그들의 상상력을 이 땅에 붙잡아 두기에 지구는 너무나도 좁다. ', '허블', '97697330');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '그 많던 싱아는 누가 다 먹었을까', 200, 0, 0, 9.8, '박완서 저', '2021-01-22', '박완서 타계 10주기 헌정 개정판
그가 가장 사랑했던 연작 자전소설
“지금 다시 박완서를 읽다”', '웅진지식하우스', '96808711');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '머더봇 다이어리 : 탈출 전략', 200, 0, 0, 0, '마샤 웰스 저/고호관 역', '2021-03-15', '2-연속 휴고상, 네뷸러상, 로커스상 외 세계 SF 어워드 수상 시리즈
사회성 없고 소심하지만 매력 만점인 안드로이드
살인봇이 펼치는 새로운 스페이스 오페라
대장정의 막을 내리는 완결작!', '알마', '97961874');


-- DB추가 (2차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '밤불의 딸들', 200, 0, 0, 0, '야 지야시 저/민승남 역', '2021-03-15', '절묘한 언어, 용납하기 어려운 슬픔, 치솟는 아름다움
가족과 국가를 형성하는 역사 속 개인들의 기념비적인 초상화
현재 미국에서 가장 주목받는 젊은 소설가의 화제의 데뷔작', '열린책들', '98152011');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '리바이어던', 200, 0, 0, 0, '보리스 아쿠닌 저/이형숙 역', '2021-03-20', '30여 개국 언어로 번역되며, 현대 러시아를 통틀어
세계적으로 가장 인기 있는 작가 보리스 아쿠닌의 대표작!
“에라스트 판도린 시리즈 중 최고 인기작, 이번엔 밀실 살인 사건이다!”', '아작', '97935522');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '써칭 포 캔디맨', 100, 0, 0, 0, '송기영 저', '2021-02-19', '자본의 논리에서 살아남기 위해
자본이 되어 살아남은
캔디맨이 그리는 자기유지회로', '민음사', '97676558');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '푸른수염의 첫번째 아내', 200, 0, 0, 0, '하성란 저', '2021-02-05', '우리 시대의 불행과 고통을 간파하는 직관
다시 읽어도 탁월한, ‘하성란’ 소설의 정수를 담은 단편들', '창비', '97190648');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '피버 드림', 200, 0, 0, 9.0, '사만타 슈웨블린 저/조혜진 역', '2021-03-15', '동시대 라틴아메리카 문학의 가장 빛나는 별
사만타 슈웨블린의 대표작 국내 첫 출간!
고요하게 숨통을 조여오는 뉘앙스의 공포
‘사만타 슈웨블린’이라는 장르의 탄생', '창비', '97988461');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '천 개의 아침', 100, 0, 0, 9.7, '메리 올리버 저/민승남 역', '2020-11-25', '퓰리처상 수상 시인 메리 올리버의 시집이 국내에서 처음으로 출간되었다. 경이로운 자연과 모든 형태의 삶과 죽음에 바치는 사랑의 시 36편이 담겨 있다. 자연에 영혼을 불어넣고 어둠 속 한 줄기 빛을 건져 올리는 메리 올리버의 언어는 반복되는 서늘한 날들 속에서도 우리를 다시 일으킨다.', '마음산책', '95711598');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '니클의 소년들', 200, 0, 0, 9.6, '콜슨 화이트헤드 저/김승욱 역', '2020-12-11', '『언더그라운드 레일로드』 콜슨 화이트헤드의 두 번째 퓰리처상 수상작. 소설은 불의의 사건으로 감화원에 가게 된 주인공을 통해 인간의 존엄과 용기, 구원에 대해 말한다. 여전히 견고하게 자리한 차별과 폭력, 그럼에도 분명 존재하는 희망을 노래하는 아름다운 이야기.', '은행나무', '96051226');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리가 원했던 것들', 200, 0, 0, 9.6, '에밀리 기핀 저/문세원 역', '2021-03-15', '뉴욕타임스 화제의 베스트셀러! 굿리즈 선정 올해의 소설!
계층, 인종, 부와 특권의식에 관한 근본적인 질문들.
진실된 가치와 가족 사이에서 무엇을 선택해야 할까?', '미래지향', '97698126');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마담 보바리', 200, 0, 0, 9.7, '구스타브 플로베르 저/진인혜 역', '2021-01-25', '영혼과 욕망의 형태까지 그려 낸
프랑스 리얼리즘 문학의 정점', '을유문화사', '97134394');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '비틀거리는 소', 200, 0, 0, 9.3, '아이바 히데오 저/최고은 역', '2020-10-28', '아이들이 먹는 가공식품은 안전한가?
지역사회와 골목 상가는 왜 점점 쇠락해가는가?
압도적인 리얼리티의 사회파 미스터리', '엘릭시르', '94435707');



-- DB추가 (3차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '하쿠바산장 살인사건', 200, 0, 0, 9.3, '히가시노 게이고 저/민경욱 역', '2020-04-27', '히가시노 게이고 미스터리의 고전, 초기 대표작을 다시 만나다!
끝까지 범인을 단정하지 말 것!
밀실 트릭, 암호, 연쇄살인, 안도할 수 없는 반전의 연속
히가시노 게이고가 선사하는 정통 추리소설의 정수', '알에이치코리아(RHK)', '90108338');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리가 빛의 속도로 갈 수 없다면', 200, 0, 0, 9.4, '김초엽 저', '2019-06-24', '제43회 오늘의 작가상 수상작. 한국과학문학상 대상과 가작을 동시에 수상하며 차세대 SF 작가의 화려한 등장을 알린 김초엽의 첫 소설집으로, 그야말로 올해 가장 핫한 작가이자 책입니다. 읽은 분이라면 누구나 ""시선에서 질문까지, 모두 인상적""이란 평가에 고개를 끄덕이실 겝니다. 한국 SF의 현재이자 미래가 될 작가의 행보가 더욱 기대됩니다.', '허블', '74261416');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마음챙김의 시', 100, 0, 0, 9.5, '류시화 편', '2020-09-17', '“날개를 주웠다, 내 날개였다.”', '수오서재', '92462696');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '꽃을 보듯 너를 본다', 100, 0, 0, 9.3, '나태주 저', '2015-06-20', '나태주 시집 『꽃을 보듯 너를 본다』. 이 시집은 시인 나태주의 시 가운데 인터넷의 블로그나 트위터에서 자주 오르내리는 시들만 모아 엮은 책이다.', '지혜', '24259730');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '시 읽는 밤 : 시 밤 (니 생각 에디션)', 100, 0, 0, 8.3, '하상욱 저', '2015-09-18', '시팔이 하상욱의 사랑시를 모아놓은 단 한 권의 책, 『시 밤』!', '위즈덤하우스', '20258841');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '그런 사람 또 없습니다', 100, 0, 0, 9.6, '원태연 저', '2020-11-10', '원태연 필사시집', '북로그컴퍼니', '95275828');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '초판본 하늘과 바람과 별과 詩 : 윤동주 유고시집', 100, 0, 0, 9.2, '윤동주 저', '2016-01-30', '“죽는 날까지 하늘을 우르러 한 점 부끄럼이 없기를...”', '소와다리', '23599602');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '끝까지 남겨두는 그 마음', 100, 0, 0, 9.6, '나태주 저', '2019-09-19', '풀꽃 시인 나태주의 첫 필사시집!', '북로그컴퍼니', '78651636');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '시를 잊은 그대에게 (리커버 에디션)', 100, 0, 0, 8.9, '정재찬 저', '2020-03-16', '“눈물이 고일 정도로 감동받고, 소름 끼칠 정도로 감탄했다!”', '휴머니스트', '18489338');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '너 하나만 보고 싶었다', 100, 0, 0, 0, '나태주 저', '2021-03-23', '네 생각으로 꽃이 핀다', '시와에세이', '98796019');



-- DB추가 (4차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '가장 예쁜 생각을 너에게 주고 싶다', 100, 0, 0, 8.8, '나태주 저/강라은 그림', '2017-06-07', '“너와 나는 기적의 별들이 아닐 수 없다.
그러니 우리가 얼마나 사랑스런 별들이겠는가”', '알에이치코리아(RHK)', '41847244');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '시가 나에게 살라고 한다', 100, 0, 0, 9.8, '나태주 편', '2020-10-30', '나를 살린 시들이 이제 너를 지켜주기를 시인 나태주가 뽑은 국내 명시', '앤드', '262010');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '너만 모르는 그리움', 100, 0, 0, 9.7, '나태주 저/배정애(캘리애) 글/슬로우어스 그림', '2020-01-10', '나태주 등단 50주-기념 필사시집!', '북로그컴퍼니', '86007920');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '달러구트 꿈 백화점', 200, 0, 0, 9.3, '이미예 저', '2020-07-08', '여기는 잠들어야만 입장할 수 있는 ‘달러구트 꿈 백화점’입니다', '팩토리나인', '91065309');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아몬드', 200, 0, 0, 9.2, '손원평 저', '2017-03-31', '공감 불능 사회, 차가움을 녹이는 아몬드', '창비', '37300128');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아버지에게 갔었어', 200, 0, 0, 8.5, '신경숙 저', '2021-03-05', '익명의 아버지들에게 바치는 신경숙의 찬란한 헌사', '창비', '97780589');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '귤의 맛', 200, 0, 0, 8.5, '조남주 저', '2020-05-28', '우리 모두가 지나온 초록의 시간
버겁고 외롭지만 함께라서 가능했던 그날의 이야기들', '문학동네', '90300486');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '보건교사 안은영', 200, 0, 0, 9.5, '정세랑 저', '2020-09-11', '“안은영이 책을 읽는 분들의 친구였으면 좋겠습니다.” -정세랑', '민음사', '92562566');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '땀 흘리는 소설', 200, 0, 0, 9.6, '김혜진, 김세희, 김애란, 서유미, 구병모 저 외 3명', '2019-03-01', 'N포 세상에 ‘을’로 내던져진 청춘들의 이야기', '창비교육', '70421963');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '나는 소망한다 내게 금지된 것을', 200, 0, 0, 9.6, '양귀자 저', '2019-04-20', '거침없이 질주하며 여성 억압에 관한 담대한 질문을 퍼붓는 강렬한 주인공,
자신의 존재 조건에 스스로 신화적 의미까지 부여하는 주인공 강민주', '쓰다', '72127217');


-- DB추가 (5차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '유원', 200, 0, 0, 9.5, '백온유 저', '2020-06-19', '“높은 곳에 서려면 용기가 필요했다.”
모순투성이 마음을 딛고 날아오르는 모든 이를 위한 성장소설', '창비', '90628036');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '바깥은 여름', 200, 0, 0, 9.1, '김애란 저', '2017-06-28', '2017 소설가들이 뽑은 올해의 소설', '문학동네', '42798224');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '의미 있는 삶을 위하여', 400, 0, 0, 0, '알렉스 룽구 저', '2021-04-01', '독일에서 온 의식성장 리더 알렉스 룽구.
자기계발을 넘어 온전한 나로 살기 위한 철학적, 경험적 안내서!
“행동하지 못할 때 그건 의지의 문제가 아닙니다.
자아에 대한 무지가 문제입니다.”', '수오서재', '98836069');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '위대한 시크릿', 400, 0, 0, 0, '론다 번 저/임현경 역', '2021-03-25', '『시크릿』 론다 번, 15-만에 위대하게 돌아오다. 전작 『시크릿』으로 세상을 뒤흔들고 수많은 이들의 인생을 성공과 부로 이끌었던 론다 번은 이제 그 성공과 부를 넘어선 완전한 자유와 충만함이 가득한 세계로 독자들을 인도한다. 론다 번이 14년간 진지한 마음 탐구와 자기 탐색의 시간을 거쳐 내놓은 신작, 이 책을 통해서', '알에이치코리아(RHK)', '98561058');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마지막 몰입 : 나를 넘어서는 힘', 400, 0, 0, 9.6, '짐 퀵 저/김미정 역', '2021-02-23', '일론 머스크가 자문하는 두뇌 전문가의 책! 세계 정상급의 CEO와 운동선수 뿐 아니라 백악관, 하버드, 구글에서 찾는 독보적인 브레인 코치 짐 퀵의 성공 전략을 담은 책이다. 빌 게이츠, 오프라 윈프리 등 세계 상위 1%가 극찬하는 최고의 두뇌 전문가가 되기까지 그의 인생을 바꾼 잠재력의 힘이 무엇인지 책을 통해 배울 수 있다.', '비즈니스북스', '97522081');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '터지는 콘텐츠는 이렇게 만듭니다', 400, 0, 0, 9.5, '박창선 저', '2021-03-25', '“답 없는 콘텐츠 그만하고, 우리도 트래픽 좀 터져보자!”
순수익 ‘0’에서 대박 콘텐츠 하나로 5개월 만에 3년간의 목표 수익 달성!', '유영', '98830130');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '못난 게 아니라, 조금 서툰 겁니다', 400, 0, 0, 9.6, '조지선 저', '2021-03-25', '어설픈 위로는 가라 !
삶에 서툰 보통의 어른들에게 _ 한입심리학이 전하는 “근거 있는 위로”와 “일상밀착형 조언들”', '책으로여는세상', '97963009');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '절대 배신하지 않는 공부의 기술', 400, 0, 0, 9.3, '이상욱(긍정에너지토리파) 저', '2021-02-28', '화제의 영상 ‘저는 이 공부법으로 의사가 되었습니다’
유튜브 구독자수 22만 명, 누적 조회수 1,600만!
랜선 공부 멘토 ‘긍정에너지토리파’ 공부법의 모든 것!', '웅진지식하우스', '97658378');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '은둔의 즐거움', 400, 0, 0, 9.7, '신기율 저', '2021-03-10', '행복하고 자유로운 삶을 위해, 우리는 더 고독해질 필요가 있다
혼자 웅크리는 응축의 힘을 모아, 세상에 다시 나설 용기를 주는 책', '웅진지식하우스', '97948419');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '하나를 비우니 모든 게 달라졌다', 400, 0, 0, 9.0, '이초아 저', '2021-03-31', '한 번 하나 비웠을 뿐인데, 변화를 이끄는 비움 아이템 50비우고 채우며 찾는 진짜 나의 라이프스타일', '북스톤', '98796153');


-- DB추가 (6차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '생각의 각도', 400, 0, 0, 9.4, '이민규 저', '2021-03-02', '지난 20여 년간 ‘성공적이고 행복한 삶을 살기 위해서는 1%만 바꾸면 된다’며 수많은 독자의 꿈을 찾아주고 행동을 변화시킨 심리학자 이민규 교수가 ‘생각의 각도를 1도만 바꾸면 진정으로 인생을 향유할 수 있다’는 메시지를 담아 독자에게 이야기를 건넨다.', '끌리는책', '97641248');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '40대 인생이 바뀌는 공부', 400, 0, 0, 0, '이대형 저', '2021-03-31', '『40대 인생이 바뀌는 공부』는 SKY 출신도 아닌 사람의, 20대도 아닌 사람의 평범한 대한민국의 위기에 선 40대 가장의 공인중개사, 감정평가사 스트레이트 도전기이다.', '바른북스', '98809592');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '겁내지 않고 그림 그리는 법', 300, 0, 0, 10.0, '이연 저', '2021-03-24', '53만 구독자를 보유한 미술 크리에이터 이연의 첫 에세이. 이 책은 단순히 그림을 잘 그리는 법을 소개하는 책이 아니다. 지금까지 포기하지 않고 그림을 그릴 수 있었던 마음과 태도를 담았다. 그의 진심이 담긴 이야기에서 시작조차 하지 못했던 두려움을 떨쳐버리고 첫 걸음을 내딛을 용기를 얻는다.', '미술문화', '98390254');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '이상하고 자유로운 할머니가 되고 싶어', 300, 0, 0, 9.4, '무루 저', '2020-05-12', '그림책을 읽는 어른으로 살아가는 ‘무루’. 어제보다 오늘 조금 더 나은 삶을 완성하기 위해 그녀는 오늘도 그림책을 읽는다. 혼자서 천천히 세상을 바라보고, 모험과 성장을 두려워하지 않는 그림책 속에서 발견한 세상. 그 길을 따라가다 보면 우리의 세상도 몇 칸쯤 더 넓어질 것 같다.', '어크로스', '90184140');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '평범한 결혼생활', 300, 0, 0, 0, '임경선 저', '2021-03-11', '만난 지 3주만의 급작스런 청혼, 석 달 간의 짧은 연애 그리고 바로 이어진 20-간의 결혼생활. 임경선 작가가 20-세월을 한 남자와 살며 느낀 결혼생활에 대한 이야기를 담은 산문집을 출간했다. 복잡하게 행복하고 복잡하게 불행한 결혼에 대한 다양한 감정을 솔직하게 담아냈다.', '토스트', '97702661');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '기록하기로 했습니다', 300, 0, 0, 9.3, '김신지 저', '2021-02-09', '기록덕후 김신지 작가가 오늘을 기록하는 22가지 아이디어를 소개한다. 일기부터 영감 노트까지, 구체적이고 재미있는 기록연습으로 누구나 기록하는 사람이 될 수 있다. 매일을 기록하는 습관은 나에게 중요한 것, 삶의 사소한 기쁨을 발견하게 해줄 것이다', '휴머니스트', '97032664');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '천문학자는 별을 보지 않는다', 300, 0, 0, 9.2, '심채경 저', '2021-02-22', '‘창백한 푸른 점’ 속 천문학자가
일상을 살아가며, 우주를 사랑하는 법
『네이처』가 미래의 달 과학을 이끌 과학자로 주목한 심채경의 첫 에세이
이론물리학자 김상욱, 『씨네21』 김혜리 기자 강력 추천!
천문학자의 눈으로 바라본 일상과 세상, 그리고 멀고도 가까운 우주', '문학동네', '97587008');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '모래알만 한 진실이라도', 300, 0, 0, 9.7, '박완서 저', '2020-12-07', '영원한 현역 작가 박완서의 10주기 기념 에세이 결정판', '세계사', '96435613');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '오늘이 무대, 지금의 노래', 300, 0, 0, 10.0, '티키틱 저', '2021-03-31', '
“온 우주가 티키틱을 알았으면 좋겠다”', 'arte(아르테)', '98854353');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '좋은 사람에게만 좋은 사람이면 돼', 300, 0, 0, 9.5, '김재식 저', '2020-09-01', '10만 부 돌파 기념 봄 에디션 출간!', '위즈덤하우스', '92099619');


-- DB추가 (7차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '설레는 건 많을수록 좋아', 300, 0, 0, 10.0, '김옥선 저', '2021-03-29', '유튜버 ‘여락이들’의 가식 0% 역대급 재미 보장 여행기!', '상상출판', '98859230');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아무튼, 클래식', 300, 0, 0, 0, '김호경 저', '2021-03-12', '‘나를 만든 세계, 내가 만든 세계’, 아무튼 시리즈 40번째는 클래식 음악 이야기다.', '코난북스', '98136506');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '라면 : 지금 물 올리러 갑니다', 300, 0, 0, 10.0, '윤이나 저', '2021-03-05', '라면을 끓이는 과정의 기록이자
나에게 가장 맛있고 간편한 한 끼를 먹이는 일의 가치에 대한 이야기', '세미콜론', '97813833');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '훠궈 : 내가 사랑하는 빨강', 300, 0, 0, 10.0, '허윤선 저', '2021-03-05', '기쁠 때도 슬플 때도 훠궈는 늘 끓고 있다
패션지 에디터이자 ‘훠궈 러버’ 허윤선이 뜨거운 냄비에서 건져올린 글들', '세미콜론', '97813768');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '젓가락질 너는 자유다', 300, 0, 0, 9.0, '조한별 저', '2021-03-02', '젓가락질로 설움 받았던 사람들이여, 모여라!
세상을 바꾸는 궁극의 젓가락질 안내서', '휴머니스트', '97636552');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아무튼, 후드티', 300, 0, 0, 9.6, '조경숙 저', '2020-12-11', '‘후드티 애호가’로 통하는 저자는 개발자라는 직업을 가지고 살아간다.', '코난북스', '96247765');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아무튼, 뜨개', 300, 0, 0, 9.8, '서라미 저', '2020-11-27', '단언컨대 내 인생을 바꾼 것은 책이 아니라 뜨개다!
어느 은둔형 번역가의 광활한 뜨개 우주 표류기', '제철소', '95874140');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '기분이 태도가 되지 않게', 400, 0, 0, 9.0, '레몬심리 저/박영란 역', '2020-06-30', '집에서, 회사에서, 인간관계에서
후회가 사라지고 오해가 줄어드는 기분 사용법', '갤리온', '90872322');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '일은 배신하지 않는다', 400, 0, 0, 9.7, '김종민 저', '2021-03-15', '고졸 PC방 알바가 포트폴리오 하나로 구글의 입사 제안을 받기까지,
그 후의 이야기', '아이스크림미디어', '97987124');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '타인을 읽는 말', 400, 0, 0, 9.7, '로런스 앨리슨, 에밀리 앨리슨 저/김두완 역', '2021-01-15', '테러리스트, 직장 상사, 말 안 듣는 아이까지 누구에게 어디서도 통하는 심리학자의 대화법', '흐름출판', '96837073');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아침이 달라지는 저녁 루틴의 힘', 400, 0, 0, 9.5, '류한빈 저', '2021-01-13', '“뿌듯함에 잠들고, 설레며 일어나라!”
평범한 일상 위에 기적을 쌓아 올리는 저녁 루틴 수업', '동양북스(동양books)', '96558130');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '멘탈의 연금술', 400, 0, 0, 9.5, '보도 섀퍼 저/박성원 역', '2020-12-14', '“세상은 결코 쉬운 상대가 아니다.
유일한 전략은 당신이 세상보다 더 강해지는 것이다!”
1천만 부 판매 『돈』의 작가 보도 섀퍼, 10-만의 신작', '토네이도', '95856808');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '문해력 공부', 400, 0, 0, 9.5, '김종원 저', '2020-11-13', '100만 독자를 매료시킨 ‘인문학 수업’ 작가,
김종원이 찾은 세상을 이끌 새로운 힘', '알에이치코리아(RHK)', '94968496');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '새로운 가난이 온다 ', 500, 0, 0, 9.4, '김만권 저', '2021-01-29', '다가올 빈곤, 누구도 예외가 아니다! 산업혁명 직후 부는 소수에 집중됐다. 『공산당 선언』이 인기를 끈 배경이다. 21세기에 등장한 새로운 테크놀로지가 부의 집중으로 이어지고 있다. 불평등은 혐오와 분노를 낳는다. 늘어나는 격차 앞에 놓인 우리의 선택지는 무엇일까? 철학자 김만권이 답한다.', '혜다', '97123858');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '인류를 식량 위기에서 구할 음식의 모험가들', 500, 0, 0, 9.6, '아만다 리틀 저/고호관 역', '2021-01-15', '지속가능한 발전은 먹거리를 빼놓고는 논할 수 없다. 과학 기술은 식량 위기를 대비하고 있다. 이 책은 세계 각지에서 미래의 음식을 찾기 위한 실험을 소개한다. 탄소를 줄일 수 있는 배양육, 도시 농업, 가뭄을 견디는 식물 등 음식 혁명은 조용히 진행 중이다. ', '세종서적', '96793983');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '치유와 억압의 집, 여성병원의 탄생', 500, 0, 0, 0, '디어드러 쿠퍼 오언스 저/이영래 역/윤정원 감수', '2021-03-23', '여성을 ‘위한’ 병원은 왜 여성을 불편하게 만드는가?
여성과 의학, 사회가 맺을 새로운 관계를 위해 넘어서야 할 유산
미국 남부 노예 오두막에서 시작된 현대 산부인과의 기원과 역사!', '갈라파고스', '98137207');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '리볼트', 500, 0, 0, 9.5, '나다브 이얄 저/최이현 역', '2021-02-22', '이스라엘 기자 나다브 이얄은 10여 -동안 세계화로 고통받는 세계 곳곳의 사람들을 취재했다. 책에 실린 사례는 우리가 어렴풋이 아는 내용이다. 불평등, 노동 착취, 생태계 파괴 등 세계화는 많은 사람의 생존을 위협한다. 파국을 막기 위해 이제는 현실을 직시해야 한다.', '까치(까치글방)', '97518023');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '동자동 사람들', 500, 0, 0, 8.8, '정택진 저', '2021-01-25', '서울역 맞은편에 위치한 동자동 쪽방촌. 이곳에서는 대한민국 1인당 GDP가 3만 달러를 넘어섰다는 소식이 체감되지 않는다. 제도적인 지원과 다양한 단체의 돌봄에도 이들은 왜 쪽방촌을 벗어날 수 없을까? 한 젊은 연구자의 시선에 비친 대한민국 가난의 현주소를 담았다', '빨간소금', '97154013');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '빌 게이츠, 기후재앙을 피하는 법', 500, 0, 0, 9.6, '빌 게이츠 저/김민주, 이엽 역', '2021-02-16', '마이크로소프트 창업자이자 혁신적인 CEO였던 빌 게이츠. 현재 그는 자선 사업가와 환경주의자로서 살아가고 있다. 빌 게이츠는 지난 10년간 기후 위기에 관해 골몰해왔다. 종말과 파멸의 메시지를 담은 여타 환경책과 달리 이 책은 인류가 극복할 수 있다는 확신에 선다.', '김영사', '97418314');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '쌀 재난 국가', 500, 0, 0, 9.7, '이철승 저', '2021-01-25', '『불평등의 세대』의 저자 이철승 교수의 신작. 한국사회 불평등의 기원과 현재를 규명했다. 불평등을 다룬 대부분의 책은 자본주의적 생산 양식을 분석하는데, 이 책은 동아시아 벼농사 체제에 주목한다. 한반도 고대국가의 형성부터 최근 팬데믹에 이르는 시간을 관통한다.', '문학과지성사', '97142498');


-- DB추가 (7차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '사이보그가 되다', 500, 0, 0, 9.8, '김초엽, 김원영 저', '2021-01-15', '김초엽 소설가와 김원영 변호사는 공통점이 있다. 어린 시절부터 손상된 신체를 보완하는 기계(보청기와 휠체어)와 만났다는 점이다. 두 사람은 자신의 경험과 사색을 통해 사이보그가 그려갈 미래를 논한다. 사이보그의 존재론과 윤리에 관한 두 사람의 통찰이 빛난다.', '사계절', '96565175');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '공포의 문화', 500, 0, 0, 9.0, '배리 글래스너 저/윤영삼 역', '2020-12-18', '언론과 기업, 정치인은 대중의 공포심을 먹고 산다
우리 안에 깃든 가짜 두려움을 직시하라', '라이스메이커', '96186196');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '러스트벨트의 밤과 낮', 500, 0, 0, 9.0, '엘리스 콜레트 골드바흐 저/오현아 역', '2020-12-15', '2020-미국 대선의 격전지, 러스트벨트에서 터져 나온
여성 철강 노동자의 목소리
아마존 추천 ‘최고의 전기 및 회고록’', '마음산책', '96040364');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '푸도폴리', 500, 0, 0, 9.7, '위노나 하우터 저/박준식, 이창우 역', '2020-11-23', '푸도폴리는 푸드(Food)와 모노폴리(Monopoly)의 합성어이다. 즉 ‘먹거리 독점’을 뜻한다. 지은이 위노나 하우터는 현재 유기농 가족농장을 운영하며 로컬푸드운동에 동참하고 있다. 하지만 미국에서 가장 존경받는 먹거리운동가의 한 명으로서 하우터는, 로컬푸드운동이 먹거리 위기와 생태 위기를 해결하는 데에는 충분치 않다고 생각한다. 『푸도폴리』에서 그녀는 문제의 진짜 원인을 겨냥한다. 농민이 건강한 농산물을 기르지 못하게 하고, 식료품점에서 소비자의 선택을 제한하는 소수 대기업에 의한 먹거리 생산 통제, 곧 푸도폴리이다. 정치권력 역시 이를 뒷받침하고 있다.', '빨간소금', '95712936');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '돈의 속성', 900, 0, 0, 9.5, '김승호 저', '2020-06-15', '『알면서도 알지 못하는 것들』 김승호 회장의 최신간. 유튜브에서 1,600만 명이 시청한 <돈의 속성> 완결편으로 책을 출간했다. 복잡하고 어려운 내용은 없다. 그저 자신이 가장 잘할 수 있고, 잘 아는 돈 버는 모든 것을 명료하게 풀었다. 하나의 인격체와 같은 돈, 그동안 내가 알던 돈에 관한 생각을 과감히 수정한다', '스노우폭스북스', '90428162');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '대전환의 시대', 500, 0, 0, 9.3, '짐 로저스 저/송태욱 역', '2021-03-31', '펜데믹 버블 속에서 부를 키우는 세계 3대 투자가 짐 로저스의 대예언', '알파미디어', '98191436');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아들아, 돈 공부해야 한다', 500, 0, 0, 0, '정선용 저', '2021-03-25', '“직원으로 시작해라. 그러나 직원으로 살지 마라”
151만 ‘부동산 스터디’ 카페가 열광한 화제의 칼럼', '알에이치코리아(RHK)', '98831374');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '부의 인문학', 500, 0, 0, 8.3, '브라운스톤 저', '2019-10-04', '뼈아픈 시행착오와 인문학적 통찰로 다져진
절대 실패하지 않는 투자의 기술', '오픈마인드', '79695513');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '부의 추월차선', 500, 0, 0, 8.6, '엠제이 드마코 저/신소영 역', '2013-08-20', '부자가 되기 위한 40년짜리 플랜에 속지 마라', '토트출판사', '9440838');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '머물고 싶은 동네가 뜬다', 500, 0, 0, 9.9, '모종린 저', '2021-03-18', '『골목길 자본론』, 『인문학, 라이프스타일을 제안하다』에 이은 모종린의 ‘로컬 비즈니스 3부작’ 완결편', '알키', '98226039');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '행동경제학', 500, 0, 0, 9.2, '리처드 탈러 저/박세연 역', '2021-03-11', '글로벌 밀리언셀러 『넛지』 저자 리처드 탈러가 집대성한', '웅진지식하우스', '97665494');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '존리의 금융문맹 탈출', 500, 0, 0, 8.8, '존 리 저', '2020-10-12', '“금융문맹은 질병이고 전염병처럼 주위를 모두 가난하게 만든다”', '베가북스', '93317297');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '넛지', 500, 0, 0, 8.8, '리처드 탈러, 캐스 R. 선스타인 저/안진환 역/최정규 감수', '2018-11-23', '2017 노벨경제학상 수상 1주-기념 리커버판 출간', '리더스북', '67094876');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '프로보커터', 900, 0, 0, 0, '김내훈 저', '2021-04-09', 'provoke : 1.(특정한) 반응을 유발하다', '서해문집', '99001091');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '베들레헴을 향해 웅크리다', 900, 0, 0, 0, '조앤 디디온 저/김선형 역', '2021-04-08', '‘단단한’ 스타일과 ‘날카로운’ 지성의 작가
디디온 글쓰기의 원형을 만난다', '돌베개', '98983944');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '미국 정치 평전', 900, 0, 0, 0, '남태현 저', '2021-03-30', '민주당과 공화당의 정치 독점, 그리고 소외된 목소리', '오월의봄', '98859013');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '노마드랜드', 900, 0, 0, 0, '제시카 브루더 저/서제인 역', '2021-03-26', '압도적 찬사, 역대급 수상 기록, 영화 [노매드랜드] 원작
리베카 솔닛, 바버라 에런라이크 추천', '엘리', '98828684');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '욕망과 파국', 900, 0, 0, 0, '최성각 저', '2021-03-25', '팬데믹 시대에 환경책을 읽는다는 것', '동녘', '98573209');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '석탄아틀라스', 900, 0, 0, 0, '하인리히 뵐 재단, 분트(독일환경과자연보호연맹) 저/움벨트 역', '2021-03-19', '기후파괴의 주범, 석탄의 어제와 오늘을 지도에 담아 내다', '작은것이아름답다', '98568459');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아빠가 되어줄게', 900, 0, 0, 10.0, '이해준 저', '2021-03-15', '학교폭력으로부터 자녀를 지켜낸 평범한 가장의 극복기', '에고의바다', '98382847');



-- DB추가 (8차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '휴먼 네트워크', 900, 0, 0, 10.0, '매슈 O. 잭슨 저/박선진 역', '2021-02-26', '우리는 점점 더 연결되고 있지만 동시에 점점 더 분열하고 있다', '바다출판사', '97587707');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '프로메테우스의 금속', 900, 0, 0, 9.4, '기욤 피트롱 저/양영란 역', '2021-02-26', '인류의 역사는 곧 에너지 전환의 역사다', '갈라파고스', '97583218');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마스크가 답하지 못한 질문들', 900, 0, 0, 9.1, '미류, 서보경, 고금숙, 박정훈, 최현숙 저 외 5명', '2021-02-15', '‘재난 이후’는 재난과 동시에 시작되었다
코로나19가 드러낸 한국사회의 사각지대', '창비', '97422124');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '폴 크루그먼의 경제학의 향연', 900, 0, 0, 7.9, '폴 크루그먼 저', '1997-11-10', '현안 분석 위주의 거시 경제학 개론서', '부키', '35978');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '이코노미스트 2021 세계경제대전망', 900, 0, 0, 9.5, '영국 이코노미스트 저', '2020-12-15', '이코노미스트 《2021 세계경제대전망》 한국어판 독점 출간
전 세계 90개국 이상, 25여 개의 언어로 동시 출간!
2021-포스트 코로나 시대를 돌파하기 위한 이코노미스트의 심층 진단', '한국경제신문사(한경비피)', '95753726');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '명견만리_공존의 시대 편', 900, 0, 0, 9.5, 'KBS 명견만리 제작팀 저', '2019-02-25', '“함께 잘살 수 있는 방법을 제안하고 변화하도록 만드는 가치 있는 책.”', '인플루엔셜', '69640292');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '이과형 두뇌 활용법 ', 800, 0, 0, 10.0, '바버라 오클리 저/김아림 역', '2021-03-02', '수포자를 공대 교수로 이끈 기적의 학습법
320만 명이 수강한 최고의 강의를 책으로 만나다!
', '문학동네', '97793904');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '어쩌다 과학', 800, 0, 0, 9.6, '지이, 태복 저/이강영 감수', '2021-03-05', '과학 코믹 단막극: 누가 과학을 두려워하는가', '더퀘스트', '97662398');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '호흡의 기술', 800, 0, 0, 9.9, '제임스 네스터 저/승영조 역', '2021-02-19', '삶의 마지막 숨을 내뱉을 때까지,
호흡의 치유력을 최대한 이용하는 과학적 방법', '북트리거', '97390528');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '과학이란 무엇인가', 800, 0, 0, 9.6, '버트런드 러셀 저/장석봉 역', '2021-02-08', '러셀이 노벨 문학상을 받는 데 지대한 영향을 끼친 고전', '사회평론', '97282959');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '인생, 자기만의 실험실', 800, 0, 0, 9.6, '리타 콜웰, 샤론 버치 맥그레인 저/김보은 역', '2021-02-01', '과학계 유리천장을 깬 원조 랩걸
미 국립과학재단 첫 여성 총재 리타 콜웰의 자전적 인생 안내서', '머스트리드북', '97164698');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '리얼리티 버블', 800, 0, 0, 9.3, '지야 통 저/장호연 역', '2021-01-25', '보는 방법을 바꾸면,
세상을 바꿀 수 있다.', '코쿤북스', '96989447');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '지구인의 우주공부', 800, 0, 0, 0, '이명현 저', '2021-01-19', '지구인이라면 응당
우주를 공부해야 한다', '바다출판사', '96972373');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '무자비한 알고리즘', 800, 0, 0, 9.1, '카타리나 츠바이크 저/유영미 역', '2021-01-15', '넷플릭스 영화 추천에서부터 포털의 뉴스 순위, 신용도 평가,
대입 전형, 기업 입사지원자 선발, 재범 및 테러 위험 예측까지', '니케북스', '96882879');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '치킨에는 진화의 역사가 있다', 800, 0, 0, 9.6, '가와카미 가즈토 저/김소연 역', '2021-01-11', '조류학계의 빌 브라이슨, 인류를 대표하여
치킨의 모든 것을 속속들이 파헤치다!', '문예출판사', '96651206');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '곽재식의 미래를 파는 상점', 800, 0, 0, 9.6, '곽재식 저', '2020-12-28', '곽재식 작가가 예측한 2050년의 미래 상점,
세상을 바꿀 15가지 물건', '다른', '96379197');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '다양성을 엮다', 800, 0, 0, 0, '강호정 저', '2020-11-13', '인류는 위기의 지구에서 살아남을 수 있을까?
지금 우리에게 필요한 ‘생태계 가이드’', '이음', '95348343');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '면역에 관하여', 800, 0, 0, 8.5, '율라 비스 저/김명남 역', '2016-11-25', '누구나 읽어야 할 면역에 관한 모든 것', '열린책들', '33468660');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '생명과학을 쉽게 쓰려고 노력했습니다', 800, 0, 0, 9.8, '박종현 저/마그 그림', '2019-02-11', '과학기술 시대에 꼭 알아야 할 쉽고 재미있는 32가지 생명과학 이야기!', '책미래', '69334288');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '인류의 기원', 800, 0, 0, 8.9, '이상희, 윤신영 저', '2015-09-18', '우리 인류의 기원을 쫓아
함께 떠나는 시간 여행!', '사이언스북스', '20365340');



-- DB추가 (9차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '모든 사람을 위한 빅뱅 우주론 강의', 800, 0, 0, 10.0, '이석영 저', '2017-03-24', '융합형 과학 교육의 필독서', '사이언스북스', '38003784');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리는 모두 별에서 왔다', 800, 0, 0, 9.6, '윤성철 저', '2020-01-29', '138억 -전 빅뱅에서 시작된 별과 인간의 경이로운 여정', '21세기북스', '86899091');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '다윈의 식탁', 800, 0, 0, 8.0, '장대익 저', '2015-11-05', '논쟁으로 배우는 현대 진화론의 진수', '바다출판사', '23059831');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '생명과학, 신에게 도전하다', 800, 0, 0, 7.4, '김응빈, 김종우, 방연상, 송기원, 이삼열 저', '2017-03-29', '유전자가위와 합성생물학은 우리 삶을 어떻게 바꿀 것인가?', '동아시아', '38148376');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '제3의 침팬지', 800, 0, 0, 9.3, '재레드 다이아몬드, 김정흠 저', '2015-10-23', '인간의 본성과 문명의 발달 과정을
명쾌하게 풀어낸 인류진화보고서', '문학상사', '22524715');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '10퍼센트 인간', 800, 0, 0, 9.3, '앨러나 콜렌 저/조은영 역', '2016-02-15', '더 깨끗하고, 더 어리며, 더 잘사는 사람들의 병', '시공사', '24391705');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '확장된 표현형', 800, 0, 0, 8.6, '리처드 도킨스 저', '2016-06-30', '『이기적 유전자』 리처드 도킨스의 삼부작 가운데
가장 ‘도킨스다운’ 최고의 역작', '을유문화사', '29173217');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '나는 미생물과 산다', 800, 0, 0, 9.6, '김응빈 저', '2018-04-30', '인간과 미생물의 달콤한 동거를 위한 첫 미생물 수업', '을유문화사', '60493351');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '2030 화성 오디세이', 800, 0, 0, 9.0, '최기혁 등저', '2015-10-26', '“제 2의 지구”, “우주의 신대륙” 화성!
인류는 언제쯤 이 행성에 발을 디딜 수 있을까?', 'MID 엠아이디', '22577398');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '식탁 위의 미생물', 800, 0, 0, 8.6, '캐서린 하먼 커리지 저/신유희 역', '2020-07-15', '우리가 먹는 것이 체내 미생물을, 그리고 우리를 만든다', '현대지성', '91214075');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '공생 멸종 진화', 800, 0, 0, 8.8, '이정모 저', '2015-09-11', '공생, 멸종, 진화. 자연사를 이해하는 세 가지 키워드', '나무,나무', '20310137');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '처음 시작하는 천체관측', 800, 0, 0, 9.3, '나가타 미에 저 / 김소영 역 / 김호섭 감수', '2016-06-08', '온 가족이 함께 읽고 배우는 초보자를 위한 밤하늘 안내서', '감숲', '28180868');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '달콤한 나의 도시양봉', 800, 0, 0, 9.0, '최우리, 어반비즈서울 저', '2020-06-05', '환경부·국가환경교육센터의 환경도서 출판 지원사업 선정작', '나무연필', '90407591');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '새는 건축가다', 800, 0, 0, 9.5, '차이진원 글그림/박소정 역', '2020-03-04', '우리 곁 새들의 비밀스러운 사생활', '현대지성', '89233330');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '자연 수업', 800, 0, 0, 9.8, '페터 볼레벤 저/고기탁 역', '2020-10-30', '보다, 듣다, 놀라다', '해리북스', '93969624');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '산책자를 위한 자연수업', 800, 0, 0, 9.3, '트리스탄 굴리 저/김지원 역', '2017-09-07', '20년에 걸친 야외 탐험과 6년간의 연구로 밝혀낸 자연 탐험 기술', '이케이북', '45511474');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '자연해부도감', 800, 0, 0, 8.8, '줄리아 로스먼 저/이경아 역/이정모 감수', '2016-03-03', '과학과 예술이 어우러진 아름다운 과학책', '더숲', '24749641');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '삼국유사', 600, 0, 0, 10.0, '일연 저/김원중 역', '2021-03-17', '그리고 방대한 양의 불교와 민속 신앙 자료를 아우른 우리 고대 문화의 보고寶庫', '민음사', '98801199');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '처음 읽는 음식의 세계사', 600, 0, 0, 10.0, '미야자키 마사카츠 저/한세희 역', '2021-03-29', '전 세계의 식자재로 요리된 음식은
식탁 위에서 매일 세계사를 재연하고 있다', '탐나는책', '97965669');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '인간의 탐험', 600, 0, 0, 9.6, '앤드루 레이더 저/민청기 역', '2021-03-24', '인간은 왜 ‘너머의 세계’로 떠나고 싶어 할까?
초기 인류의 이동부터 대항해 시대를 거쳐 우주여행의 시대까지', '소소의책', '97916951');



-- DB추가 (10차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '피에 젖은 땅', 600, 0, 0, 10.0, '티머시 스나이더 저/함규진 역', '2021-03-05', '연대기적·지리학적으로 새롭게 구축해낸 연구서
10개 언어로 된 16개 기록보관소를 샅샅이 뒤지다', '글항아리', '97796710');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '영국사 다이제스트100', 600, 0, 0, 9.0, '김언조 저', '2021-03-05', '켈트족, 스톤헨지, 드루이드의 흔적과 로마의 긴 지배, 산업혁명과 민주주의의 태동,
지금의 브렉시트 사태까지 영국의 역사를 100장면으로 보다', '가람기획', '97665235');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '어둠의 세계', 600, 0, 0, 0, '앤드루 파인스타인 저/조아영, 이세현 역', '2021-02-15', '무기산업을 둘러싼 부패의 내막과 전쟁 기획자들', '오월의봄', '97408934');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '세계사를 뒤바꾼 가짜뉴스', 600, 0, 0, 9.0, '미야자키 마사카츠 저/장하나 역', '2021-02-15', '우리가 읽었던 위인전은 거짓이다!', '매일경제신문사', '97172626');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '집, 인간이 만든 자연', 600, 0, 0, 0, '김경은 저', '2021-01-30', '안방에서 읽는 한중일 가옥문화열전
비슷하지만 전혀 다른 그래서 알아야 하는 가옥 문화이야기', '이가서', '97156041');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '세계사를 바꾼 12가지 신소재', 600, 0, 0, 9.0, '사토 겐타로 저/송은애 역', '2019-06-25', '새로운 재료는 인간의 능력을
무한대로 끌어올리는 열쇠다!', '북라이프', '74598480');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '밀리터리 세계사', 600, 0, 0, 9.3, '이세환 저/정기문 감수', '2020-04-15', '고대사를 뒤흔든 열 가지 거대한 전쟁,
무기와 방어구로 읽는 또 하나의 전쟁사!', '일라시온', '89939559');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '문명과 수학', 600, 0, 0, 9.1, '김형준, 김미란 저/박형주 감수', '2014-01-24', '“세상의 모든 지식으로 들어가는 열쇠, 그것은 수학이다.”', '민음인', '12021112');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '처음 읽는 술의 세계사', 600, 0, 0, 9.1, '미야자키 마사카츠 저/정세환 역', '2020-10-26', '인간을 신의 세계로 유혹하는 술
향긋한 술을 통해 배우는 인류 문명의 역사', '탐나는책', '93745523');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '한 권으로 읽는 조선왕조실록', 600, 0, 0, 9.0, '박영규 저', '2017-02-10', '역사 분야 최고 베스트셀러가 전하는 ‘제대로 읽는 조선사’
2017-전면개정판 『한 권으로 읽는 조선왕조실록』 출간!', '웅진지식하우스', '35560588');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '탱크의 탄생', 600, 0, 0, 9.5, '모리나가 요우 저/전종훈 역', '2020-05-27', '전차란 과연 무엇일까?', '레드리버', '90375303');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '백년식사', 600, 0, 0, 9.6, '주영하 저', '2020-11-02', '대한제국의 서양식 만찬부터 뉴요커의 채끝 짜파구리까지
세계와 만나 변화해온 글로벌한 100-식탁을 만나다!', '휴머니스트', '94492971');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '그림 쏙 세계사', 600, 0, 0, 9.7, '릴리스 저', '2020-02-24', '누적 방문자 수 500만 블로그의 역사 교사 출신
파워 블로거가 쉽게 쓴 역사 이야기', '지식서재', '88373615');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '금지된 지식', 600, 0, 0, 9.2, '에른스트 페터 피셔 저/이승희 역', '2021-01-21', '위험한 사상가, 대담한 이단아, 진실의 개척자들이
지식 탄압의 역사 속에 펼쳐 보이는 강렬한 지적 파노라마', '다산초당', '97008639');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '최태성 한국사 수업', 600, 0, 0, 9.6, '최태성 저/신동민 그림', '2018-03-30', '시작하는 모든 이를 위한 교양 한국사', '메가스터디북스', '59507297');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '징비록', 600, 0, 0, 9.7, '류성룡 저 / 오세진, 신재훈, 박희정 역해', '2015-02-17', '“역사를 잊은 민족에게 미래는 없다. 적개심만으로는 절대 이길 수 없다.”', '홍익출판사', '16762226');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '고통에 대하여', 600, 0, 0, 9.8, '김영춘 저', '2020-12-22', '한국의 최근 역사에 관한 책이다. 살아있는 한국사이다.', '이소노미아', '95753076');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '세계사를 바꾼 15번의 무역전쟁', 600, 0, 0, 9.3, '자오타오, 류후이 저/박찬철 역', '2020-08-27', '국가 간 경제적 충돌이 격화되는 오늘날,
무역전쟁의 역사에서 생존의 지혜를 찾는다!', '위즈덤하우스', '92100224');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '빅 히스토리 BIG HISTORY', 600, 0, 0, 8.7, '데이비드 크리스천, 밥 베인 저/조지형 역', '2013-09-10', '137억 년의 역사가 이 한 권에 담겼다
빌 게이츠가 지원하는 빅 히스토리 프로젝트!', '해나무', '10988265');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '벨 에포크, 인간이 아름다웠던 시대', 600, 0, 0, 9.5, '심우찬 저', '2021-01-15', '셀럽과 스타가 탄생하고, 백화점과 루이 뷔통과 샴페인이
브랜딩의 태동을 알리던 인류의 전성시대', '시공사', '96698096');



-- DB추가 (11차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '정조의 비밀편지', 600, 0, 0, 8.9, '안대회 저', '2010-01-08', '인간 정조와 정치가 정조의 면모를 파헤친 책', '문학동네', '3660475');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '세계사를 바꾼 37가지 물고기 이야기', 600, 0, 0, 9.2, '오치 도시유키 저/서수지 역', '2020-05-07', '성욕을 억제하기 위한 물고기 ‘청어’와 ‘피시데이’가
더 큰 경제적 욕망을 불러일으키며 유럽사와 세계사를 바꾼 흥미롭고도 아이러니한 이야기', '사람과나무사이', '90000219');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '하룻밤에 읽는 한국사', 600, 0, 0, 8.1, '최용범 저', '2019-09-19', '50만 독자가 선택한 한국사의 결정판
18-연속 한국사 부문 베스트셀러', '페이퍼로드', '78583920');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '일상이 고고학, 나 혼자 경주 여행', 600, 0, 0, 9.3, '황윤 저', '2020-10-15', '국내 최초 덕후 출신 역사학자의 순수한 시각과 내공 어린 발품,
생생한 스토리텔링이 역사에 대한 우리의 호기심을 일깨운다.', '책읽는고양이', '93607194');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '한 권으로 읽는 쇄미록', 600, 0, 0, 9.8, '오희문 저/신병주 해설', '2020-11-06', '이 책은 임진왜란 3대 기록물 중 하나인 『쇄미록(?尾錄)』을 한 권으로 엮은 것이다.', '사회평론아카데미', '95162646');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '왕으로 산다는 것', 600, 0, 0, 9.4, '신병주 저', '2017-03-30', 'KBS 역사저널 그날, KBS라디오 글로벌 한국사, 그날 세계는에 출연한 사학자 신병주 교수가 왕의 정치를 말하다!', '매일경제신문사', '37208764');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '가루전쟁', 600, 0, 0, 9.3, '도현신 저', '2020-07-15', '세계 역사와 지도를 바꾼 가루전쟁', '이다북스', '91063477');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아틀라스 중앙유라시아사', 600, 0, 0, 9.5, '김호동 저', '2016-01-15', '우리 학자가 우리말로 쓴 최초의 중앙유라시아사 개설서', '사계절', '23951328');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우연히, 웨스 앤더슨', 700, 0, 0, 0, '월리 코발 저/김희진 역', '2021-03-30', '웨스 앤더슨 월드로 안내하는 초감각 렌즈이자 단 하나의 초대장
오감 충족 대리 만족 방구석 세계 여행 아카이빙 대작전!', '웅진지식하우스', '98983458');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '베르디 오페라', 700, 0, 0, 0, '박종호 저', '2021-03-01', '오페라보다 더 극적인 베르디의 삶과
시대를 초월해 사랑받는 그의 오페라 26편 이야기', '풍월당', '97966407');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '한 권으로 배우는 음악 이야기', 700, 0, 0, 10.0, '전기홍 저', '2021-03-10', '서울시립대학교 ‘최우수 음악 강의’를
단 한 권의 책으로 만나다!', '상상출판', '97919727');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '페테르부르크, 막이 오른다', 700, 0, 0, 10.0, '김주연 저/김병진 그림', '2021-02-23', '‘2020~2021-한러 수교 30주년의 해’를 맞아 러시아의 문화와 예술을 더 깊이 있는 시선으로
이해하고자 하는 이들에게 훌륭한 길잡이가 되어줄 책', '파롤앤', '97657634');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '방구석 미술관', 700, 0, 0, 9.4, '조원재 저', '2018-08-03', '『방구석 미술관』 10만 부 판매 기념 특별판
조원재 작가와 함께 즐기는 ‘프라이빗 미술관 에디션’ _ 오르세 미술관 편', '블랙피쉬', '63038113');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '90일 밤의 미술관', 700, 0, 0, 9.8, '이용규, 권미예, 명선아, 신기환, 이진희 저', '2020-11-02', '유럽 각지의 미술관에서 수천 명을 감동시킨
5명의 도슨트가 생생하게 전하는 미술 이야기', '동양북스(동양books)', '94485864');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '90일 밤의 클래식', 700, 0, 0, 9.5, '김태용 저', '2020-08-10', 'theLIFE [클래식은 왜 그래]의 용작가가 소개하는
90일간의 쉽고 재밌는 클래식 이야기!', '동양북스(동양books)', '91861394');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '레이나의 피아노 노트', 700, 0, 0, 9.4, '박혜란 저', '2016-06-01', '유튜브 코리아 피아노 부문 최다 구독자 보유!
전 세계인의 사랑을 받고 있는 Reynah의 피아노 OST 곡집', '삼호ETM', '28085649');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '클릭, 서양미술사', 700, 0, 0, 9.3, '캐롤 스트릭랜드 저 / 김호경 역', '2012-09-01', '서양미술사의 모든 것', '예경', '3679684');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '버려지는 디자인 통과되는 디자인 : 편집 디자인', 700, 0, 0, 9.4, '이민기, 강윤미 저', '2017-10-02', '더 좋은 디자인을 만드는 레이아웃의 법칙', '길벗', '51193957');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '웹툰스쿨', 700, 0, 0, 9.6, '홍난지, 이종범 저', '2020-04-20', '웹툰의 세계와 작품 창작의 방법을 알려 주는 약도와 같은 책!', '시공사', '89967191');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '내 마음을 담은 집', 700, 0, 0, 9.4, '서현 저', '2021-01-15', '낯선 들판에 지은 검박한 집이라도 계절을 담았다면
나보다 내 마음이 먼저 도착했다', '효형출판', '96804703');



-- DB추가 (12차)
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '벌새', 700, 0, 0, 9.6, '김보라, 최은영, 남다은, 김원영, 정희진 저 외 1명', '2019-08-29', '백상예술대상 감독상, 대종상영화제 신인감독상', 'arte(아르테)', '78489550');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '브랜드 브랜딩 브랜디드', 700, 0, 0, 9.0, '임태수 저', '2020-06-24', '좋은 브랜드는 좋은 책, 좋은 사람과 같다', '안그라픽스', '90959208');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '나의 이브 생 로랑에게', 700, 0, 0, 8.9, '피에르 베르제 저/김유진 역', '2021-02-09', '평생의 연인이 떠난 후 시작된 이야기', '프란츠', '97389404');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '누구 발이냐옹', 700, 0, 0, 9.8, 'PIE international 저', '2018-02-08', '나만 없어, 고양이! 나도 있다, 고양이 솜방망이!', '아르누보', '58512338');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '그림을 보는 기술', 700, 0, 0, 9.1, '아키타 마사코 저/이연식 역', '2020-09-15', '명화는 왜 명화인가? 그 이유를 자신의 눈으로 직접 확인해보자!', '까치(까치글방)', '92803437');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '미술에게 말을 걸다', 700, 0, 0, 9.7, '이소영 저', '2019-11-18', '“사람들은 왜 그 그림을 명화라고 부를까요?”', '카시오페아', '82958475');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '다시, 그림이다', 700, 0, 0, 9.0, '마틴 게이퍼드 저/주은정 역', '2012-10-20', '영국 팝아티스트이자 최고의 화가, 데이비드 호크니의 모든 것!', '디자인하우스', '7911679');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '옆반의 인어 1-2 세트', 1000, 0, 0, 0, '요엔', '2021-05-03', '고백에 실패하면 물거품이 되고 마는 인어공주(♂) 김우현
절대로 사랑에 관심 없을 것 같은 여자에게 사랑을 느끼고 말았다!', '손봄북스', '99024659');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '여신 강림 5~6 세트', 1000, 0, 0, 0, '야옹이', '2021-04-14', '첫사랑은 이뤄지지 않는다는 말
정말 그럴까?', 'YOUNGCOM(영컴)', '99018230');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '아가씨와 우렁총각 1', 1000, 0, 0, 0, '제이드', '2021-03-20', '“제 인생에 남자를 들일 생각이 없어요.”', '레진코믹스', '98985227');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '바른연애 길잡이 9', 1000, 0, 0, 0, '남수', '2021-04-07', '“내가 좋아하는 일은 뭘까?” 원하는 꿈을 찾아 방황하는 바름!', 'YOUNGCOM(영컴)', '98834004');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '신과 함께 전권 박스세트', 1000, 0, 0, 0, '주호민', '2020-08-17', '2010-네이버웹툰에 등장하자마자 엄청난 화제를 일으키며
큰 감동과 재미를 선사했던 주호민의 대표작 『신과 함께』', '문학동네', '91557270');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '노곤하개 시즌3 7~8권 세트', 1000, 0, 0, 8.0, '홍끼', '2020-04-17', '현실 집사+랜선 집사들의 필독서 『노곤하개』 시즌 최종 완결!
우리 이제 제주다냥!', '비아북', '89849122');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '찬란하지 않아도 괜찮아 세트', 1000, 0, 0, 10.0, '까마중', '2020-08-10', '애써 태연한 척해 보지만, 사실은 괜찮지 않은 그대에게 전하고 싶은 말
괜찮다, 자연스레 건네는 따뜻한 말 한마디가 주는 힐링', '넥서스BOOKS', '91418499');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '스튜디오 짭쪼롬 1~4권 세트', 1000, 0, 0, 10.0, '오묘', '2020-06-01', '가슴 설레는 기억들이 부드러운 크림처럼 녹아든
청춘들의 설레는 이야기', '재미주의', '90310860');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '쌍갑포차 12~14권 세트', 1000, 0, 0, 8.0, '배혜수', '2020-04-11', '2017-대한민국만화대상 우수상 수상.', '설림', '90073525');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '스위트 홈 1~3 세트', 1000, 0, 0, 0, '김칸비 저/황영찬 그림', '2020-02-28', '전 세계 11개국 1위 석권, 화제의 넷플릭스 오리지널 시리즈 원작 만화 『스위트 홈』 1, 2, 3권 동시 출간!', '위즈덤하우스', '89328336');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '시간의 계단 1~3권 세트', 1000, 0, 0, 9.6, '주영하 원저/제뉴 글그림', '2020-05-22', '2019 리디북스 베스트 웹툰상 수상작', '다산코믹스', '90525225');

SELECT * FROM BOOK;
SELECT * FROM review where rati



-- 분야별 평점 1등 모음 쿼리
SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
FROM (
SELECT ROW_NUMBER() OVER (PARTITION BY CATEGORIES ORDER BY GRADE DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
FROM BOOK 
WHERE RNUM = 1
)

--카테고리 신작 전체 검색 + 페이징
SELECT RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY ISSUEDATE DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
	FROM BOOK
	WHERE BOOKDEL = 0
	ORDER BY ISSUEDATE DESC)
WHERE RNUM BETWEEN 1 AND 12

--카테고리 신작 선택 후 검색 + 페이징
SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY ISSUEDATE DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
	FROM BOOK
	WHERE BOOKDEL = 0
		 AND (CATEGORIES = 100 OR CATEGORIES = 200)
			AND BOOKTITLE LIKE '%%'
	ORDER BY ISSUEDATE DESC)
WHERE RNUM BETWEEN 1 AND 3

--카테고리 오늘의 책 전체
SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY GRADE DESC, BOOKREADCOUNT DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
	FROM BOOK
	WHERE BOOKDEL = 0
		AND BOOKTITLE LIKE '%%'
	ORDER BY GRADE DESC, BOOKREADCOUNT DESC)
WHERE RNUM BETWEEN 1 AND 5;

--카테고리 오늘의 책 (GRADE로 정렬 후 READCOUNT로 정렬)
SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY GRADE DESC, BOOKREADCOUNT DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
	FROM BOOK
	WHERE BOOKDEL = 0
		AND (CATEGORIES = 100 OR CATEGORIES = 200)
			AND BOOKTITLE LIKE '%%'
	ORDER BY GRADE DESC, BOOKREADCOUNT DESC)
WHERE RNUM BETWEEN 1 AND 5;


SELECT  BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER , RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM,
	BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER
	FROM MYLIBRARY M, BOOK B
	WHERE M.WISHBOOK = B.BOOKNUM
	AND B.BOOKTITLE LIKE '%5%'
	AND M.MEMBERNUM = 100)	
WHERE RNUM >= 1 AND RNUM <= 10;	


SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY REVSEQ DESC) AS RNUM,
		BO.BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER
		FROM REVIEW RE, BOOK BO
		WHERE RE.BOOKNUM = BO.BOOKNUM
		AND RE.MEMBERNUM = 100)
WHERE RNUM >= 1 AND RNUM <= 10;	

SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC, BOOKNUM DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
			AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
			FROM BOOK
			WHERE BOOKDEL = 0
			ORDER BY ISSUEDATE DESC, BOOKNUM DESC)
WHERE RNUM BETWEEN 1 AND 5

SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM
FROM (SELECT ROW_NUMBER()OVER(ORDER BY GRADE DESC, BOOKREADCOUNT DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,
				AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE
		FROM BOOK
		WHERE BOOKDEL = 0
		ORDER BY GRADE DESC, BOOKREADCOUNT DESC)
WHERE RNUM BETWEEN 1 AND 5;

INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '고스트 인 러브', 100, 0, 0, 9.8, '마르크 레비 저/이원희 역', '2021-03-22', '사랑에 빠진 아버지 유령,
생의 소원을 이루기 위해 아들 앞에 나타나다!
매년 프랑스 베스트셀러 등극,
세계에서 가장 많이 읽히는 프랑스 작가 마르크 레비 신작 장편소설', '작가정신', '98137764');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '모든 비밀에는 이름이 있다', 200, 0, 0, 8.0, '서미애 저', '2021-03-22', '연쇄살인범 이병도와의 사건이 벌어진 지 5년. 열여섯 살이 된 하영은 지속적으로 심리 상담을 받으며 그때의 트라우마를 극복하기 위해 애써왔지만 사춘기에 접어들며 여전히 혼란스러운 시간을 보낸다. 갑작스러운 이사까지 겹 예민해진 하영은 전학을 간 학교에서 벌어지는 폭력에 새로운 자극을 받기 시작한다. 자신의 그림자와 직면하게 된 하영은 과연 어떤 선택을 내리게 될 것인가?', '엘릭시르 ', '98353931');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '소설 보다 : 봄 2021', 200, 0, 0, 9.3, '김멜라, 나일선, 위수정 저', '2021-03-16', '[봄과 함께 찾아 온 소설의 새로운 풍경] <소설 보다> 시리즈가 봄을 맞아 새로이 옷을 갈아입고 찾아왔다. 이 계절이 주목한 작가는 김멜라, 나일선, 위수정이다. 펜데믹 시대의 불안과 소외된 존재들을 다시금 상기시키며 지금 이곳에 필요한 이야기를 전한다.', '문학과지성사 ', '98397454');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '어둠 속에서도 바다는 푸르다 1', 200, 0, 0, 9.6, '이철환 저', '2021-03-15', '세계를 덮친 코로나19가 일상을 송두리째 바꿔놓았다. 어쩔 수 없이 사람을 피해야 하고, 옆 사람을 감시하는 상황이 1년 넘게 이어지면서 사람들의 피로감도 늘어가고 있다. 최근 그런 우리 사회를 따뜻하게 만든 뉴스가 있다. 어려운 형제에게 값을 받지 않고 치킨을 대접한 어느 치킨집에 관한 이야기다. 형제가 감사의 마음을 담아 쓴 손편지는 수많은 사람의 심금을 울렸다. 인정(人情)을 찾아보기 어려워진 사회지만, 그럼에도 사람들은 마음속 깊이 옛 이웃들의 따뜻한 정을 그리워하고 있었던 것이다. 특히 ‘거리두기 시대’를 맞이하며 이웃을 보듬기보단 피하게 되었기에 더더욱 인간애에 목말라 있다.', '특별한서재', '97813510');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '별들은 여름에 수군대는 걸 좋아해', 100, 0, 0, 10.0, '산족 저/W.H.블리크 편/이석호 역', '2021-03-02', '아프리카 코이코이족과 산족에서 이어져 내려온 이야기를 담은 시집. 최초의 감각과 공생의 세계관 그리고 자연과의 관계를 노래한다. 그 속엔 “부시먼”이라는 납작한 단어로 결코 대체될 수 없는 귀한 이야기가 숨어 있다. 각박한 현실에 지쳐 있는 우리에게 이 시는 한 숨의 영혼을 불어넣는다.', '갈라파고스', '97676465');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '자살일기', 100, 0, 0, 9.7, '파블로다니엘', '2021-03-15', '“날개마저 부러진 다리 없는 새는
적막하게 홀로 하늘을 바라볼 뿐이었다”
슬픔 속에 머무는 모든 이를 위한 65편의 시', '나슬', '98141980');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '야운하시곡', 200, 0, 0, 9.7, '하지은, 호인, 이재만, 김이삭, 한켠 저 외 2명', '2021-03-12', '『얼음나무 숲』의 하지은을 비롯해 한켠, 김이삭 등 젊은 장르 작가의 손끝에서 옛이야기가 현대적으로 재탄생했다. 역사 속 인물과 민담을 재해석한 동양풍의 단편소설을 한데 묶었다. 무협, SF, 호러 등 다채로운 장르의 조합으로 한시라도 지루할 틈이 없다.', '황금가지', '98467679');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리는 이 별을 떠나기로 했어', 200, 0, 0, 0, '천선란, 박해울, 박문영, 오정연, 이루카 저', '2021-03-02', '세계 여성의 날을 맞아 SF의 우아한 계보를 잇는 여성 작가 5인이 모여 ‘여성만의 우주‘를 그렸다. 소설 속 여성들은 제한된 시공간을 탈주하고 행성 시대의 새로운 공동체를 치열하게 고민한다. 그들의 상상력을 이 땅에 붙잡아 두기에 지구는 너무나도 좁다. ', '허블', '97697330');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '그 많던 싱아는 누가 다 먹었을까', 200, 0, 0, 9.8, '박완서 저', '2021-01-22', '박완서 타계 10주기 헌정 개정판
그가 가장 사랑했던 연작 자전소설
“지금 다시 박완서를 읽다”', '웅진지식하우스', '96808711');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '머더봇 다이어리 : 탈출 전략', 200, 0, 0, 0, '마샤 웰스 저/고호관 역', '2021-03-15', '2년 연속 휴고상, 네뷸러상, 로커스상 외 세계 SF 어워드 수상 시리즈
사회성 없고 소심하지만 매력 만점인 안드로이드
살인봇이 펼치는 새로운 스페이스 오페라
대장정의 막을 내리는 완결작!', '알마', '97961874');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '밤불의 딸들', 200, 0, 0, 0, '야 지야시 저/민승남 역', '2021-03-15', '절묘한 언어, 용납하기 어려운 슬픔, 치솟는 아름다움
가족과 국가를 형성하는 역사 속 개인들의 기념비적인 초상화
현재 미국에서 가장 주목받는 젊은 소설가의 화제의 데뷔작', '열린책들', '98152011');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '리바이어던', 200, 0, 0, 0, '보리스 아쿠닌 저/이형숙 역', '2021-03-20', '30여 개국 언어로 번역되며, 현대 러시아를 통틀어
세계적으로 가장 인기 있는 작가 보리스 아쿠닌의 대표작!
“에라스트 판도린 시리즈 중 최고 인기작, 이번엔 밀실 살인 사건이다!”', '아작', '97935522');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '써칭 포 캔디맨', 100, 0, 0, 0, '송기영 저', '2021-02-19', '자본의 논리에서 살아남기 위해
자본이 되어 살아남은
캔디맨이 그리는 자기유지회로', '민음사', '97676558');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '푸른수염의 첫번째 아내', 200, 0, 0, 0, '하성란 저', '2021-02-05', '우리 시대의 불행과 고통을 간파하는 직관
다시 읽어도 탁월한, ‘하성란’ 소설의 정수를 담은 단편들', '창비', '97190648');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '피버 드림', 200, 0, 0, 9.0, '사만타 슈웨블린 저/조혜진 역', '2021-03-15', '동시대 라틴아메리카 문학의 가장 빛나는 별
사만타 슈웨블린의 대표작 국내 첫 출간!
고요하게 숨통을 조여오는 뉘앙스의 공포
‘사만타 슈웨블린’이라는 장르의 탄생', '창비', '97988461');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '천 개의 아침', 100, 0, 0, 9.7, '메리 올리버 저/민승남 역', '2020-11-25', '퓰리처상 수상 시인 메리 올리버의 시집이 국내에서 처음으로 출간되었다. 경이로운 자연과 모든 형태의 삶과 죽음에 바치는 사랑의 시 36편이 담겨 있다. 자연에 영혼을 불어넣고 어둠 속 한 줄기 빛을 건져 올리는 메리 올리버의 언어는 반복되는 서늘한 날들 속에서도 우리를 다시 일으킨다.', '마음산책', '95711598');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '니클의 소년들', 200, 0, 0, 9.6, '콜슨 화이트헤드 저/김승욱 역', '2020-12-11', '『언더그라운드 레일로드』 콜슨 화이트헤드의 두 번째 퓰리처상 수상작. 소설은 불의의 사건으로 감화원에 가게 된 주인공을 통해 인간의 존엄과 용기, 구원에 대해 말한다. 여전히 견고하게 자리한 차별과 폭력, 그럼에도 분명 존재하는 희망을 노래하는 아름다운 이야기.', '은행나무', '96051226');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리가 원했던 것들', 200, 0, 0, 9.6, '에밀리 기핀 저/문세원 역', '2021-03-15', '뉴욕타임스 화제의 베스트셀러! 굿리즈 선정 올해의 소설!
계층, 인종, 부와 특권의식에 관한 근본적인 질문들.
진실된 가치와 가족 사이에서 무엇을 선택해야 할까?', '미래지향', '97698126');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마담 보바리', 200, 0, 0, 9.7, '구스타브 플로베르 저/진인혜 역', '2021-01-25', '영혼과 욕망의 형태까지 그려 낸
프랑스 리얼리즘 문학의 정점', '을유문화사', '97134394');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '비틀거리는 소', 200, 0, 0, 9.3, '아이바 히데오 저/최고은 역', '2020-10-28', '아이들이 먹는 가공식품은 안전한가?
지역사회와 골목 상가는 왜 점점 쇠락해가는가?
압도적인 리얼리티의 사회파 미스터리', '엘릭시르', '94435707');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '하쿠바산장 살인사건', 200, 0, 0, 9.3, '히가시노 게이고 저/민경욱 역', '2020-04-27', '히가시노 게이고 미스터리의 고전, 초기 대표작을 다시 만나다!
끝까지 범인을 단정하지 말 것!
밀실 트릭, 암호, 연쇄살인, 안도할 수 없는 반전의 연속
히가시노 게이고가 선사하는 정통 추리소설의 정수', '알에이치코리아(RHK)', '90108338');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '우리가 빛의 속도로 갈 수 없다면', 200, 0, 0, 9.4, '김초엽 저', '2019-06-24', '제43회 오늘의 작가상 수상작. 한국과학문학상 대상과 가작을 동시에 수상하며 차세대 SF 작가의 화려한 등장을 알린 김초엽의 첫 소설집으로, 그야말로 올해 가장 핫한 작가이자 책입니다. 읽은 분이라면 누구나 ""시선에서 질문까지, 모두 인상적""이란 평가에 고개를 끄덕이실 겝니다. 한국 SF의 현재이자 미래가 될 작가의 행보가 더욱 기대됩니다.', '허블', '74261416');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '의미 있는 삶을 위하여', 400, 0, 0, 0, '알렉스 룽구 저', '2021-04-01', '독일에서 온 의식성장 리더 알렉스 룽구.
자기계발을 넘어 온전한 나로 살기 위한 철학적, 경험적 안내서!
“행동하지 못할 때 그건 의지의 문제가 아닙니다.
자아에 대한 무지가 문제입니다.”', '수오서재', '98836069');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '위대한 시크릿', 400, 0, 0, 0, '론다 번 저/임현경 역', '2021-03-25', '『시크릿』 론다 번, 15년 만에 위대하게 돌아오다. 전작 『시크릿』으로 세상을 뒤흔들고 수많은 이들의 인생을 성공과 부로 이끌었던 론다 번은 이제 그 성공과 부를 넘어선 완전한 자유와 충만함이 가득한 세계로 독자들을 인도한다. 론다 번이 14년간 진지한 마음 탐구와 자기 탐색의 시간을 거쳐 내놓은 신작, 이 책을 통해서', '알에이치코리아(RHK)', '98561058');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '마지막 몰입 : 나를 넘어서는 힘', 400, 0, 0, 9.6, '짐 퀵 저/김미정 역', '2021-02-23', '일론 머스크가 자문하는 두뇌 전문가의 책! 세계 정상급의 CEO와 운동선수 뿐 아니라 백악관, 하버드, 구글에서 찾는 독보적인 브레인 코치 "짐 퀵"의 성공 전략을 담은 책이다. 빌 게이츠, 오프라 윈프리 등 세계 상위 1%가 극찬하는 최고의 두뇌 전문가가 되기까지 그의 인생을 바꾼 잠재력의 힘이 무엇인지 책을 통해 배울 수 있다.', '비즈니스북스', '97522081');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '터지는 콘텐츠는 이렇게 만듭니다', 400, 0, 0, 9.5, '박창선 저', '2021-03-25', '“답 없는 콘텐츠 그만하고, 우리도 트래픽 좀 터져보자!”
순수익 ‘0’에서 대박 콘텐츠 하나로 5개월 만에 3년간의 목표 수익 달성!', '유영', '98830130');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '못난 게 아니라, 조금 서툰 겁니다', 400, 0, 0, 9.6, '조지선 저', '2021-03-25', '어설픈 위로는 가라 !
삶에 서툰 보통의 어른들에게 _ 한입심리학이 전하는 “근거 있는 위로”와 “일상밀착형 조언들”', '책으로여는세상', '97963009');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '절대 배신하지 않는 공부의 기술', 400, 0, 0, 9.3, '이상욱(긍정에너지토리파) 저', '2021-02-28', '화제의 영상 ‘저는 이 공부법으로 의사가 되었습니다’
유튜브 구독자수 22만 명, 누적 조회수 1,600만!
랜선 공부 멘토 ‘긍정에너지토리파’ 공부법의 모든 것!', '웅진지식하우스', '97658378');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '은둔의 즐거움', 400, 0, 0, 9.7, '신기율 저', '2021-03-10', '행복하고 자유로운 삶을 위해, 우리는 더 고독해질 필요가 있다
혼자 웅크리는 응축의 힘을 모아, 세상에 다시 나설 용기를 주는 책', '웅진지식하우스', '97948419');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '하나를 비우니 모든 게 달라졌다', 400, 0, 0, 9.0, '이초아 저', '2021-03-31', '한 번 하나 비웠을 뿐인데, 변화를 이끄는 비움 아이템 50비우고 채우며 찾는 진짜 나의 라이프스타일', '북스톤', '98796153');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '생각의 각도', 400, 0, 0, 9.4, '이민규 저', '2021-03-02', '지난 20여 년간 ‘성공적이고 행복한 삶을 살기 위해서는 1%만 바꾸면 된다’며 수많은 독자의 꿈을 찾아주고 행동을 변화시킨 심리학자 이민규 교수가 ‘생각의 각도를 1도만 바꾸면 진정으로 인생을 향유할 수 있다’는 메시지를 담아 독자에게 이야기를 건넨다.', '끌리는책', '97641248');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '40대 인생이 바뀌는 공부', 400, 0, 0, 0, '이대형 저', '2021-03-31', '『40대 인생이 바뀌는 공부』는 SKY 출신도 아닌 사람의, 20대도 아닌 사람의 평범한 대한민국의 위기에 선 40대 가장의 공인중개사, 감정평가사 스트레이트 도전기이다.', '바른북스', '98809592');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '겁내지 않고 그림 그리는 법', 300, 0, 0, 10.0, '이연 저', '2021-03-24', '53만 구독자를 보유한 미술 크리에이터 이연의 첫 에세이. 이 책은 단순히 그림을 잘 그리는 법을 소개하는 책이 아니다. 지금까지 포기하지 않고 그림을 그릴 수 있었던 마음과 태도를 담았다. 그의 진심이 담긴 이야기에서 시작조차 하지 못했던 두려움을 떨쳐버리고 첫 걸음을 내딛을 용기를 얻는다.', '미술문화', '98390254');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '이상하고 자유로운 할머니가 되고 싶어', 300, 0, 0, 9.4, '무루 저', '2020-05-12', '그림책을 읽는 어른으로 살아가는 ‘무루’. 어제보다 오늘 조금 더 나은 삶을 완성하기 위해 그녀는 오늘도 그림책을 읽는다. 혼자서 천천히 세상을 바라보고, 모험과 성장을 두려워하지 않는 그림책 속에서 발견한 세상. 그 길을 따라가다 보면 우리의 세상도 몇 칸쯤 더 넓어질 것 같다.', '어크로스', '90184140');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '평범한 결혼생활', 300, 0, 0, 0, '임경선 저', '2021-03-11', '만난 지 3주만의 급작스런 청혼, 석 달 간의 짧은 연애 그리고 바로 이어진 20년 간의 결혼생활. 임경선 작가가 20년 세월을 한 남자와 살며 느낀 결혼생활에 대한 이야기를 담은 산문집을 출간했다. 복잡하게 행복하고 복잡하게 불행한 결혼에 대한 다양한 감정을 솔직하게 담아냈다.', '토스트', '97702661');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '기록하기로 했습니다', 300, 0, 0, 9.3, '김신지 저', '2021-02-09', '기록덕후 김신지 작가가 오늘을 기록하는 22가지 아이디어를 소개한다. 일기부터 영감 노트까지, 구체적이고 재미있는 기록연습으로 누구나 기록하는 사람이 될 수 있다. 매일을 기록하는 습관은 나에게 중요한 것, 삶의 사소한 기쁨을 발견하게 해줄 것이다', '휴머니스트', '97032664');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '천문학자는 별을 보지 않는다', 300, 0, 0, 9.2, '심채경 저', '2021-02-22', '‘창백한 푸른 점’ 속 천문학자가
일상을 살아가며, 우주를 사랑하는 법
『네이처』가 미래의 달 과학을 이끌 과학자로 주목한 심채경의 첫 에세이
이론물리학자 김상욱, 『씨네21』 김혜리 기자 강력 추천!
천문학자의 눈으로 바라본 일상과 세상, 그리고 멀고도 가까운 우주', '문학동네', '97587008');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '설레는 건 많을수록 좋아', 300, 0, 0, 10.0, '김옥선 저', '2021-03-29', '유튜버 ‘여락이들’의 가식 0% 역대급 재미 보장 여행기!
“내가 뭘 선택하든 후회하지 말자. 내가 겪은 경험들은 무엇과도 바꿀 수 없다.”', '상상출판', '98859230');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '새로운 가난이 온다 ', 500, 0, 0, 9.4, '김만권 저', '2021-01-29', '다가올 빈곤, 누구도 예외가 아니다! 산업혁명 직후 부는 소수에 집중됐다. 『공산당 선언』이 인기를 끈 배경이다. 21세기에 등장한 새로운 테크놀로지가 부의 집중으로 이어지고 있다. 불평등은 혐오와 분노를 낳는다. 늘어나는 격차 앞에 놓인 우리의 선택지는 무엇일까? 철학자 김만권이 답한다.', '혜다', '97123858');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '인류를 식량 위기에서 구할 음식의 모험가들', 500, 0, 0, 9.6, '아만다 리틀 저/고호관 역', '2021-01-15', '지속가능한 발전은 먹거리를 빼놓고는 논할 수 없다. 과학 기술은 식량 위기를 대비하고 있다. 이 책은 세계 각지에서 미래의 음식을 찾기 위한 실험을 소개한다. 탄소를 줄일 수 있는 배양육, 도시 농업, 가뭄을 견디는 식물 등 음식 혁명은 조용히 진행 중이다. ', '세종서적', '96793983');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '치유와 억압의 집, 여성병원의 탄생', 500, 0, 0, 0, '디어드러 쿠퍼 오언스 저/이영래 역', '2021-03-23', '여성을 ‘위한’ 병원은 왜 여성을 불편하게 만드는가?
여성과 의학, 사회가 맺을 새로운 관계를 위해 넘어서야 할 유산
미국 남부 노예 오두막에서 시작된 현대 산부인과의 기원과 역사!', '갈라파고스', '98137207');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '리볼트', 500, 0, 0, 9.5, '나다브 이얄 저/최이현 역', '2021-02-22', '이스라엘 기자 나다브 이얄은 10여 년 동안 세계화로 고통받는 세계 곳곳의 사람들을 취재했다. 책에 실린 사례는 우리가 어렴풋이 아는 내용이다. 불평등, 노동 착취, 생태계 파괴 등 세계화는 많은 사람의 생존을 위협한다. 파국을 막기 위해 이제는 현실을 직시해야 한다.', '까치(까치글방)', '97518023');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '동자동 사람들', 500, 0, 0, 8.8, '정택진 저', '2021-01-25', '서울역 맞은편에 위치한 동자동 쪽방촌. 이곳에서는 대한민국 1인당 GDP가 3만 달러를 넘어섰다는 소식이 체감되지 않는다. 제도적인 지원과 다양한 단체의 돌봄에도 이들은 왜 쪽방촌을 벗어날 수 없을까? 한 젊은 연구자의 시선에 비친 대한민국 가난의 현주소를 담았다', '빨간소금', '97154013');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '빌 게이츠, 기후재앙을 피하는 법', 500, 0, 0, 9.6, '빌 게이츠 저/김민주, 이엽 역', '2021-02-16', '마이크로소프트 창업자이자 혁신적인 CEO였던 빌 게이츠. 현재 그는 자선 사업가와 환경주의자로서 살아가고 있다. 빌 게이츠는 지난 10년간 기후 위기에 관해 골몰해왔다. 종말과 파멸의 메시지를 담은 여타 환경책과 달리 이 책은 인류가 극복할 수 있다는 확신에 선다.', '김영사', '97418314');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '쌀 재난 국가', 500, 0, 0, 9.7, '이철승 저', '2021-01-25', '『불평등의 세대』의 저자 이철승 교수의 신작. 한국사회 불평등의 기원과 현재를 규명했다. 불평등을 다룬 대부분의 책은 자본주의적 생산 양식을 분석하는데, 이 책은 동아시아 벼농사 체제에 주목한다. 한반도 고대국가의 형성부터 최근 팬데믹에 이르는 시간을 관통한다.', '문학과지성사', '97142498');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '사이보그가 되다', 500, 0, 0, 9.8, '김초엽, 김원영 저', '2021-01-15', '김초엽 소설가와 김원영 변호사는 공통점이 있다. 어린 시절부터 손상된 신체를 보완하는 기계(보청기와 휠체어)와 만났다는 점이다. 두 사람은 자신의 경험과 사색을 통해 사이보그가 그려갈 미래를 논한다. 사이보그의 존재론과 윤리에 관한 두 사람의 통찰이 빛난다.', '사계절', '96565175');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '공포의 문화', 500, 0, 0, 9.0, '배리 글래스너 저/윤영삼 역', '2020-12-18', '언론과 기업, 정치인은 대중의 공포심을 먹고 산다
우리 안에 깃든 가짜 두려움을 직시하라', '라이스메이커', '96186196');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '러스트벨트의 밤과 낮', 500, 0, 0, 9.0, '엘리스 콜레트 골드바흐 저/오현아 역', '2020-12-15', '2020년 미국 대선의 격전지, 러스트벨트에서 터져 나온
여성 철강 노동자의 목소리
아마존 추천 ‘최고의 전기 및 회고록’', '마음산책', '96040364');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '푸도폴리', 500, 0, 0, 9.7, '위노나 하우터 저/박준식, 이창우 역', '2020-11-23', '푸도폴리는 푸드(Food)와 모노폴리(Monopoly)의 합성어이다. 즉 ‘먹거리 독점’을 뜻한다. 지은이 위노나 하우터는 현재 유기농 가족농장을 운영하며 로컬푸드운동에 동참하고 있다. 하지만 미국에서 가장 존경받는 먹거리운동가의 한 명으로서 하우터는, 로컬푸드운동이 먹거리 위기와 생태 위기를 해결하는 데에는 충분치 않다고 생각한다. 『푸도폴리』에서 그녀는 문제의 진짜 원인을 겨냥한다. 농민이 건강한 농산물을 기르지 못하게 하고, 식료품점에서 소비자의 선택을 제한하는 소수 대기업에 의한 먹거리 생산 통제, 곧 푸도폴리이다. 정치권력 역시 이를 뒷받침하고 있다.', '빨간소금', '95712936');
INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE)
VALUES(SEQ_BOOK.NEXTVAL, '돈의 속성', 900, 0, 0, 9.5, '김승호 저', '2020-06-15', '『알면서도 알지 못하는 것들』 김승호 회장의 최신간. 유튜브에서 1,600만 명이 시청한 <돈의 속성> 완결편으로 책을 출간했다. 복잡하고 어려운 내용은 없다. 그저 자신이 가장 잘할 수 있고, 잘 아는 "돈 버는" 모든 것을 명료하게 풀었다. 하나의 인격체와 같은 돈, 그동안 내가 알던 돈에 관한 생각을 과감히 수정한다', '스노우폭스북스', '90428162');
