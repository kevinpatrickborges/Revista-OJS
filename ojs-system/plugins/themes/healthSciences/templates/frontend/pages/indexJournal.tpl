{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 * @Kevin Patrick Borges
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the homepage
 * @uses $issue Issue Current issue
 *}


{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="container container-homepage-issue page-content" style="max-width: 1200px; margin: 0 auto; padding: 20px; background-color: transparent;">
    {* Chamar o componente Swiper *}
    {include file="frontend/components/swiper.tpl"}

    {* Edição atual *}
    {if $issue}
        <div class="current-issue" style="margin-bottom: 40px; background-color: #fff; padding: 20px; border-radius: 4px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
            <h2 class="h5 homepage-issue-current" style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">{translate key="journal.currentIssue"}</h2>
            <div class="h1 homepage-issue-identifier" style="font-size: 2rem; font-weight: 600;">{$issue->getIssueSeries()|escape}</div>
            <div class="h6 homepage-issue-published" style="color: #666; margin-bottom: 20px;">
                {translate key="plugins.themes.healthSciences.currentIssuePublished" date=$issue->getDatePublished()|date_format:$dateFormatLong}
            </div>

            <div class="row justify-content-center homepage-issue-header">
                {if $issue->getLocalizedCoverImageUrl()}
                    <div class="col-lg-3">
                        <a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
                            <img class="img-fluid homepage-issue-cover" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if} style="border-radius: 4px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
                        </a>
                    </div>
                {/if}
                {if $issue->hasDescription() || $journalDescription || $issueGalleys}
                    <div class="col-lg-9">
                        <div class="homepage-issue-description-wrapper">
                            {if $issue->hasDescription()}
                                <div class="homepage-issue-description">
                                    <div class="h2" style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
                                        {if $issue->getLocalizedTitle()}
                                            {$issue->getLocalizedTitle()|escape}
                                        {else}
                                            {translate key="plugins.themes.healthSciences.issueDescription"}
                                        {/if}
                                    </div>
                                    {$issue->getLocalizedDescription()|strip_unsafe_html}
                                    <div class="homepage-issue-description-more" style="margin-top: 10px;">
                                        <a href="{url op="view" page="issue" path=$issue->getBestIssueId()}" style="color: #324AB2; text-decoration: none; font-weight: 500;">{translate key="common.more"}</a>
                                    </div>
                                </div>
                            {elseif $journalDescription}
                                <div class="homepage-journal-description long-text" id="homepageDescription">
                                    {$journalDescription|strip_unsafe_html}
                                </div>
                            {/if}
                            {if $issueGalleys}
                                <div class="homepage-issue-galleys" style="margin-top: 20px;">
                                    <div class="h3" style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">{translate key="issue.fullIssue"}</div>
                                    {foreach from=$issueGalleys item=galley}
                                        {include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                    </div>
                {/if}
            </div>

            <div class="row issue-wrapper" style="margin-top: 20px;">
                <div class="col-12 col-lg-9">
                    {include file="frontend/objects/issue_toc.tpl" sectionHeading="h3"}
                </div>
            </div>

            <div class="text-center" style="margin-top: 20px;">
                <a class="btn" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" style="background-color: #324AB2; color: #fff; padding: 10px 20px; border-radius: 4px; text-decoration: none;">{translate key="journal.viewAllIssues"}</a>
            </div>
        </div>
    {/if}

    {* Anúncios *}
    {if $numAnnouncementsHomepage && $announcements|@count}
        <section class="row homepage-announcements" style="margin-bottom: 40px; background-color: #fff; padding: 20px; border-radius: 4px;">
            <h2 style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin-bottom: 20px;">{translate key="announcement.announcementsHome"}</h2>
            {foreach from=$announcements item=announcement}
                <article class="col-md-4 homepage-announcement" style="background-color: #fff; padding: 15px; border-radius: 4px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); margin-bottom: 20px;">
                    <h3 class="homepage-announcement-title" style="color: #324AB2; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">{$announcement->getLocalizedTitle()|escape}</h3>
                    <p style="color: #666;">
                        {$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
                        <br>
                        <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}" style="color: #324AB2; text-decoration: none; font-weight: 500;">
                            {translate key="common.more"}
                        </a>
                    </p>
                    <footer>
                        <small class="homepage-announcement-date" style="color: #999;">{$announcement->getDatePosted()|date_format:$dateFormatLong}</small>
                    </footer>
                </article>
            {/foreach}
        </section>
    {/if}

    {* Conteúdo adicional da página inicial *}
    {if $additionalHomeContent}
        <div class="row justify-content-center homepage-additional-content" style="margin-bottom: 40px; background-color: #fff; padding: 20px; border-radius: 4px;">
            <div class="col-lg-9">{$additionalHomeContent}</div>
        </div>
    {/if}
</div><!-- .container -->

{include file="frontend/components/footer.tpl"}