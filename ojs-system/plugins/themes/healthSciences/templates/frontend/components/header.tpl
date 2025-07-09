{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * @Kevinpatrickborges
 * @brief Common frontend site header.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if !$displayPageHeaderLogo}
	{assign var="showingLogo" value=false}
{/if}

{capture assign="homeUrl"}
	{url page="index" router=$smarty.const.ROUTE_PAGE}
{/capture}

{* Logo or site title. Only use <h1> heading on the homepage.
	 Otherwise that should go to the page title. *}
{if $requestedOp == 'index'}
	{assign var="siteNameTag" value="h1"}
{else}
	{assign var="siteNameTag" value="div"}
{/if}

{* Determine whether to show a logo of site title *}
{capture assign="brand"}{strip}
	{if $displayPageHeaderLogo}
		<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
		     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
		     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}
				 style="max-height: 80px; max-width: 400px; object-fit: contain;">
	{elseif $displayPageHeaderTitle}
		<span style="font-size: 1.25rem; font-weight: 500; color: #333;">{$displayPageHeaderTitle|escape}</span>
	{else}
		<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" style="max-height: 80px; max-width: 400px; object-fit: contain;">
	{/if}
{/strip}{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body dir="{$currentLocaleLangDir|escape|default:"ltr"}" style="display: flex; flex-direction: column; min-height: 100vh;">

{* Header *}
<header id="header" class="main-header" style="background-color: #fff; box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05); position: fixed; top: 0; left: 0; width: 100%; height: 5rem; transition: all 0.3s ease-in-out; z-index: 50;">
	<div class="container" style="max-width: 1200px; margin: 0 auto; padding: 0 1.5rem; height: 100%; display: flex; align-items: center; justify-content: space-between;">
		
		{* Logo *}
		<{$siteNameTag} class="navbar-logo" style="margin: 0; flex: 0 0 auto; width: 450px;">
			<a href="{$homeUrl}" style="color: #333; text-decoration: none;">{$brand}</a>
		</{$siteNameTag}>

		{* Menus and Language Switcher *}
		<div style="display: flex; align-items: center; gap: 1rem; flex: 10; justify-content: justify-between;">
			{* Main navigation *}
			<nav class="navbar navbar-expand-lg navbar-light" style="margin: 0;">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-navbar"
						aria-controls="main-navbar" aria-expanded="false"
						aria-label="{translate key="plugins.themes.healthSciences.nav.toggle"}">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="main-navbar" style="justify-content: flex-start;">
					{* Primary menu *}
					{capture assign="primaryMenu"}
						{load_menu name="primary" id="primaryNav" ulClass="navbar-nav" liClass="nav-item"}
					{/capture}
					{if !empty(trim($primaryMenu)) || $currentContext}
						{$primaryMenu}
					{/if}
					{* User menu for small screens *}
					{load_menu name="user" id="primaryNav-userNav" ulClass="navbar-nav" liClass="nav-item"}
					{include file="frontend/components/languageSwitcher.tpl" id="languageSmallNav"}
				</div>
			</nav>

			{* User menu for large screens *}
			<div style="margin-left: 20px;">
				{load_menu name="user" id="userNav" ulClass="navbar-nav" liClass="nav-item"}
			</div>
		</div>
	</div>
	

</header>
<div id="header-spacer" style="height: 6rem;"></div>

{* JavaScript for header shrink *}
<script>
    window.addEventListener("scroll", function () {
    var header = document.getElementById("header");
    var spacer = document.getElementById("header-spacer");
    var dropdowns = document.querySelectorAll('.dropdown-menu');

    if (window.scrollY > 50) {
        header.style.height = "4rem";
        header.style.padding = "0.25rem 1.25rem";
        spacer.style.height = "4rem";
        header.querySelector(".navbar-logo").style.fontSize = "1rem";
        header.querySelector(".navbar-logo img").style.maxHeight = "50px";
        header.querySelector(".navbar-logo img").style.maxWidth = "300px";
        
        // Garante que os dropdowns permaneçam dentro do header
        dropdowns.forEach(function(dropdown) {
            dropdown.style.top = "calc(4rem + 5px)"; // Ajuste fino para o dropdown
            dropdown.style.position = "absolute";
            dropdown.style.zIndex = "1000";
        });

    } else {
        header.style.height = "6rem";
        header.style.padding = "";
        spacer.style.height = "6rem";
        header.querySelector(".navbar-logo").style.fontSize = "1.25rem";
        header.querySelector(".navbar-logo img").style.maxHeight = "80px";
        header.querySelector(".navbar-logo img").style.maxWidth = "400px";

        dropdowns.forEach(function(dropdown) {
            dropdown.style.top = "calc(6rem + 5px)";
        });
    }
});

</script>