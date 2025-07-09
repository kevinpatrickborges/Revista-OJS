<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:44:44
  from 'app:frontendpagesuserLogin.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849965c1e32b8_40311828',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bd04826a47a63ab4c25ca20ffc3b42835fcab481' => 
    array (
      0 => 'app:frontendpagesuserLogin.tpl',
      1 => 1747836870,
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
function content_6849965c1e32b8_40311828 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"user.login"), 0, false);
?>

<div id="main-content" class="page page_login">

	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>"user.login"), 0, false);
?>

		<?php if ($_smarty_tpl->tpl_vars['loginMessage']->value) {?>
		<div class="alert alert-info" role="alert">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['loginMessage']->value),$_smarty_tpl ) );?>

		</div>
	<?php }?>

	<form class="pkp_form login" id="login" method="post" action="<?php echo $_smarty_tpl->tpl_vars['loginUrl']->value;?>
">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

		<input type="hidden" name="source" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['source']->value )) ));?>
" />

		<?php if ($_smarty_tpl->tpl_vars['error']->value) {?>
			<div class="alert alert-danger" role="alert">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['error']->value,'reason'=>$_smarty_tpl->tpl_vars['reason']->value),$_smarty_tpl ) );?>

			</div>
		<?php }?>

		<div class="form-group">
			<label for="login-username">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.username"),$_smarty_tpl ) );?>

			</label>
			<input type="text" name="username" class="form-control" id="login-username" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>'user.username'),$_smarty_tpl ) );?>
" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( (($tmp = $_smarty_tpl->tpl_vars['username']->value ?? null)===null||$tmp==='' ? '' ?? null : $tmp) ));?>
" maxlength="32" required>
		</div>

		<div class="form-group">
			<label for="login-password">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.password"),$_smarty_tpl ) );?>

			</label>
			<input type="password" name="password" class="form-control" id="login-password" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>'user.password'),$_smarty_tpl ) );?>
" password="true" maxlength="32" required="$passwordRequired">
		</div>

		<div class="form-group">
			<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"login",'op'=>"lostPassword"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.forgotPassword"),$_smarty_tpl ) );?>

			</a>
		</div>

		<div class="checkbox">
			<label>
				<input type="checkbox" name="remember" id="remember" value="1" checked="$remember"> <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.rememberUsernameAndPassword"),$_smarty_tpl ) );?>

			</label>
		</div>

				<?php if ($_smarty_tpl->tpl_vars['recaptchaPublicKey']->value) {?>
			<fieldset class="recaptcha_wrapper">
				<div class="fields">
					<div class="recaptcha">
						<div class="g-recaptcha" data-sitekey="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['recaptchaPublicKey']->value ));?>
">
						</div>
					</div>
				</div>
			</fieldset>
		<?php }?>

		<div class="buttons">
			<button type="submit" class="btn btn-primary">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login"),$_smarty_tpl ) );?>

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
