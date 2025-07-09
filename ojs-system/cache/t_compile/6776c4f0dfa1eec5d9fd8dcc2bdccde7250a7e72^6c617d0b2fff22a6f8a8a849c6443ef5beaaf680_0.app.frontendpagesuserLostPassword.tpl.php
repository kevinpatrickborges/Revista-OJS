<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:54:04
  from 'app:frontendpagesuserLostPassword.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849988c0a7b39_90620925',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6c617d0b2fff22a6f8a8a849c6443ef5beaaf680' => 
    array (
      0 => 'app:frontendpagesuserLostPassword.tpl',
      1 => 1747836869,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:common/frontend/footer.tpl' => 1,
  ),
),false)) {
function content_6849988c0a7b39_90620925 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"user.login.resetPassword"), 0, false);
?>

<div id="main-content" class="page page_lost_password">

	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>"user.login"), 0, false);
?>

	<div class="alert alert-info" role="alert">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.resetPasswordInstructions"),$_smarty_tpl ) );?>

	</div>

	<form class="pkp_form lost_password" id="lostPasswordForm" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"login",'op'=>"requestResetPassword"),$_smarty_tpl ) );?>
" method="post">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>


		<?php if ($_smarty_tpl->tpl_vars['error']->value) {?>
			<div class="alert alert-error" role="alert">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['error']->value),$_smarty_tpl ) );?>

			</div>
		<?php }?>

		<div class="form-group">
			<label for="login-email">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registeredEmail"),$_smarty_tpl ) );?>

			</label>
			<input type="email" name="email" class="form-control" id="login-email" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>'user.login.registeredEmail'),$_smarty_tpl ) );?>
" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['email']->value ));?>
" maxlength="32" required>
		</div>

		<div class="buttons">
			<button type="submit" class="btn btn-primary">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.resetPassword"),$_smarty_tpl ) );?>

			</button>

			<?php if (!$_smarty_tpl->tpl_vars['disableUserReg']->value) {?>
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "registerUrl", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"user",'op'=>"register",'source'=>$_smarty_tpl->tpl_vars['source']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
				<a class="btn btn-default register-button" href="<?php echo $_smarty_tpl->tpl_vars['registerUrl']->value;?>
" role="button">
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registerNewAccount"),$_smarty_tpl ) );?>

				</a>
			<?php }?>
		</div>
	</form>

</div><!-- .page -->

<?php $_smarty_tpl->_subTemplateRender("app:common/frontend/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
