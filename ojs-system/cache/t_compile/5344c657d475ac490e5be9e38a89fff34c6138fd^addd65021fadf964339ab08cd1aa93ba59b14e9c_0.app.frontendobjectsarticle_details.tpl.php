<?php
/* Smarty version 4.3.1, created on 2025-07-08 12:08:09
  from 'app:frontendobjectsarticle_details.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_686d345952bab7_64779521',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'addd65021fadf964339ab08cd1aa93ba59b14e9c' => 
    array (
      0 => 'app:frontendobjectsarticle_details.tpl',
      1 => 1747836869,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/objects/galley_link.tpl' => 2,
  ),
),false)) {
function content_686d345952bab7_64779521 (Smarty_Internal_Template $_smarty_tpl) {
?><article class="article-details">

		<?php if ($_smarty_tpl->tpl_vars['currentPublication']->value->getId() !== $_smarty_tpl->tpl_vars['publication']->value->getId()) {?>
		<div class="alert alert-warning" role="alert">
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "latestVersionUrl", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"article",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['article']->value->getBestId()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.outdatedVersion",'datePublished'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'date_format' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getData('datePublished'),$_smarty_tpl->tpl_vars['dateFormatShort']->value )),'urlRecentVersion'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['latestVersionUrl']->value ))),$_smarty_tpl ) );?>

		</div>
	<?php }?>

	<header>
		<h1 class="page-header">
			<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getLocalizedTitle() ));?>

			<?php if ($_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('subtitle')) {?>
				<small>
					<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('subtitle') ));?>

				</small>
			<?php }?>
		</h1>
	</header>

	<div class="row">

		<section class="article-sidebar col-md-4">

						<h2 class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.article.sidebar"),$_smarty_tpl ) );?>
</h2>

						<?php if ($_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('coverImage') || ($_smarty_tpl->tpl_vars['issue']->value && $_smarty_tpl->tpl_vars['issue']->value->getLocalizedCoverImage())) {?>
				<div class="cover-image">
					<?php if ($_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('coverImage')) {?>
						<?php $_smarty_tpl->_assignInScope('coverImage', $_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('coverImage'));?>
						<img
							class="img-responsive"
							src="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getLocalizedCoverImageUrl($_smarty_tpl->tpl_vars['article']->value->getData('contextId')) ));?>
"
							alt="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['coverImage']->value['altText'] )) ?? null)===null||$tmp==='' ? '' ?? null : $tmp);?>
"
						>
					<?php } else { ?>
						<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"issue",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['issue']->value->getBestIssueId()),$_smarty_tpl ) );?>
">
							<img
								class="img-responsive"
								src="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getLocalizedCoverImageUrl() ));?>
"
								alt="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getLocalizedCoverImageAltText() )) ?? null)===null||$tmp==='' ? '' ?? null : $tmp);?>
"
							>
						</a>
					<?php }?>
				</div>
			<?php }?>

						<?php if ($_smarty_tpl->tpl_vars['primaryGalleys']->value || $_smarty_tpl->tpl_vars['supplementaryGalleys']->value) {?>
				<div class="download">
					<?php if ($_smarty_tpl->tpl_vars['primaryGalleys']->value) {?>
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['primaryGalleys']->value, 'galley');
$_smarty_tpl->tpl_vars['galley']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['galley']->value) {
$_smarty_tpl->tpl_vars['galley']->do_else = false;
?>
							<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/galley_link.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('parent'=>$_smarty_tpl->tpl_vars['article']->value,'purchaseFee'=>$_smarty_tpl->tpl_vars['currentJournal']->value->getSetting('purchaseArticleFee'),'purchaseCurrency'=>$_smarty_tpl->tpl_vars['currentJournal']->value->getSetting('currency')), 0, true);
?>
						<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					<?php }?>
					<?php if ($_smarty_tpl->tpl_vars['supplementaryGalleys']->value) {?>
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['supplementaryGalleys']->value, 'galley');
$_smarty_tpl->tpl_vars['galley']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['galley']->value) {
$_smarty_tpl->tpl_vars['galley']->do_else = false;
?>
							<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/galley_link.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('parent'=>$_smarty_tpl->tpl_vars['article']->value,'isSupplementary'=>"1"), 0, true);
?>
						<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					<?php }?>
				</div>
			<?php }?>

			<div class="list-group">

								<?php if ($_smarty_tpl->tpl_vars['publication']->value->getData('datePublished')) {?>
					<div class="list-group-item date-published">
						<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'translatedDatePublished', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submissions.published"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
						<strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"semicolon",'label'=>$_smarty_tpl->tpl_vars['translatedDatePublished']->value),$_smarty_tpl ) );?>
</strong>
						<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'date_format' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getData('datePublished'),$_smarty_tpl->tpl_vars['dateFormatShort']->value ));?>

					</div>
										<?php if ($_smarty_tpl->tpl_vars['firstPublication']->value->getID() !== $_smarty_tpl->tpl_vars['publication']->value->getId()) {?>
						<div class="list-group-item date-updated">
							<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'translatedUpdated', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.updated"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
							<strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"semicolon",'label'=>$_smarty_tpl->tpl_vars['translatedUpdated']->value),$_smarty_tpl ) );?>
</strong>
							<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'date_format' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getData('datePublished'),$_smarty_tpl->tpl_vars['dateFormatShort']->value ));?>

						</div>
					<?php }?>
										<?php if (count($_smarty_tpl->tpl_vars['article']->value->getPublishedPublications()) > 1) {?>
						<div class="list-group-item versions">
							<strong><?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'translatedVersions', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.versions"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"semicolon",'label'=>$_smarty_tpl->tpl_vars['translatedVersions']->value),$_smarty_tpl ) );?>
</strong>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, array_reverse($_smarty_tpl->tpl_vars['article']->value->getPublishedPublications()), 'iPublication');
$_smarty_tpl->tpl_vars['iPublication']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['iPublication']->value) {
$_smarty_tpl->tpl_vars['iPublication']->do_else = false;
?>
								<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "name", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.versionIdentity",'datePublished'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'date_format' ][ 0 ], array( $_smarty_tpl->tpl_vars['iPublication']->value->getData('datePublished'),$_smarty_tpl->tpl_vars['dateFormatShort']->value )),'version'=>$_smarty_tpl->tpl_vars['iPublication']->value->getData('version')),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
								<div>
									<?php if ($_smarty_tpl->tpl_vars['iPublication']->value->getId() === $_smarty_tpl->tpl_vars['publication']->value->getId()) {?>
										<?php echo $_smarty_tpl->tpl_vars['name']->value;?>

									<?php } elseif ($_smarty_tpl->tpl_vars['iPublication']->value->getId() === $_smarty_tpl->tpl_vars['currentPublication']->value->getId()) {?>
										<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"article",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['article']->value->getBestId()),$_smarty_tpl ) );?>
"><?php echo $_smarty_tpl->tpl_vars['name']->value;?>
</a>
									<?php } else { ?>
										<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"article",'op'=>"view",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['article']->value->getBestId(),"version",$_smarty_tpl->tpl_vars['iPublication']->value->getId() ))),$_smarty_tpl ) );?>
"><?php echo $_smarty_tpl->tpl_vars['name']->value;?>
</a>
									<?php }?>
								</div>
							<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
						</div>
					<?php }?>
				<?php }?>

								<?php $_smarty_tpl->_assignInScope('doiObject', $_smarty_tpl->tpl_vars['article']->value->getCurrentPublication()->getData('doiObject'));?>
				<?php if ($_smarty_tpl->tpl_vars['doiObject']->value) {?>
					<?php $_smarty_tpl->_assignInScope('doiUrl', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['doiObject']->value->getData('resolvingUrl') )));?>
					<div class="list-group-item doi">
						<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'translatedDoi', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"doi.readerDisplayName"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
						<strong><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"semicolon",'label'=>$_smarty_tpl->tpl_vars['translatedDoi']->value),$_smarty_tpl ) );?>
</strong>
						<a href="<?php echo $_smarty_tpl->tpl_vars['doiUrl']->value;?>
">
							<?php echo $_smarty_tpl->tpl_vars['doiUrl']->value;?>

						</a>
					</div>
				<?php }?>

								<?php if (!empty($_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('keywords'))) {?>
					<div class="list-group-item keywords">
						<strong><?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'translatedKeywords', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"article.subject"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"semicolon",'label'=>$_smarty_tpl->tpl_vars['translatedKeywords']->value),$_smarty_tpl ) );?>
</strong>
						<div class="">
							<span class="value">
								<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('keywords'), 'keyword', false, NULL, 'keywords', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
$_smarty_tpl->tpl_vars['keyword']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['keyword']->value) {
$_smarty_tpl->tpl_vars['keyword']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['iteration'] === $_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['total'];
?>
									<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['keyword']->value ));
if (!(isset($_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_keywords']->value['last'] : null)) {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.commaListSeparator"),$_smarty_tpl ) );
}?>
								<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
							</span>
						</div>
					</div>
				<?php }?>
			</div>

		</section><!-- .article-sidebar -->

		<div class="col-md-8">
			<section class="article-main">

								<h2 class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.article.main"),$_smarty_tpl ) );?>
</h2>

				<?php if ($_smarty_tpl->tpl_vars['publication']->value->getData('authors')) {?>
					<div class="authors">
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['publication']->value->getData('authors'), 'author');
$_smarty_tpl->tpl_vars['author']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['author']->value) {
$_smarty_tpl->tpl_vars['author']->do_else = false;
?>
							<div class="author">
								<strong><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getFullName() ));?>
</strong>
								<?php if ($_smarty_tpl->tpl_vars['author']->value->getLocalizedAffiliation()) {?>
									<div class="article-author-affiliation">
										<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getLocalizedAffiliation() ));?>

									</div>
								<?php }?>
								<?php if ($_smarty_tpl->tpl_vars['author']->value->getOrcid()) {?>
									<div class="orcid">
										<?php if ($_smarty_tpl->tpl_vars['author']->value->getData('orcidAccessToken')) {?>
											<?php echo $_smarty_tpl->tpl_vars['orcidIcon']->value;?>

										<?php }?>
										<a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getOrcid() ));?>
" target="_blank">
											<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getOrcid() ));?>

										</a>
									</div>
								<?php }?>
							</div>
						<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					</div>
				<?php }?>

								<?php if ($_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('abstract')) {?>
					<div class="article-summary" id="summary">
						<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"article.abstract"),$_smarty_tpl ) );?>
</h2>
						<div class="article-abstract">
							<?php echo nl2br((string) call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['publication']->value->getLocalizedData('abstract') )), (bool) 1);?>

						</div>
					</div>
				<?php }?>

				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Article::Main"),$_smarty_tpl ) );?>


								<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value->getOption('displayStats') != 'none') {?>
					<?php echo $_smarty_tpl->tpl_vars['activeTheme']->value->displayUsageStatsGraph($_smarty_tpl->tpl_vars['article']->value->getId());?>

					<section class="item downloads_chart">
						<h2 class="label">
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.displayStats.downloads"),$_smarty_tpl ) );?>

						</h2>
						<div class="value">
							<canvas class="usageStatsGraph" data-object-type="Submission" data-object-id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['article']->value->getId() ));?>
"></canvas>
							<div class="usageStatsUnavailable" data-object-type="Submission" data-object-id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['article']->value->getId() ));?>
">
								<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.displayStats.noStats"),$_smarty_tpl ) );?>

							</div>
						</div>
					</section>
				<?php }?>

			</section><!-- .article-main -->

			<section class="article-more-details">

								<h2 class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.article.details"),$_smarty_tpl ) );?>
</h2>

								<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['pubIdPlugins']->value, 'pubIdPlugin');
$_smarty_tpl->tpl_vars['pubIdPlugin']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['pubIdPlugin']->value) {
$_smarty_tpl->tpl_vars['pubIdPlugin']->do_else = false;
?>
					<?php if ($_smarty_tpl->tpl_vars['pubIdPlugin']->value->getPubIdType() == 'doi') {?>
						<?php continue 1;?>
					<?php }?>
					<?php if ($_smarty_tpl->tpl_vars['issue']->value->getPublished()) {?>
						<?php $_smarty_tpl->_assignInScope('pubId', $_smarty_tpl->tpl_vars['article']->value->getStoredPubId($_smarty_tpl->tpl_vars['pubIdPlugin']->value->getPubIdType()));?>
					<?php } else { ?>
						<?php $_smarty_tpl->_assignInScope('pubId', $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getPubId($_smarty_tpl->tpl_vars['article']->value));?>					<?php }?>
					<?php if ($_smarty_tpl->tpl_vars['pubId']->value) {?>
						<div class="panel panel-default pub_ids">
							<div class="panel-heading">
								<h2 class="panel-title">
									<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getPubIdDisplayType() ));?>

								</h2>
							</div>
							<div class="panel-body">
								<?php if (call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getResolvingURL($_smarty_tpl->tpl_vars['currentJournal']->value->getId(),$_smarty_tpl->tpl_vars['pubId']->value) ))) {?>
									<a id="pub-id::<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getPubIdType() ));?>
" href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getResolvingURL($_smarty_tpl->tpl_vars['currentJournal']->value->getId(),$_smarty_tpl->tpl_vars['pubId']->value) ));?>
">
										<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubIdPlugin']->value->getResolvingURL($_smarty_tpl->tpl_vars['currentJournal']->value->getId(),$_smarty_tpl->tpl_vars['pubId']->value) ));?>

									</a>
								<?php } else { ?>
									<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['pubId']->value ));?>

								<?php }?>
							</div>
						</div>
					<?php }?>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

								<?php if ($_smarty_tpl->tpl_vars['issue']->value) {?>
					<div class="panel panel-default issue">
						<div class="panel-heading">
							<h2 class="panel-title">
								<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"issue.issue"),$_smarty_tpl ) );?>

							</h2>
						</div>
						<div class="panel-body">
							<a class="title" href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"issue",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['issue']->value->getBestIssueId($_smarty_tpl->tpl_vars['currentJournal']->value)),$_smarty_tpl ) ) ));?>
">
								<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getIssueIdentification() ));?>

							</a>
						</div>
					</div>
				<?php }?>

				<?php if ($_smarty_tpl->tpl_vars['section']->value) {?>
					<div class="panel panel-default section">
						<div class="panel-heading">
							<h2 class="panel-title">
								<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"section.section"),$_smarty_tpl ) );?>

							</h2>
						</div>
						<div class="panel-body">
							<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['section']->value->getLocalizedTitle() ));?>

						</div>
					</div>
				<?php }?>

								<?php if ($_smarty_tpl->tpl_vars['licenseTerms']->value || $_smarty_tpl->tpl_vars['licenseUrl']->value) {?>
					<div class="panel panel-default copyright">
						<div class="panel-body">
							<?php if ($_smarty_tpl->tpl_vars['licenseUrl']->value) {?>
								<?php if ($_smarty_tpl->tpl_vars['ccLicenseBadge']->value) {?>
									<?php echo $_smarty_tpl->tpl_vars['ccLicenseBadge']->value;?>

								<?php } else { ?>
									<a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['licenseUrl']->value ));?>
" class="copyright">
										<?php if ($_smarty_tpl->tpl_vars['copyrightHolder']->value) {?>
											<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.copyrightStatement",'copyrightHolder'=>$_smarty_tpl->tpl_vars['copyrightHolder']->value,'copyrightYear'=>$_smarty_tpl->tpl_vars['copyrightYear']->value),$_smarty_tpl ) );?>

										<?php } else { ?>
											<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.license"),$_smarty_tpl ) );?>

										<?php }?>
									</a>
								<?php }?>
							<?php }?>
							<?php echo $_smarty_tpl->tpl_vars['licenseTerms']->value;?>

						</div>
					</div>
				<?php }?>

								<?php $_smarty_tpl->_assignInScope('hasBiographies', 0);?>
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['publication']->value->getData('authors'), 'author');
$_smarty_tpl->tpl_vars['author']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['author']->value) {
$_smarty_tpl->tpl_vars['author']->do_else = false;
?>
					<?php if ($_smarty_tpl->tpl_vars['author']->value->getLocalizedBiography()) {?>
						<?php $_smarty_tpl->_assignInScope('hasBiographies', $_smarty_tpl->tpl_vars['hasBiographies']->value+1);?>
					<?php }?>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
				<?php if ($_smarty_tpl->tpl_vars['hasBiographies']->value) {?>
					<div class="panel panel-default author-bios">
						<div class="panel-heading">
							<h2 class="panel-title">
								<?php if ($_smarty_tpl->tpl_vars['hasBiographies']->value > 1) {?>
									<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.authorBiographies"),$_smarty_tpl ) );?>

								<?php } else { ?>
									<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.authorBiography"),$_smarty_tpl ) );?>

								<?php }?>
							</h2>
						</div>
						<div class="panel-body">
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['publication']->value->getData('authors'), 'author');
$_smarty_tpl->tpl_vars['author']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['author']->value) {
$_smarty_tpl->tpl_vars['author']->do_else = false;
?>
								<?php if ($_smarty_tpl->tpl_vars['author']->value->getLocalizedBiography()) {?>
									<div class="media biography">
										<div class="media-body">
											<h3 class="media-heading biography-author">
												<?php if ($_smarty_tpl->tpl_vars['author']->value->getLocalizedAffiliation()) {?>
													<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "authorName", null);
echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getFullName() ));
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
													<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "authorAffiliation", null);?><span class="affiliation"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getLocalizedAffiliation() ));?>
</span><?php $_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
													<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.authorWithAffiliation",'name'=>$_smarty_tpl->tpl_vars['authorName']->value,'affiliation'=>$_smarty_tpl->tpl_vars['authorAffiliation']->value),$_smarty_tpl ) );?>

												<?php } else { ?>
													<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getFullName() ));?>

												<?php }?>
											</h3>
											<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getLocalizedBiography() ));?>

										</div>
									</div>
								<?php }?>
							<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
						</div>
					</div>
				<?php }?>

				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Article::Details"),$_smarty_tpl ) );?>


								<?php if ($_smarty_tpl->tpl_vars['parsedCitations']->value || $_smarty_tpl->tpl_vars['publication']->value->getData('citationsRaw')) {?>
					<div class="article-references">
						<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.citations"),$_smarty_tpl ) );?>
</h2>
						<div class="article-references-content">
							<?php if ($_smarty_tpl->tpl_vars['parsedCitations']->value) {?>
								<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['parsedCitations']->value, 'parsedCitation');
$_smarty_tpl->tpl_vars['parsedCitation']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['parsedCitation']->value) {
$_smarty_tpl->tpl_vars['parsedCitation']->do_else = false;
?>
									<p><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['parsedCitation']->value->getCitationWithLinks() ));?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Article::Details::Reference",'citation'=>$_smarty_tpl->tpl_vars['parsedCitation']->value),$_smarty_tpl ) );?>
</p>
								<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
							<?php } else { ?>
								<?php echo nl2br((string) $_smarty_tpl->tpl_vars['publication']->value->getData('citationsRaw'), (bool) 1);?>

							<?php }?>
						</div>
					</div>
				<?php }?>
		<style>
	.cover-image img.img-responsive {
		width: 200px !important;
		max-width: 50% !important;
		height: auto !important;
		display: block;
		margin: 0 auto;
	}
	h1.page-header {
		font-size: 4rem;
		font-weight: bold;
		line-height: 1.2;
	}
</style>
</article>



<?php }
}
