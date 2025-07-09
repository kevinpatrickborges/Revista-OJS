{**
 * plugins/generic/pdfJsViewer/templates/display.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Embedded viewing of a PDF galley.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{translate key="article.pageTitle" title=$title|escape}</title>

	{load_header context="frontend" headers=$headers}
	{load_stylesheet context="frontend" stylesheets=$stylesheets}
	{load_script context="frontend" scripts=$scripts}
</head>
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

	{* Header wrapper *}
	<header class="header_view" style="display: flex; align-items: center; gap: 1em; padding: 0.5em 1em; background: #f8f8f8; border-bottom: 1px solid #ddd;">
        <a href="{$parentUrl}" class="return" style="display:inline-flex;align-items:center;text-decoration:none;font-size:1.2em;gap:0.3em;padding:0.3em 0.8em 0.3em 0.3em;border-radius:4px;background:#e0e0e0;color:#222;transition:background 0.2s;">
            <span aria-hidden="true" style="font-size:1.5em;">&#8592;</span>
            <span style="font-size:1em;margin-left:0.4em;">Voltar para o artigo</span>
        </a>
        <a href="{$parentUrl}" class="title" style="font-weight:bold;font-size:1.1em;color:#222;text-decoration:none;">
            {$title|escape}
        </a>
        <a href="{$pdfUrl}" class="download" download style="margin-left:auto;display:inline-flex;align-items:center;gap:0.3em;background:#1976d2;color:#fff;padding:0.3em 0.8em;border-radius:4px;text-decoration:none;font-size:1em;">
            <span class="label">{translate key="common.download"}</span>
            <span class="pkp_screen_reader">{translate key="common.downloadPdf"}</span>
        </a>
    </header>

	<script type="text/javascript">
		// Creating iframe's src in JS instead of Smarty so that EZProxy-using sites can find our domain in $pdfUrl and do their rewrites on it.
		$(document).ready(function() {ldelim}
			var urlBase = "{$pluginUrl}/pdf.js/web/viewer.html?file=";
			var pdfUrl = {$pdfUrl|json_encode:JSON_UNESCAPED_SLASHES};
			$("#pdfCanvasContainer > iframe").attr("src", urlBase + encodeURIComponent(pdfUrl));
		{rdelim});
	</script>

	<div id="pdfCanvasContainer" class="galley_view{if !$isLatestPublication} galley_view_with_notice{/if}">
		{if !$isLatestPublication}
			<div class="galley_view_notice">
				<div class="galley_view_notice_message" role="alert">
					{$datePublished}
				</div>
			</div>
		{/if}
		<iframe src="" width="100%" height="100%" style="min-height: 500px;" title="{$galleyTitle}" allowfullscreen webkitallowfullscreen></iframe>
	</div>
	{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
