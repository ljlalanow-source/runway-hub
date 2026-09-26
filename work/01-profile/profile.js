// 3년 뒤의 나 — 프로필 사이트 내용. 이 파일만 고친다. index.html은 손대지 않는다.
// 빈 배열([])이나 빈 문자열("")로 두면 그 섹션·항목은 화면에서 자동으로 빠진다.
// 인터뷰(INTERVIEW.md)에서 들은 것만 채운다. 듣지 않은 숫자·경력은 지어내지 않는다.
window.PROFILE = {
  meta: {
    siteTitle: "이니셜 2029",       // 브라우저 탭 제목
    year: "2029",                   // 프로필 시점(3년 뒤 연도). N년차 계산에 쓴다
    monogram: ["이", "니"],          // 상단 가운데 두 글자 (영문 이니셜 두 글자 권장, 예: ["H","S"])
    tagline: ""                     // 상단 왼쪽 작은 글자. 비우면 hero.keywords 앞 두 개
  },

  // SECTION 1 — HERO
  hero: {
    name: "이니셜",
    nameLines: ["This is", "이니셜"],   // 큰 글자 두 줄
    roles: ["역할1", "역할2", "역할3"],  // 질문 1. 이름 아래 역할 2~3개
    positioning: "",                    // 세 답을 합친 한 문장 (확인받기)
    intro: "",                          // 소개 1~2줄
    keywords: [],                       // 대표 분야 키워드 (상단 왼쪽에 앞 두 개만)
    photo: ""                           // 사진 파일명. 같은 폴더에 두고 게시할 때 함께 올린다
  },

  // SECTION 2 — SELECTED WORK (질문 2, 3~5개). 홈에는 image · title · category · summary · url 만 보인다.
  work: [
    // { title: "", category: "", summary: "", image: "", mock: "", url: "" }
  ],
  // image가 없을 때 mock: "tract" | "book" | "game" 또는 비우면 제목 타일

  // SECTION 3 — WHAT I DO (질문 3, 3~6개). 제목만 보이고 desc는 마우스를 올리면 나타난다.
  // icon: direction | story | visual | ip | product | ai | research | design | code
  services: [
    // { icon: "direction", title: "", desc: "" }
  ],

  // SECTION 4 — PROFILE / PROOF
  experience: {
    // 3년 뒤의 역할들. 첫 항목이 Now, 나머지가 Also
    roles: [],            // 예: { title: "Founder", org: "○○ 스튜디오", period: "2029 — 현재" }
    // Since 줄. 경력 시작 연도만 알면 "N년차"가 자동 계산된다 (meta.year 기준)
    since: {},            // 예: { start: 2019, field: "해외영업", degree: "경영학 학사" }
    background: "",       // 직접 쓰고 싶으면 여기에. 있으면 since보다 우선
    education: [],        // 예: { title: "시각디자인 학사", org: "학교", period: "2016" }
    credentials: []       // 자격·수상·출판. 예: { title: "○○상", org: "주최", period: "2028" }
  },
  numbers: [              // 묻지 않는다. 사용자가 수치를 말했을 때만. 앞 3개만 보인다. 실제 수치가 없으면 [] — 억지로 만들지 않는다
  ],
  about: {                // 세 답에서 나온 "나의 특별한 점"을 한 문장으로. 임팩트 있고 간결하게
    body: []              // 예: ["한 문장."]
  },

  // SECTION 5 — FOOTER (Contact 포함)
  contact: {
    email: "",                              // 공개용 이메일. 비우면 emailPlaceholder가 글자로만 보인다
    emailPlaceholder: "your@email.com",
    channels: [                             // Get in touch 묶음 (글자 링크)
      { label: "RUNWAY Hub", url: "" }      // 내 허브 사이트 링크
    ],
    social: [                               // Follow along 묶음 (아이콘). icon: linkedin | instagram | behance | github | dribbble
      { icon: "instagram", url: "" },
      { icon: "linkedin",  url: "" }
    ],
    download: null                          // PDF가 생기면 { label: "Download Profile", url: "…" }
  },
  footer: {
    name: "이니셜",
    role: "역할1 · 역할2 · 역할3",
    line: "Available for selected projects.",
    copyright: "© 2029 이니셜"
  },

  // 홈에는 안 나오지만 인터뷰에서 나온 것. 케이스 스터디·다음 회차 재료
  notes: {
    changed: "",          // 묻지 않는다. 사용자가 말했을 때만 — 지금과 가장 크게 달라질 점
    knownFor: "",         // 〃 알려지고 싶은 것
    proof: "",            // 〃 받아보고 싶은 성과나 증거
    stop: ""              // 〃 더 이상 하고 싶지 않은 일
  }
};
