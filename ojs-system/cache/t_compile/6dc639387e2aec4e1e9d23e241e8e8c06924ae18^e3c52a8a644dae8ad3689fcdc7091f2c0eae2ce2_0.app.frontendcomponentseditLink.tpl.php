<?php
/* Smarty version 4.3.1, created on 2025-06-13 11:25:29
  from 'app:frontendcomponentseditLink.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684c34d9c055e2_01011797',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e3c52a8a644dae8ad3689fcdc7091f2c0eae2ce2' => 
    array (
      0 => 'app:frontendcomponentseditLink.tpl',
      1 => 1747836868,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684c34d9c055e2_01011797 (Smarty_Internal_Template $_smarty_tpl) {
if (in_array(\PKP\security\Role::ROLE_ID_MANAGER,(array) $_smarty_tpl->tpl_vars['userRoles']->value)) {?>

		<?php if ($_smarty_tpl->tpl_vars['sectionTitleKey']->value) {?>
		<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "sectionTitle", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['sectionTitleKey']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
	<?php }?>

	<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>$_smarty_tpl->tpl_vars['page']->value,'op'=>$_smarty_tpl->tpl_vars['op']->value,'path'=>$_smarty_tpl->tpl_vars['path']->value,'anchor'=>$_smarty_tpl->tpl_vars['anchor']->value),$_smarty_tpl ) );?>
" class="btn btn-default btn-xs">
		<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.edit"),$_smarty_tpl ) );?>


				<span class="sr-only">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"help.goToEditPage",'sectionTitle'=>$_smarty_tpl->tpl_vars['sectionTitle']->value),$_smarty_tpl ) );?>

		</span>
	</a>
<?php }
}
}
