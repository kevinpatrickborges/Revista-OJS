<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:51:34
  from 'app:frontendpagesuserRegisterComplete.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684997f6b04677_05554253',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3127183f2c0cb1674f3daa6e4b1a3ea472dd8c13' => 
    array (
      0 => 'app:frontendpagesuserRegisterComplete.tpl',
      1 => 1747835620,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_684997f6b04677_05554253 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="page page_register_complete">
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>$_smarty_tpl->tpl_vars['pageTitle']->value), 0, false);
?>
	<h1>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['pageTitle']->value),$_smarty_tpl ) );?>

	</h1>
	<p>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registrationComplete.instructions"),$_smarty_tpl ) );?>

	</p>
	<ul class="registration_complete_actions">
		<?php if (array_intersect(array(\PKP\security\Role::ROLE_ID_MANAGER,\PKP\security\Role::ROLE_ID_SUB_EDITOR,\PKP\security\Role::ROLE_ID_ASSISTANT,\PKP\security\Role::ROLE_ID_REVIEWER),(array)$_smarty_tpl->tpl_vars['userRoles']->value)) {?>
			<li class="view_submissions">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"submissions"),$_smarty_tpl ) );?>
">
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registrationComplete.manageSubmissions"),$_smarty_tpl ) );?>

				</a>
			</li>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['currentContext']->value) {?>
			<li class="new_submission">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"submission"),$_smarty_tpl ) );?>
">
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registrationComplete.newSubmission"),$_smarty_tpl ) );?>

				</a>
			</li>
		<?php }?>
		<li class="edit_profile">
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"user",'op'=>"profile"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.editMyProfile"),$_smarty_tpl ) );?>

			</a>
		</li>
		<li class="browse">
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"index"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registrationComplete.continueBrowsing"),$_smarty_tpl ) );?>

			</a>
		</li>
	</ul>
</div>

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
