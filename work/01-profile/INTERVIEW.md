# 3년 뒤의 나 — 인터뷰 대본 (클로드 코드용)

사용자가 "INTERVIEW.md대로 인터뷰해줘"라고 하면 이 문서를 그대로 따른다.
끝나면 `profile.js`가 채워지고, 프로필 사이트가 아티팩트로 게시되고, 허브 첫 카드로 올라간다.

## 원칙

- **한 번에 한 질문만** 묻는다. 답을 받은 뒤 다음 질문으로.
- **들은 것만 쓴다.** 숫자·경력·수상·회사명을 지어내지 않는다. 비면 비워 둔다.
- 답이 길거나 흐릿하면 "예를 들면?" 한 번만 되묻는다. 재촉하지 않는다.
- 문장은 **3년 뒤 시점**("하고 있다", "만들었다")으로 다듬되, 다듬은 문장은 사용자에게 보여 주고 확인받는다.
- 개인정보 최소화. 전화번호·집 주소·재직 회사 내부 정보는 묻지도 쓰지도 않는다. 이메일은 "공개해도 되는 주소"만.

## 0. 허브 설정 (맨 먼저, 세 가지)

허브 `data.js`의 `profile`에 들어간다. 이 셋만 사람마다 다르고 나머지 문구는 공통이다.

| 순서 | 질문 | 들어가는 곳 |
|---|---|---|
| 0-1 | 사이트에 쓸 이니셜은? (예: HS) | 허브 `profile.name` · 프로필 A1과 같은 값 |
| 0-2 | 홈페이지 키컬러로 쓸 좋아하는 색은? (예: 노랑·파랑·초록·주황·분홍·보라) | 허브 `profile.accent` + 프로필 `index.html`의 `:root` 세 값 — 아래 표대로 |
| 0-3 | **"2026년이 끝나기까지 3개월. 올해 안에 해내고 싶은 것은? AI가 도와줍니다."** | 허브 `profile.goal` 한 줄. 단계가 나오면 `profile.goalNote`에 "A → B → C" |

색 이름 → 값. 허브에는 `accent`만 넣고(진한 글자색·연한 배경은 허브가 자동), 프로필에는 세 값을 모두 넣는다.

| 색 | `accent` (면) | `accent-ink` (글자·아이콘) | `accent-text` (키컬러 박스 위 글자) |
|---|---|---|---|
| 노랑 | `#F9FA82` | `#121414` | `#121414` |
| 파랑 | `#0057FF` | `#0057FF` | `#FFFFFF` |
| 초록 | `#1FA548` | `#147A35` | `#121414` |
| 주황 | `#FF4D00` | `#C23A00` | `#121414` |
| 분홍 | `#FF4FA3` | `#D1206F` | `#121414` |
| 보라 | `#6B4EFF` | `#6B4EFF` | `#FFFFFF` |
| 빨강 | `#E5322D` | `#D12A25` | `#FFFFFF` |
| 민트 | `#17B3A6` | `#0B7D74` | `#121414` |
| 검정 | `#14181C` | `#14181C` | `#FFFFFF` |

다른 색을 말하면 가장 가까운 것으로. `accent-ink`는 밝은 바탕에서 글자로 읽히는 값, `accent-text`는 키컬러 박스 위에서 읽히는 값이다 (명도 대비 4:1 이상).

0-3 답은 한 문장으로 압축해 확인받는다. 예: "기쁜소식을 담은 짧은 그림책 만들기." + 단계 "스토리 → 그림 → 인쇄 → 제본".

## A. 기본 정보 (먼저, 짧게)

| 순서 | 질문 | 들어가는 곳 |
|---|---|---|
| A1 | **묻지 않는다.** 0-1 답을 그대로 쓴다 | `meta`, `hero.name`, `hero.nameLines[1]`, `footer.name` |
| A2 | 프로필 시점은 몇 년으로 할까요? 기본은 2029(3년 뒤) | `meta.year`, `footer.copyright`, roles의 period |
| A3 | 지금 직무와 경력 시작 연도는? (예: 해외영업, 2019년) | `experience.since.start / field` → "N년차"는 자동 계산 |
| A4 | 최종 학력의 전공과 학위는? (학교명은 넣고 싶을 때만) | `experience.since.degree`, 원하면 `education` |
| A5 | 공개해도 되는 이메일이 있나요? 없으면 비워 둡니다 | `contact.email` |
| A6 | 인스타그램·링크드인 등 사이트에 걸 SNS 주소가 있나요? | `contact.social[].url` |
| A7 | 프로필 사진으로 쓸 이미지 파일이 있나요? 있으면 이 폴더에 넣어 달라고 한다 | `hero.photo` |

