{**
 * templates/frontend/pages/search.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to search and view search results.
 *
 * @uses $query Value of the primary search query
 * @uses $authors Value of the authors search filter
 * @uses $dateFrom Value of the date from search filter (published after).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $dateTo Value of the date to search filter (published before).
 *  Value is a single string: YYYY-MM-DD HH:MM:SS
 * @uses $yearStart Earliest year that can be used in from/to filters
 * @uses $yearEnd Latest year that can be used in from/to filters
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="container page-search" style="max-width: 1200px; margin: 0 auto; padding: 20px;">
	<div class="page-header" style="text-align: center; margin-bottom: 40px;">
		<h1 style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-size: 2.5rem; font-weight: 600;">
			{if $query}
				{translate key="plugins.themes.healthSciences.search.resultsFor" query=$query|escape}
			{elseif $authors}
				{translate key="plugins.themes.healthSciences.search.resultsFor" query=$authors|escape}
			{else}
				{translate key="common.search"}
			{/if}
		</h1>
	</div>
	<div class="row justify-content-lg-center">
		<div class="col-lg-8 search-col-results">
			<div class="search-results">
				{* No results found *}
				{if $results->wasEmpty()}
					{if $error}
						<div class="alert alert-danger" role="alert" style="background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 4px; padding: 15px;">
							{$error|escape}
						</div>
					{else}
						<div class="alert alert-primary" role="alert" style="background-color: #d4e6ff; color: #324AB2; border: 1px solid #b8d4ff; border-radius: 4px; padding: 15px;">
							{translate key="search.noResults"}
						</div>
					{/if}

				{* Results *}
				{else}
					{iterate from=results item=result}
						<div class="search-result-item" style="background-color: #fff; padding: 20px; margin-bottom: 20px; border-radius: 4px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
							{include file="frontend/objects/article_summary.tpl" article=$result.publishedSubmission journal=$result.journal showDatePublished=true hideGalleys=true}
						</div>
					{/iterate}
					<div class="pagination" style="text-align: center; margin-top: 20px;">
						{page_info iterator=$results}
						{page_links anchor="results" iterator=$results name="search" query=$query searchJournal=$searchJournal authors=$authors title=$title abstract=$abstract galleyFullText=$galleyFullText discipline=$discipline subject=$subject type=$type coverage=$coverage indexTerms=$indexTerms dateFromMonth=$dateFromMonth dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateToMonth=$dateToMonth dateToDay=$dateToDay dateToYear=$dateToYear orderBy=$orderBy orderDir=$orderDir}
					</div>
				{/if}
			</div>
		</div>
		<div class="col-lg-4 search-col-filters">
			<div class="search-filters" style="background-color: #f5f5f5; padding: 20px; border-radius: 4px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
				<h2 style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin-bottom: 20px;">{translate key="plugins.themes.healthSciences.search.params"}</h2>

				{capture name="searchFormUrl"}{url escape=false}{/capture}
				{assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
				{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
				<form class="form-search" method="get" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}">
					{foreach from=$formUrlParameters key=paramKey item=paramValue}
						<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
					{/foreach}

					<div class="form-group form-group-query" style="margin-bottom: 20px;">
						<label for="query" style="color: #333; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-weight: 500;">
							{translate key="common.searchQuery"}
						</label>
						<input type="search" class="form-control" id="query" name="query" value="{$query|escape}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
					</div>
					<div class="form-group form-group-authors" style="margin-bottom: 20px;">
						<label for="authors" style="color: #333; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-weight: 500;">
							{translate key="search.author"}
						</label>
						<input type="text" class="form-control" id="authors" name="authors" value="{$authors|escape}" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
					</div>
					<div class="form-group form-group-date-from" style="margin-bottom: 20px;">
						<label for="dateFromYear" style="color: #333; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-weight: 500;">
							{translate key="search.dateFrom"}
						</label>
						<div class="form-control-date" style="display: flex; gap: 10px;">
							{html_select_date class="form-control" prefix="dateFrom" time=$dateFrom start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD" all_extra="style='padding: 5px; border: 1px solid #ddd; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, sans-serif;'"}
						</div>
					</div>
					<div class="form-group form-group-date-to" style="margin-bottom: 20px;">
						<label for="dateToYear" style="color: #333; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-weight: 500;">
							{translate key="search.dateTo"}
						</label>
						<div class="form-control-date" style="display: flex; gap: 10px;">
							{html_select_date class="form-control" prefix="dateTo" time=$dateTo start_year=$yearStart end_year=$yearEnd year_empty="" month_empty="" day_empty="" field_order="YMD" all_extra="style='padding: 5px; border: 1px solid #ddd; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, sans-serif;'"}
						</div>
					</div>
					<div class="form-group form-group-buttons" style="text-align: center;">
						<button class="btn btn-primary" type="submit" style="background-color: #324AB2; color: #fff; padding: 10px 20px; border: none; border-radius: 4px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; font-weight: 500;">{translate key="common.search"}</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

{* CSS adicional pra estilizar os links da paginação e os artigos *}
<style>
	/* Estilizar os links dos artigos */
	.article-summary-title a {
		color: #324AB2 !important;
		text-decoration: none !important;
		font-weight: 500;
	}
	.article-summary-title a:hover {
		text-decoration: underline !important;
	}
	/* Estilizar a paginação */
	.pagination a {
		color: #324AB2 !important;
		text-decoration: none !important;
		padding: 5px 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
		margin: 0 5px;
	}
	.pagination a:hover {
		background-color: #e6e9ff !important;
	}
	.pagination .current {
		color: #fff !important;
		background-color: #324AB2 !important;
		padding: 5px 10px;
		border-radius: 4px;
	}
</style>

{include file="frontend/components/footer.tpl"}