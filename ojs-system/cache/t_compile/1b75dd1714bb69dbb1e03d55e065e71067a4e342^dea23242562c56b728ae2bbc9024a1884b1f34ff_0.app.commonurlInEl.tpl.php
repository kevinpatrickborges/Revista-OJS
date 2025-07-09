<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:46:48
  from 'app:commonurlInEl.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684996d8bb4093_15500865',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dea23242562c56b728ae2bbc9024a1884b1f34ff' => 
    array (
      0 => 'app:commonurlInEl.tpl',
      1 => 1747835620,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684996d8bb4093_15500865 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['inVueEl']->value) {?>
<component is="script">
<?php } else {
echo '<script'; ?>
>
<?php }?>
	// Initialize JS handler.
	$(function() {
		$('#<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['inElElId']->value,'javascript' ));?>
').pkpHandler(
			'$.pkp.controllers.UrlInDivHandler',
			{
				sourceUrl: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['inElUrl']->value ));?>
,
				refreshOn: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['refreshOn']->value ));?>

			}
		);
	});
<?php if ($_smarty_tpl->tpl_vars['inVueEl']->value) {?>
</component>
<?php } else {
echo '</script'; ?>
>
<?php }?>

<<?php echo $_smarty_tpl->tpl_vars['inEl']->value;?>
 id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['inElElId']->value ));?>
"<?php if ($_smarty_tpl->tpl_vars['inElClass']->value) {?> class="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['inElClass']->value ));?>
"<?php }?>><?php echo $_smarty_tpl->tpl_vars['inElPlaceholder']->value;?>
</<?php echo $_smarty_tpl->tpl_vars['inEl']->value;?>
>
<?php }
}
