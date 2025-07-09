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
 * represents a page-level override, and doesn't indicate whether or not
 * sidebars have been configured for thesite.
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

<link href="{$baseUrl}/plugins/themes/bootstrap3/styles/custom-header.css" rel="stylesheet">

<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">

    <div class="pkp_structure_page">

        {* Accessibility Navigation *}
        <nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
            <ul>
                <li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
                <li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
                <li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
                <li><a href="#footer">Rodapé</a></li>
            </ul>
        </nav>

        {* Header *}
        <header class="pkp_structure_head" id="headerNavigationContainer" role="banner">

            {* Top Bar *}
            <div class="header-top-bar">
                <div class="container">
                
                    <div class="top-bar-right">
                        {load_menu name="user" id="navigationUser" ulClass="user-menu-pills"}
                    </div>
                </div>
            </div>

            {* Main Header *}
            <div class="header-main">
                <div class="container">
                    <div class="header-main-inner">
                        <div class="site-branding">
                            {capture assign="homeUrl"}{url page="index" router=$smarty.const.ROUTE_PAGE}{/capture}
                            <a href="{$homeUrl}" class="logo-link">
                                {* O caminho do logo foi ajustado para carregar a imagem especificada a partir da pasta do tema. *}
                                <img src="{$baseUrl}/plugins/themes/bootstrap3/images/RPCIRN.png" alt="Logo da Revista Polícia Científica do Rio Grande do Norte">
                            </a>

                        <nav id="main-navigation" class="main-navigation" role="navigation" aria-label="{translate key="common.navigation.primary"}">
                             {* Mobile Menu Toggle *}
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#primary-nav-menu" aria-expanded="false">
                                <span class="sr-only">{translate key="plugins.themes.bootstrap3.accessible_menu.toggle_navigation"}</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div id="primary-nav-menu" class="collapse navbar-collapse">
                                {load_menu name="primary" ulClass="nav navbar-nav"}
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        {* Wrapper for page content and sidebars *}
        <div class="pkp_structure_content container">
            <main class="pkp_structure_main col-xs-12{if $isFullWidth} col-md-12{else} col-md-8{/if}" role="main">