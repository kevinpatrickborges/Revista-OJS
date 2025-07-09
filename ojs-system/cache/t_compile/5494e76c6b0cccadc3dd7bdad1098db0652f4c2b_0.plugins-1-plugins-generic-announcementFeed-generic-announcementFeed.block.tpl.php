<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:12:30
  from 'plugins-1-plugins-generic-announcementFeed-generic-announcementFeed:block.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_68498ece8c9a67_58367370',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5494e76c6b0cccadc3dd7bdad1098db0652f4c2b' => 
    array (
      0 => 'plugins-1-plugins-generic-announcementFeed-generic-announcementFeed:block.tpl',
      1 => 1747836795,
      2 => 'plugins-1-plugins-generic-announcementFeed-generic-announcementFeed',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_68498ece8c9a67_58367370 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="pkp_block block_announcement_feed">
	<h2 class="title"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"announcement.announcements"),$_smarty_tpl ) );?>
</h2>
	<div class="content">
		<ul>
			<li>
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"gateway",'op'=>"plugin",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( "AnnouncementFeedGatewayPlugin","atom" ))),$_smarty_tpl ) );?>
">
					<img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/lib/pkp/templates/images/atom.svg" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.announcementfeed.atom.altText"),$_smarty_tpl ) );?>
">
				</a>
			</li>
			<li>
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"gateway",'op'=>"plugin",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( "AnnouncementFeedGatewayPlugin","rss2" ))),$_smarty_tpl ) );?>
">
					<img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/lib/pkp/templates/images/rss20_logo.svg" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.announcementfeed.rss2.altText"),$_smarty_tpl ) );?>
">
				</a>
			</li>
			<li>
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"gateway",'op'=>"plugin",'path'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( "AnnouncementFeedGatewayPlugin","rss" ))),$_smarty_tpl ) );?>
">
					<img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/lib/pkp/templates/images/rss10_logo.svg" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.generic.announcementfeed.rss1.altText"),$_smarty_tpl ) );?>
">
				</a>
			</li>
		</ul>
	</div>
</div>
<?php }
}
