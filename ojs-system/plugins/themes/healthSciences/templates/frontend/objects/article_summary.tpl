{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $authorUserGroups Traversible The set of author user groups
 * @uses $hasAccess bool Can this user access galleys for this context? The context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var="articlePath" value=$article->getBestId()}
{assign var="publication" value=$article->getCurrentPublication()}

{if (!$section.hideAuthor && $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_DEFAULT) || $publication->getData('hideAuthor') == \APP\submission\Submission::AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

<div class="article-summary">

	{assign var="submissionPages" value=$publication->getData('pages')}
	{assign var="submissionDatePublished" value=$publication->getData('datePublished')}
	{if $showAuthor && $submissionPages}
		<div class="row">
			<div class="col">
				<div class="article-summary-authors">{$publication->getAuthorString($authorUserGroups)|escape}</div>
			</div>
			<div class="col-3 col-md-2 col-lg-2">
				<div class="article-summary-pages text-right">
					{$submissionPages|escape}
				</div>
			</div>
		</div>
	{elseif $showAuthor}
		<div class="article-summary-authors">{$publication->getAuthorString($authorUserGroups)|escape}</div>
	{elseif $submissionPages}
		<div class="article-summary-pages text-right">
			{$submissionPages|escape}
		</div>
	{/if}

	<div class="article-summary-title">
		<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
			{$publication->getLocalizedFullTitle(null, 'html')|strip_unsafe_html}
		</a>
	</div>

	{* Galleys (PDF, HTML, etc.) *}
	{assign var="galleys" value=$article->getGalleys()}
	{if $galleys}
		<div class="article-summary-galleys" style="margin-top: 10px;">
			{foreach from=$galleys item=galley}
				{if $primaryGenreIds}
					{assign var="file" value=$galley->getFile()}
					{if !$galley->getData('urlRemote') && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
						{continue}
					{/if}
				{/if}
				{assign var="hasArticleAccess" value=$hasAccess}
				{if $currentContext->getSetting('publishingMode') == \APP\journal\Journal::PUBLISHING_MODE_OPEN || $publication->getData('accessStatus') == \APP\submission\Submission::ARTICLE_ACCESS_OPEN}
					{assign var="hasArticleAccess" value=1}
				{/if}
				{include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication hasAccess=$hasArticleAccess labelled=true class="btn btn-sm pdf-button" style="background-color: #d33; color: #fff; margin-right: 5px; text-decoration: none; text-transform: uppercase;"}
			{/foreach}
		</div>
	{/if}

	{if $showDatePublished && $submissionDatePublished}
		<div class="article-summary-date">
			{$submissionDatePublished|date_format:$dateFormatLong}
		</div>
	{/if}

	{* Get DOI from DOIPubIdPlugin object *}
	{if $requestedPage === 'issue'}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{if $pubIdPlugin->getPubIdType() != 'doi'}
				{continue}
			{/if}
			{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="article-summary-doi">
					<a href="{$doiUrl}">{$doiUrl}</a>
				</div>
			{/if}
		{/foreach}
	{* Get DOI from PublishedArticle object ($pubIdPlugin isn't assigned to indexJournal template) *}
	{elseif ($requestedPage === "search" || $requestedPage === "catalog") && $article->getStoredPubId('doi')}
		{assign var="doiUrl" value=$article->getStoredPubId('doi')|substr_replace:'https://doi.org/':0:0|escape}
		{if $doiUrl}
			<div class="article-summary-doi">
				<a href="{$doiUrl}">{$doiUrl}</a>
			</div>
		{/if}
	{/if}

	{call_hook name="Templates::Issue::Issue::Article"}
</div>