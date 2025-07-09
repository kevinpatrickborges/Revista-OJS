// custom-header.js - Script para esconder o header ao rolar a página

document.addEventListener('DOMContentLoaded', function () {
    let header = document.getElementById('headerNavigationContainer');
    if (!header) return; // Garante que o script não quebre se o header não existir

    let lastScrollTop = 0;

    window.addEventListener('scroll', function () {
        let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

        // Esconde o header se estiver rolando para baixo
        if (scrollTop > lastScrollTop && scrollTop > 150) { // O 150 é a altura em pixels antes de começar a esconder
            header.classList.add('hidden');
        } else {
        // Mostra o header se estiver rolando para cima
            header.classList.remove('hidden');
        }

        lastScrollTop = scrollTop <= 0 ? 0 : scrollTop; 
    }, { passive: true }); 
});