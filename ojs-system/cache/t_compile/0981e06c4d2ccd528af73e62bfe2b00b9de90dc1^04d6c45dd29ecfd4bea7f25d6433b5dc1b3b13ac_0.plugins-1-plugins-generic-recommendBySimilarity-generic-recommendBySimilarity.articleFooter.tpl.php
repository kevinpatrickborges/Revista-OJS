<?php
/* Smarty version 4.3.1, created on 2025-07-08 12:08:11
  from 'plugins-1-plugins-generic-recommendBySimilarity-generic-recommendBySimilarity:articleFooter.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_686d345b8a7b20_80070159',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '04d6c45dd29ecfd4bea7f25d6433b5dc1b3b13ac' => 
    array (
      0 => 'plugins-1-plugins-generic-recommendBySimilarity-generic-recommendBySimilarity:articleFooter.tpl',
      1 => 1747836812,
      2 => 'plugins-1-plugins-generic-recommendBySimilarity-generic-recommendBySimilarity',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/pagination.tpl' => 1,
  ),
),false)) {
function content_686d345b8a7b20_80070159 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="articlesBySimilarityList">
	<?php if (!$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->submissions->isEmpty()) {?>
		<h3>
			<a name="articlesBySimilarity"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.recommendBySimilarity.heading"),$_smarty_tpl ) );?>
</a>
		</h3>
		<ul>
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['articlesBySimilarity']->value->submissions, 'submission');
$_smarty_tpl->tpl_vars['submission']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['submission']->value) {
$_smarty_tpl->tpl_vars['submission']->do_else = false;
?>
				<?php $_smarty_tpl->_assignInScope('publication', $_smarty_tpl->tpl_vars['submission']->value->getCurrentPublication());?>
				<?php $_smarty_tpl->_assignInScope('issue', $_smarty_tpl->tpl_vars['articlesBySimilarity']->value->issues->get($_smarty_tpl->tpl_vars['publication']->value->getData('issueId')));?>

				<li>
					<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['publication']->value->getData('authors'), 'author');
$_smarty_tpl->tpl_vars['author']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['author']->value) {
$_smarty_tpl->tpl_vars['author']->do_else = false;
?>
						<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['author']->value->getFullName() ));?>
,
					<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('journal'=>$_smarty_tpl->tpl_vars['currentContext']->value->getPath(),'page'=>"article",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['submission']->value->getBestId()),$_smarty_tpl ) );?>
">
						<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['submission']->value->getLocalizedTitle() ));?>

					</a>
					<?php if ($_smarty_tpl->tpl_vars['issue']->value) {?>,
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('journal'=>$_smarty_tpl->tpl_vars['currentContext']->value->getPath(),'page'=>"issue",'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['issue']->value->getBestIssueId()),$_smarty_tpl ) );?>
">
						<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedName() ));?>
: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getIssueIdentification() ));?>

					</a>
					<?php }?>
				</li>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</ul>
		<p id="articlesBySimilarityPages">
			<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/pagination.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('prevUrl'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->previousUrl,'nextUrl'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->nextUrl,'showingStart'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->start,'showingEnd'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->end,'total'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->total), 0, false);
?>
		</p>
		<p id="articlesBySimilaritySearch">
			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "articlesBySimilaritySearchLink", null);?><a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"search",'op'=>"search",'query'=>$_smarty_tpl->tpl_vars['articlesBySimilarity']->value->query),$_smarty_tpl ) );?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.recommendBySimilarity.advancedSearch"),$_smarty_tpl ) );?>
</a><?php $_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.recommendBySimilarity.advancedSearchIntro",'advancedSearchLink'=>$_smarty_tpl->tpl_vars['articlesBySimilaritySearchLink']->value),$_smarty_tpl ) );?>

		</p>
	<?php }?>
</div>
<?php }
}
