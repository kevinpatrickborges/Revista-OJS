<?php
/* Smarty version 4.3.1, created on 2025-06-11 10:23:31
  from 'plugins-1-plugins-blocks-makeSubmission-blocks-makeSubmission:block.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684983536369f5_80415132',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3ee8d5a55384fc9739a556ef233a4dba336bcc76' => 
    array (
      0 => 'plugins-1-plugins-blocks-makeSubmission-blocks-makeSubmission:block.tpl',
      1 => 1747836836,
      2 => 'plugins-1-plugins-blocks-makeSubmission-blocks-makeSubmission',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684983536369f5_80415132 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="pkp_block block_make_submission">
	<h2 class="pkp_screen_reader">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.block.makeSubmission.linkLabel"),$_smarty_tpl ) );?>

	</h2>

	<div class="content">
		<a class="block_make_submission_link" href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.block.makeSubmission.linkLabel"),$_smarty_tpl ) );?>

		</a>
	</div>
</div>
<?php }
}
