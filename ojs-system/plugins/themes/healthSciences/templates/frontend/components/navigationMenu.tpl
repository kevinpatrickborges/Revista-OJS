{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Navigation menu template
 * @kevinpatrickborges
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}
			<li class="{$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}">
				{if $navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle() == "Buscar"}
					{* Lupa minimalista que redireciona ao clicar *}
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" class="search-icon nav-link">
						<svg width="15" height="16" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="search-icon-svg">
							<circle cx="11" cy="11" r="8"></circle>
							<line x1="21" y1="21" x2="16.7" y2="16.65"></line>
						</svg>
					</a>
				{else}
					{* Itens com subitens (ex.: Sobre) usam <span> pra abrir o dropdown *}
					{if $hasChildren}
						<span class="nav-link{if $hasChildren} dropdown-toggle{/if}"
							{if $hasChildren}
								id="{'navMenuDropdown'|concat:$field}"
								aria-haspopup="true"
								aria-expanded="false"
							{/if}
						>
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</span>
					{else}
						{* Itens sem subitens (ex.: Atual, Acervo, Notícias) usam <a> pra redirecionar *}
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" class="nav-link">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
					{/if}
				{/if}
				{if $hasChildren}
					<div class="dropdown-menu{if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
									{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
								</a>
							{/if}
						{/foreach}
					</div>
				{/if}
			</li>
		{/foreach}
	</ul>

	{* CSS embutido *}
	<style>
		/* Estilizar o menu */
		.navbar-nav {
			display: flex;
			align-items: center;
			gap: 20px;
			position: absolute;
		}
		.dropdown {
			position: relative;
		}
		.nav-item {
			list-style: none;
			position: relative;
		}
		.nav-link {
			color: #333 !important;
			text-decoration: none !important;
			font-weight: 500;
			padding: 5px 10px;
			cursor: pointer;
		}
		.nav-link:hover {
			color: #324AB2 !important; /* Cor do hover ajustada */
		}
		/* Dropdown */
		.dropdown-menu {
			display: none;
			position: absolute;
			top: 103%;
			left:0;
			min-width: 220px;
			background-color: #fff !important;
			opacity: 1 !important;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border: 1px solid #ddd;
			border-radius: 4px;
			padding: 0;
			z-index: 1050;
		}
		.dropdown-item {
			display: block;
			padding: 8px 15px;
			color: #333 !important;
			text-decoration: none !important;
			white-space: nowrap;
		}
		.dropdown-item:hover {
			background-color: #e6e9ff !important; /* Cor de fundo do hover ajustada pra combinar com #324AB2 */
			color: #324AB2 !important; /* Cor do texto do hover ajustada */
		}
		/* Lupa */
		.search-icon {
			display: inline-flex;
			align-items: center;
			padding: 5px 10px;
		}
		.nav-link:hover .search-icon-svg {
			stroke: #324AB2 !important; /* Aplica a cor do hover no SVG da lupa */
		}
	</style>

	{* JavaScript embutido *}
	<script>document.addEventListener('DOMContentLoaded', function() {
    var dropdowns = document.querySelectorAll('.dropdown');

    dropdowns.forEach(function(dropdown) {
        var dropdownMenu = dropdown.querySelector('.dropdown-menu');
        var toggle = dropdown.querySelector('.dropdown-toggle');

        // Mostrar o menu ao passar o mouse
        dropdown.addEventListener('mouseenter', function() {
            dropdownMenu.style.display = 'block';
        });

        // Esconder o menu quando o mouse sair
        dropdown.addEventListener('mouseleave', function() {
            dropdownMenu.style.display = 'none';
        });

        // Alternar ao clicar (para dispositivos móveis)
        if (toggle) {
            toggle.addEventListener('click', function(e) {
                e.preventDefault();
                if (dropdownMenu.style.display === 'block') {
                    dropdownMenu.style.display = 'none';
                } else {
                    dropdownMenu.style.display = 'block';
                }
            });
        }
    });
});

	</script>
{/if}