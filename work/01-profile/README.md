# 원페이지 프로필 템플릿 — "3년 뒤의 나"

인터뷰 대본은 `INTERVIEW.md`. 클로드 코드가 그대로 인터뷰해서 `profile.js`를 채운다.

`index.html`은 틀, `profile.js`는 내용. **내용을 바꿀 때는 profile.js만 고친다.**

## 섹션 (5개 고정 — "읽는 사이트"가 아니라 "훑어보는 포트폴리오")

1. Hero — 큰 글자 두 줄(`hero.nameLines`, 예: "This is" / "LJ") · 역할 2~3개 · 한 줄 포지셔닝 · 소개 1~2줄 · 사진. CTA 없음 (2026-09-22 정리)
2. Selected Work — 가장 크게. 정사각형 이미지 · 제목 · 분류 · 한 줄(summary) 끝에 작은 초록 "more →". 카드 전체가 링크. 카드 머리글 높이를 고정해 줄이 맞는다. 긴 설명·역할·성과는 홈에 안 나온다 (케이스 스터디용으로 profile.js에만 남김)
3. Profile / Proof (왼쪽) — 이력 3~5줄(Now · Also · Since(`experience.background`) · Credential · Education, 내용은 한글) → 숫자 3개 → 인용 상자(인터뷰에서 나온 "나의 특별한 점" 한 문장, `about.body`)
4. What I Do (오른쪽) — 제목만. 마우스를 올리거나 누르면 한 줄 설명
5. Footer — Let's Connect 한 줄 + Get in touch(이메일 글자 · AI Runway Log. PDF는 `contact.download`를 채우면 나타남) + Follow along(`contact.social` 아이콘: linkedin · instagram · behance · github · dribbble) + 이름 · 저작권

빈 값은 자동으로 숨겨진다. 숫자가 없으면 `numbers: []`.

## 자주 바꾸는 것

- 사진: `hero.photo`에 이미지 경로. 같은 폴더에 두고 게시할 때 함께 올린다.
- 작업 이미지: `work[].image`. 비우면 `mock` 값(tract / book / game)이나 제목 타일이 대신 보인다.
- 아이콘 이름: direction · story · visual · ip · product · ai · research · design · code
- 이메일: `contact.email`에 실제 주소. 비우면 `contact.emailPlaceholder` 글자가 보인다. 채널 링크는 `contact.channels[].url`, SNS 아이콘은 `contact.social[].url`(비우면 회색 원).
- About: `about.points`(체크 목록 3개), `about.signature`(서명 글자), `about.image`(아치형 이미지).
- 상단 왼쪽 상자 글자: `meta.siteLabel`.

## 스타일 메모 (2026-09-22)

연회색 바탕 · 검정 컨덴스드 이름 · 초록 원과 포인트 · 가는 괘선 · Playfair 숫자. (첫 번째 참고 이미지 스타일로 확정)

## 게시

index.html과 profile.js(사진이 있으면 사진도)를 함께 올린다. 같은 URL 유지.
