// RUNWAY 허브 — 여기만 고치면 사이트가 바뀐다.
// 새 카드는 projects 배열의 맨 앞에 넣는다 (최신이 위로).
window.RUNWAY = {
  profile: {
    name: "이니셜",                      // 예: "HS"
    brand: "RUNWAY",                     // 상단 바 오른쪽 문구
    siteTitle: "이니셜의 RUNWAY",         // 브라우저 탭 제목
    headline: "AI와 함께, 혼자서는 어려웠던 것들을 만듭니다",
    intro: "한 줄 자기소개. 직업과 지금 하는 일, 그리고 <b>12월에 무엇이 있으면 성공인지</b>.",
    note: "결과물은 회차마다 카드 한 장씩 쌓입니다.",
    eyebrow: "RUNWAY · 2026",             // 헤드라인 위 작은 글자
    northstar: "",                       // 북극성 한 줄. 2026-09-22 보류 — 비워 두면 안 보인다
    northstarNote: "",                   // 북극성 아래 한 줄 (선택)
    accent: "#0057FF",                   // 내 포인트 색 (선택). 예: 주황 "#FF4D00", 초록 "#1FA548"
    accentBg: "#E8EFFF",                 // 포인트 색의 연한 배경 (선택)
    showTags: false,                     // 카드 태그·도구 필터 표시. 지금은 숨김 (2026-09-22 결정)
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
  ]
};
