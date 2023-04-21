const link = document.getElementById('preview-link');
const preview = document.getElementById('preview');
const closePreview = document.getElementById('close-preview');
const iframe = document.getElementById('preview-iframe');

let hoverTimeout;
let permanent = false;

link.addEventListener('mouseenter', (event) => {
    const linkRect = link.getBoundingClientRect();
    preview.style.left = `${linkRect.left}px`;
    preview.style.top = `${linkRect.bottom}px`;
    iframe.src = link.href;

    preview.classList.remove('hidden');

    hoverTimeout = setTimeout(() => {
        permanent = true;
    }, 1000);
});

link.addEventListener('mouseleave', () => {
    clearTimeout(hoverTimeout);

    if (!permanent) {
        preview.classList.add('hidden');
        iframe.src = '';
    }
});

preview.addEventListener('mouseleave', () => {
//    if (permanent) {
//        preview.classList.add('hidden');
//        iframe.src = '';
//        permanent = false;
//    }
});

closePreview.addEventListener('click', () => {
    preview.classList.add('hidden');
    iframe.src = '';
    permanent = false;
});
