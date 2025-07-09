<div class="page_index_journal">
	{call_hook name="Templates::Index::journal"}

	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<div class="homepage_image">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if}>
		</div>
	{/if}

	<div class="container">
		<div class="row">
			{* Seção Principal (8 colunas) *}
			<div class="col-md-8">
				{* Descrição da Revista *}
				{if $activeTheme->getOption('showDescriptionInJournalIndex')}
					<section class="homepage_about">
						<a id="homepageAbout"></a>
						<h2>{translate key="about.aboutContext"}</h2>
						{$currentContext->getLocalizedData('description')}
					</section>
				{/if}

				{* Edição Atual *}
				{if $issue}
					<section class="current_issue">
						<a id="homepageIssue"></a>
						<h2>{translate key="journal.currentIssue"}</h2>
						<div class="current_issue_title">
							{$issue->getIssueIdentification()|strip_unsafe_html}
						</div>
						{include file="frontend/objects/issue_toc.tpl" heading="h3"}
						<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="read_more">
							{translate key="journal.viewAllIssues"}
						</a>
					</section>
				{/if}

				{* Conteúdo Adicional *}
				{if $additionalHomeContent}
					<div class="additional_content">
						{$additionalHomeContent}
					</div>
				{/if}
			</div>

			{* Barra Lateral (4 colunas) *}
			<div class="col-md-4">
				{* Anúncios *}
				<section class="sidebar_section">
					<h3>{translate key="announcement.announcements"}</h3>
					{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}
				</section>

				{* Links Úteis (Personalizado) *}
				<section class="sidebar_section">
					<h3>Links Úteis</h3>
					<ul>
						<li><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
						<li><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
						<li><a href="{url page="about" op="submissions"}">{translate key="navigation.submissions"}</a></li>
					</ul>
				</section>
			</div>
		</div>
	</div>
</div><!-- .page -->