{if $languageToggleLocales && $languageToggleLocales|@count > 1}
    <nav id="{$id|escape}" class="language-switcher" style="display: flex; gap: 10px; align-items: center;" aria-label="Seletor de idioma" role="navigation">
        {foreach from=$languageToggleLocales item="localeName" key="localeKey"}
            <a href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}" 
               title="{$localeName|escape}" 
               aria-label="Selecionar idioma: {$localeName|escape}" 
               style="text-decoration: none;">
                {if $localeKey == 'pt_BR'}
                    <img src="https://flagcdn.com/w24/br.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                {elseif $localeKey == 'en_US'}
                    <img src="https://flagcdn.com/w24/us.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                {elseif $localeKey == 'es_ES'}
                    <img src="https://flagcdn.com/w24/es.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                {/if}
            </a>
        {/foreach}
    </nav>
{/if}