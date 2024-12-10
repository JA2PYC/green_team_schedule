// terms.js

$(document).ready(() => {
    const pdfUrl = '/resources/pdf/privacyPolicy.pdf';  // PDF 파일 경로
    const viewerId = 'pdf-viewer';  // PDF 렌더링할 요소 ID
    const prevBtnId = 'prev';  // 이전 페이지 버튼 ID
    const nextBtnId = 'next';  // 다음 페이지 버튼 ID

    // PDF Viewer 초기화
    initializePdfViewer(pdfUrl, viewerId, prevBtnId, nextBtnId);
});