## B. 세 질문 (3년 뒤 시점)

| # | 질문 | 들어가는 곳 |
|---|---|---|
| 1 | 3년 뒤 내 이름 아래 적히고 싶은 역할 3개 (명함)<br>예) Founder · Creator · Author · Designer · Director · CEO · PM | `hero.roles`, `footer.role` |
| 2 | 3년 안에 꼭 완성하고 싶은 대표 프로젝트 3개<br>예) 브랜드 출시 / 앱 출시 / 전시 / 게임 제작 / 내게 딱 맞는 AI 에이전트 구성 등 | `work[]` — title · category · summary 한 줄 |
| 3 | 3년 뒤 What I Do — 내가 갖고 싶은 능력 3개 이상 (추상적인 문장도 OK) | `services[].title` (+ 한 줄 `desc`) |

질문은 위 문구 그대로, 예시까지 함께 보여 준다.
`hero.positioning`(한 줄 소개)·`hero.intro`(소개 1~2줄)·`about.body`는 세 답을 합쳐 초안을 쓰고 확인받는다. 사용자가 따로 말한 한 줄 소개가 있으면 그것을 쓴다.
`experience.roles`·`numbers`·`notes`는 묻지 않는다. 사용자가 스스로 말한 것만 넣고, 없으면 비워 둔다.

## C. 채우기

1. `profile.js`를 위 표대로 채운다. 못 채운 칸은 빈 값으로 둔다 (자동으로 숨겨진다).
2. `contact.channels`의 RUNWAY Hub에는 내 허브 사이트 URL을 넣는다 (허브를 아직 안 게시했으면 나중에).
3. 채운 뒤 사용자에게 **틀린 곳·빼고 싶은 곳**을 묻는다. 최대 3번 수정.

## D. 게시

`index.html`을 아티팩트로 게시하되 `profile.js`(사진이 있으면 사진 파일도)를 **반드시 함께** 올린다.
URL을 받으면 다음 재게시부터는 같은 URL을 유지한다.

## E. 허브 첫 카드

CLAUDE.md의 "카드 한 장 추가하는 절차"대로. 값은 아래를 기본으로 한다.

```js
{
  id: "01-profile",
  title: "3년 뒤의 나 · 프로필",
  category: "프로필",
  date: "2026.09",
  tags: ["Claude Code"],
  url: "<D에서 받은 URL>",
  thumb: "thumbs/01-profile.png",     // 아래 고정 앵글로 캡처
  badge: "NEW"
}
```

프로필 썸네일은 **고정 앵글**로 찍는다 — 히어로의 이름·역할·한 줄만 크게, 왼쪽 정렬, 3:2. 원은 잘려도 된다.

```
powershell -ExecutionPolicy Bypass -File tools/capture.ps1 -Target work/01-profile/index.html -Out thumbs/01-profile.png -Width 960 -Height 640 -CropX 24 -CropY 100 -CropW 720 -CropH 480
```
(맥: `bash tools/capture.sh work/01-profile/index.html thumbs/01-profile.png 960 640 24 100 720 480`)

허브 `data.js`의 `profile`은 0단계 답으로 채운다: `name`(0-1) · `accent`(0-2) · `goal`·`goalNote`(0-3). `bio`는 A3 답으로 한 줄(예: "해외영업 담당 HS.").
`headline`·`intro`·`brand`·`eyebrow`는 공통 문구라 손대지 않는다.

## F. 스타일

기본 디자인(연회색 바탕 · 검정 컨덴스드 이름 · 키컬러 원)이 디폴트다. 키컬러는 0-2 답으로 `:root`의 `--accent` · `--accent-ink` · `--accent-text` 세 값만 바꾼다 (0단계 표). 허브와 프로필이 같은 색이 된다.
그 밖에 바꾸고 싶으면 `index.html` 상단 `:root`의 색과 서체 링크만 바꾸면 된다. 구조(5개 영역)는 유지한다.
