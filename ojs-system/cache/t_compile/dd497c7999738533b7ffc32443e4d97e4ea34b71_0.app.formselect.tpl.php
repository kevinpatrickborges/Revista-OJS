<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:46:57
  from 'app:formselect.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684996e1641a65_83371174',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dd497c7999738533b7ffc32443e4d97e4ea34b71' => 
    array (
      0 => 'app:formselect.tpl',
      1 => 1747835622,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684996e1641a65_83371174 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/function.html_options.php','function'=>'smarty_function_html_options',),));
?>

<div<?php if ($_smarty_tpl->tpl_vars['FBV_layoutInfo']->value) {?> class="<?php echo $_smarty_tpl->tpl_vars['FBV_layoutInfo']->value;?>
"<?php }?>>
<select <?php echo $_smarty_tpl->tpl_vars['FBV_selectParams']->value;
if ($_smarty_tpl->tpl_vars['FBV_class']->value) {?> class="<?php echo $_smarty_tpl->tpl_vars['FBV_class']->value;?>
"<?php }
if ($_smarty_tpl->tpl_vars['FBV_disabled']->value) {?> disabled="disabled"<?php }
if ($_smarty_tpl->tpl_vars['FBV_required']->value) {?> required aria-required="true"<?php }?>>
	<?php if ($_smarty_tpl->tpl_vars['FBV_defaultValue']->value !== null) {?>
		<option value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['FBV_defaultValue']->value ));?>
"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['FBV_defaultLabel']->value ));?>
</option>
	<?php }?>
	<?php if ($_smarty_tpl->tpl_vars['FBV_translate']->value) {
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['html_options_translate'][0], array( array('options'=>$_smarty_tpl->tpl_vars['FBV_from']->value,'selected'=>$_smarty_tpl->tpl_vars['FBV_selected']->value),$_smarty_tpl ) );
} else {
echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['FBV_from']->value,'selected'=>$_smarty_tpl->tpl_vars['FBV_selected']->value),$_smarty_tpl);
}?>
</select>

<?php if ($_smarty_tpl->tpl_vars['FBV_label_content']->value) {?>
	<span><?php echo $_smarty_tpl->tpl_vars['FBV_label_content']->value;?>
</span>
<?php }?>
</div>
<?php }
}
