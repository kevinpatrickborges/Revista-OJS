{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
    {assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}

<!-- Adicionar Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<!-- Adicionar CSS Customizado para a Tela Principal -->
<link href="{$baseUrl}/plugins/themes/bootstrap3/styles/custom-headerTelaPrincipal.css" rel="stylesheet">

<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
    <div class="pkp_structure_page">

        <nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
    <ul>
        <li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
        <li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
        <li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
        <li><a href="#footer">Rodapé</a></li>
    </ul>
</nav>

        {* Header *}
<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

    <!-- Seção Superior: Banner com imagem de fundo, logo RPCIRN e utilitários -->
    <div class="home-banner-area">
        <div class="container-fluid">
            <a href="{url page="index" router=$smarty.const.ROUTE_PAGE}" class="home-banner-logo">
                <img src="{$baseUrl}/plugins/themes/bootstrap3/images/RPCIRN.png" alt="{translate key="common.pageHeaderLogo.altText" contextName=$currentContext->getLocalizedName()}" />
            </a>
            <div class="home-banner-utilities">
                {load_menu name="user" id="navigationUserHome" ulClass="nav nav-pills user-menu-pills white-text-links"} {* Classe 'white-text-links' para estilização CSS *}
                <div class="language-switcher-combined-wrapper">
                    {include file="frontend/components/languageSwitcher.tpl"}
                </div>
            </div>
        </div>
    </div>

    <!-- Seção Inferior: Navegação Principal e Busca -->
    <div class="home-navigation-search-bar">
        <div class="container-fluid">
            {* Botão do Menu Mobile (Hamburger) para a barra de navegação da home *}
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNavAndSearchHome" aria-expanded="false" aria-controls="mainNavAndSearchHome">
                    <span class="sr-only">{translate key="plugins.themes.bootstrap3.accessible_menu.toggle_navigation"}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <nav id="mainNavAndSearchHome" class="collapse navbar-collapse"> {* ID alterado para evitar conflitos com JS global, se houver *}
                <div class="navigation-and-search-inner-wrapper">
                    {capture assign="primaryMenuHome"}
                        {load_menu name="primary" id="main-navigation-home" ulClass="nav navbar-nav custom-main-navigation"} {* ID alterado *}
                    {/capture}
                    {$primaryMenuHome}

                    {if $currentContext}
                        <div class="custom-search-area">
                            <form class="pkp_search pkp_search_custom_layout" method="get" action="{url router=$smarty.const.ROUTE_PAGE page="search"}" role="search">
                                <div class="search-container">
                                    <input type="text" name="query" value="{$searchQuery|escape|default:''}" placeholder="{translate key="common.search"}" aria-label="{translate key="common.search"}">
                                    <button type="submit">
                                        <i class="fas fa-search" aria-hidden="true"></i>
                                        <span class="sr-only">{translate key="common.search"}</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    {/if}
                </div>
            </nav>
        </div>
    </div>
</header><!-- .pkp_structure_head -->

        {* Wrapper for page content and sidebars *}
        <div class="pkp_structure_content container">
            <main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">



</body>
</html>