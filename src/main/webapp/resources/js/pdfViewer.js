// pdfViewer.js

// PDF 렌더링 및 페이지 네비게이션 기능
function initializePdfViewer(pdfUrl, viewerId, prevBtnId, nextBtnId, scale = 1.5) {
    let pdfDoc = null;
    let currentPage = 1;

    // PDF.js 설정
    pdfjsLib.getDocument(pdfUrl).promise.then(function(pdf) {
        pdfDoc = pdf;
        renderPage(currentPage);
    }).catch(function(error) {
        console.error('Error: ' + error);
    });

    // 페이지 렌더링 함수
    function renderPage(pageNum) {
        pdfDoc.getPage(pageNum).then(function(page) {
            const viewport = page.getViewport({ scale: scale });
            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');
            canvas.width = viewport.width;
            canvas.height = viewport.height;

            // PDF 페이지를 캔버스에 렌더링
            page.render({
                canvasContext: context,
                viewport: viewport
            });

            const viewer = document.getElementById(viewerId);
            viewer.innerHTML = ''; // 기존 페이지 삭제
            viewer.appendChild(canvas);
        });
    }

    // 이전 페이지 버튼
    document.getElementById(prevBtnId).addEventListener('click', function() {
        if (currentPage > 1) {
            currentPage--;
            renderPage(currentPage);
        }
    });

    // 다음 페이지 버튼
    document.getElementById(nextBtnId).addEventListener('click', function() {
        if (currentPage < pdfDoc.numPages) {
            currentPage++;
            renderPage(currentPage);
        }
    });
}
