<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:56:13
  from 'app:controllersgridsettingsuserformuserEmailForm.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849990d547747_45825134',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6c3f621ab80d7f9e9c727f04dd026b5366e87c9d' => 
    array (
      0 => 'app:controllersgridsettingsuserformuserEmailForm.tpl',
      1 => 1747835613,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6849990d547747_45825134 (Smarty_Internal_Template $_smarty_tpl) {
echo '<script'; ?>
>
	$(function() {
		// Attach the form handler.
		$('#sendEmailForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	});
<?php echo '</script'; ?>
>
<form class="pkp_form" id="sendEmailForm" method="post" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_COMPONENT,'component'=>"grid.settings.user.UserGridHandler",'op'=>"sendEmail"),$_smarty_tpl ) );?>
" >
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>


	<input type="hidden" name="userId" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['userId']->value ));?>
" />

	<?php $_block_plugin1 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin1, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('title'=>"email.subject",'for'=>"subject",'required'=>"true",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true));
$_block_repeat=true;
echo $_block_plugin1->smartyFBVFormSection(array('title'=>"email.subject",'for'=>"subject",'required'=>"true",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"text",'id'=>"subject",'value'=>$_smarty_tpl->tpl_vars['subject']->value,'required'=>"true"),$_smarty_tpl ) );?>

	<?php $_block_repeat=false;
echo $_block_plugin1->smartyFBVFormSection(array('title'=>"email.subject",'for'=>"subject",'required'=>"true",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

	<?php $_block_plugin2 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin2, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('title'=>"email.to",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true));
$_block_repeat=true;
echo $_block_plugin2->smartyFBVFormSection(array('title'=>"email.to",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"text",'id'=>"user",'value'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'concat' ][ 0 ], array( $_smarty_tpl->tpl_vars['userFullName']->value," <",$_smarty_tpl->tpl_vars['userEmail']->value,">" )),'disabled'=>"true"),$_smarty_tpl ) );?>

	<?php $_block_repeat=false;
echo $_block_plugin2->smartyFBVFormSection(array('title'=>"email.to",'size'=>$_smarty_tpl->tpl_vars['fbvStyles']->value['size']['MEDIUM'],'inline'=>true), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

	<?php $_block_plugin3 = isset($_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0]) ? $_smarty_tpl->smarty->registered_plugins['block']['fbvFormSection'][0][0] : null;
if (!is_callable(array($_block_plugin3, 'smartyFBVFormSection'))) {
throw new SmartyException('block tag \'fbvFormSection\' not callable or registered');
}
$_smarty_tpl->smarty->_cache['_tag_stack'][] = array('fbvFormSection', array('title'=>"email.body",'for'=>"message",'required'=>"true"));
$_block_repeat=true;
echo $_block_plugin3->smartyFBVFormSection(array('title'=>"email.body",'for'=>"message",'required'=>"true"), null, $_smarty_tpl, $_block_repeat);
while ($_block_repeat) {
ob_start();?>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvElement'][0], array( array('type'=>"textarea",'id'=>"message",'value'=>$_smarty_tpl->tpl_vars['message']->value,'rich'=>true,'required'=>"true"),$_smarty_tpl ) );?>

	<?php $_block_repeat=false;
echo $_block_plugin3->smartyFBVFormSection(array('title'=>"email.body",'for'=>"message",'required'=>"true"), ob_get_clean(), $_smarty_tpl, $_block_repeat);
}
array_pop($_smarty_tpl->smarty->_cache['_tag_stack']);?>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['fbvFormButtons'][0], array( array('submitText'=>"common.sendEmail"),$_smarty_tpl ) );?>


	<p><span class="formRequired"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.requiredField"),$_smarty_tpl ) );?>
</span></p>
</form>
<?php }
}
