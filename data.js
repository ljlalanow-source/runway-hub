// RUNWAY 허브 — 여기만 고치면 사이트가 바뀐다.
// 인터뷰에서 정하는 세 가지: name(이니셜) · accent(키컬러) · goal(2026 엔딩목표). 나머지는 공통.
// 새 카드는 projects 배열의 맨 앞에 넣는다 (최신이 위로).
window.RUNWAY = {
  profile: {
    name: "이니셜",                      // ① 사이트에 쓸 이니셜. 예: "HS"
    accent: "#0057FF",                   // ② 키컬러. 배지·엔딩목표 막대·강조에 쓴다. 진한 글자색·연한 배경은 자동
    goal: "",                            // ③ 2026 엔딩목표 한 줄. 비우면 안 보인다
    goalNote: "",                        //    그 아래 단계 한 줄 (선택). 예: "스토리 → 그림 → 인쇄 → 제본"
    bio: "",                             // 내 정보 한 줄. 예: "커뮤니케이션 디자이너 엘제이."
    brand: "AI Runway Log",              // 상단 바 이니셜 옆 문구 (공통)
    siteTitle: "이니셜 · AI Runway Log",   // 브라우저 탭 제목
    eyebrow: "AI Runway Log · 2026",     // 헤드라인 위 작은 글자 (공통)
    headline: "AI로 날개를 달고\n멋진 것들을 만들어봐야지",   // 공통 문구. \n 은 줄바꿈
    intro: "각 프로젝트는 결과물과 함께 <b>AI를 어떻게 다뤘는지의 과정</b>을 기록합니다.",   // 공통 문구
    note: "결과물은 회차마다 카드 한 장씩 쌓입니다.",
    showTags: false                      // 카드 태그·도구 필터 표시. 지금은 숨김 (2026-09-22 결정)
  },

  projects: [
    // 첫 카드 — 인터뷰가 끝나면 url과 thumb를 채운다.
    {
      id: "01-profile",
      title: "3년 뒤의 나 · 프로필",
      category: "프로필",
      date: "2026.09",
      tags: ["Claude Code"],
      // url: "https://claude.ai/artifact/...",
      // thumb: "thumbs/01-profile.png",
      badge: "NEW"
    }
  ],

  // 강의 노트 (선택) — 스터디에서 직접 강의한 사람만 쓴다. 항목이 있을 때만 상단 Talks 탭과 목록이 나타난다.
  // 원본은 lectures/<id>/index.html 에 두고 아티팩트로 게시해 url을 넣는다. 최신이 위로.
  lectures: [
    // { id: "01-ai-agent", title: "AI 에이전트 이해", desc: "한 줄 요약", session: "1회차", date: "2026.09", url: "https://claude.ai/artifact/..." }
  ]
};
