{* Definindo os banners locais *}
{assign var="banners" value=[
    "banners/banner.jpg",
    "banners/banner2.jpg",
    "banners/banner3.jpg"
]}

{* Carregar Swiper CSS e JS *}
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="{$baseUrl}/plugins/themes/bootstrap3/styles/custom-swiper.css" rel="stylesheet">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style>
    /* Container principal - layout flexível */
    .banner-section {
	    position: relative;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        gap: 0px;
        max-width: 100%; /* */
        margin: 0 auto; /* centraliza a caixa */
        height: 300 px;
        position: relative;
        overflow: hidden;
        padding: 10px;
        background-color: #f0f0f0;
        border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Container do banner (Swiper) */
    .banner-container {
        flex: 1;
        max-width: 330px; 
	    margin-right: 0;
    }

    /* Estilos do Swiper */
    .swiper-container.main-banner {
        width: 50%;
        height: 250px; /* Altura fixa mantida */
        border-radius: 4px;
        overflow: hidden;
        position: relative; /* Garante que a paginação fique dentro do container */
    }.swiper-slide img {
        width: 100%;
        height: 100%;
        object-fit: cover; /* Mantém a imagem inteira, cortando excessos */
        object-position: center;
    }

    /* Esconde as setas de navegação */
    .swiper-button-prev, 
    .swiper-button-next {
        display: none !important;
    }
    
    /* Ajusta a posição e estilo das bolinhas */
    .swiper-pagination {
        position: absolute !important;
	    bottom: 0px !important;
	    left: 0;
	    right: 0;
        margin-top: 5px; /* Aumentei o espaçamento pra garantir visibilidade */
        text-align: center;
	    z-index: 10;
        padding-bottom: 10px; /* Mais espaço abaixo pras bolinhas */
    }.swiper-pagination-bullet {
        width: 5px !important; /* Aumentei um pouco o tamanho */
        height: 5px !important;
        background: #ccc !important;
        opacity: 1 !important;
        margin: 0 4px !important; /* Mais espaçamento entre bolinhas */
    }.swiper-pagination-bullet-active {
        background: #324AB2 !important;
        width: 10px !important; /* Bolinha ativa um pouco maior */
        height: 10px !important;
    }

    /* Estilos do texto */
    .banner-text {
        flex: 1;
        max-width: 350px; /* Reduzido de 400px */
        font-size: 14px;
        line-height: 1.8;
        color: #333;
        padding-left: 0px;
	    margin-left: -153px;
	    text-align: justify;
    }.banner-text strong {
        display: block;
        margin-bottom: 6px;
        font-size: 18px;
    }.btn-submission, .btn-conditions {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        border-radius: 4px;
        font-weight: bold;
        text-decoration: none;
        background: #fff;
        color: #337ab7;
        border: 1px solid #337ab7;
        transition: background 0.2s, color 0.2s;
    }
    .btn-submission:hover, .btn-conditions:hover {
        background: #337ab7;
        color: #fff;
        border: 1px solid #337ab7;
    }

    /* Container dos botões (vertical) */
    .swiper-buttons.vertical-buttons {
        position: absolute;
        margin-top: 20px;
        display: flex;
        flex-direction: column; 
        align-items: center;    
        gap: 15px;              /* Espaço entre os botões */
        bottom: 75px;           /* Ajuste conforme a altura das bolinhas */
        left: 85%;              /* Centraliza o container */
        transform: translateX(-42%); /* Ajuste fino para alinhamento */
        transition: all 0.3s;
        z-index: 15;
}

/* Estilo dos botões (opcional) */
.swiper-buttons.vertical-buttons .btn {
    width: 170px;           /* Largura fixa para uniformidade */
    text-align: center;     /* Texto centralizado */
    padding: 10px 6px;        /* Ajuste o padding para vertical */
    margin: 0;              /* Remove margens laterais */
    font-size: 11px;
    white-space: nowrap;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
	
    /* Responsividade */
    @media (max-width: 768px) {
        .banner-section {
            flex-direction: column;
            align-items: center;
            max-width: 95%;
        }
        
        .banner-container, 
        .banner-text {
            max-width: 100%;
            margin-left:0;
        }
        
        .swiper-container.main-banner {
            height: 200px;
        }
    }

    @media (max-width: 480px) {
        .swiper-container.main-banner {
            height: 150px;
        }
        
        .banner-text {
            font-size: 14px;
        }
	@media (max-width: 768px) {
    	.swiper-buttons.vertical-buttons {
        bottom: 15px; /* Ajuste para mobile */
        gap: 8px;
    }
    	.swiper-buttons.vertical-buttons .btn {
        width: auto; /* Largura menor em telas pequenas */
        font-size: 12px;
        padding 8px 12px;
    }
}
    }
</style>

<div class="banner-section">
    {* Banner Rotativo *}
    <div class="banner-container">
        <div class="swiper-container main-banner">
            <div class="swiper-wrapper">
                {foreach from=$banners item=banner}
                    <div class="swiper-slide">
                        <img src="{$baseUrl}/public/{$banner}" alt="Banner {$banner@iteration}">
                    </div>
                {/foreach}
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>

    <!-- Texto ao lado do Swiper -->
    <div class="banner-text">
        <strong>Artigos e revisões na área da Perícia Científica.</strong>
        <p>A Revista da Polícia Científica do Rio Grande do Norte (RPCIRN) tem por objetivo a publicação de artigos e revisões de literatura na área de Ciência Forense. Os autores devem concordar em não publicar em nenhuma outra revista um artigo submetido e aceito para publicação pela Revista.</p>
    </div>
	<!-- Botões SOBREPOSTOS (dentro do Swiper) -->
            <div class="swiper-buttons vertical-buttons">
    <a href="{url page='about' op='submissions'}" class="btn btn-submission" aria-label="Nova Submissão">
        Nova Submissão
    </a>
    <a href="{url page='about' op='authorGuidelines'}" class="btn btn-conditions" target="_blank" rel="noopener" aria-label="Condições para Submissão">
        Condições para Submissão
    </a>
</div>
	</div>

{* Inicializar o Swiper *}
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var swiper = new Swiper('.main-banner', {
            loop: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            effect: 'slide',
            fadeEffect: {
                crossFade: true
            }
        });
    });
</script>