<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:45:01
  from 'app:commonformErrors.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849966da4e845_53067404',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2fb8d9b12c20c27db91b4799a3cea99714d3093c' => 
    array (
      0 => 'app:commonformErrors.tpl',
      1 => 1747836870,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6849966da4e845_53067404 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['isError']->value) {?>
	<div class="alert alert-danger">
		<h4>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"form.errorsOccurred"),$_smarty_tpl ) );?>

		</h4>
		<ul class="pkp_form_error_list">
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['errors']->value, 'message', false, 'field');
$_smarty_tpl->tpl_vars['message']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['field']->value => $_smarty_tpl->tpl_vars['message']->value) {
$_smarty_tpl->tpl_vars['message']->do_else = false;
?>
				<li>
					<a class="alert-link" href="#<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['field']->value ));?>
"><?php echo $_smarty_tpl->tpl_vars['message']->value;?>
</a>
				</li>
			<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</ul>
	</div>
	<?php echo '<script'; ?>
>
		<!--
		// Jump to form errors.
		window.location.hash="formErrors";
		// -->
	<?php echo '</script'; ?>
>
<?php }
}
}
