<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:47:00
  from 'app:linkActionlinkActionButton.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684996e4bd4302_16463805',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c0fab54edb4f352fd370b8a0421de7d73183acec' => 
    array (
      0 => 'app:linkActionlinkActionButton.tpl',
      1 => 1747835608,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684996e4bd4302_16463805 (Smarty_Internal_Template $_smarty_tpl) {
?><a 
    href="#" 
    id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['buttonId']->value ));?>
"
    <?php if ($_smarty_tpl->tpl_vars['action']->value->getToolTip()) {?> 
        title="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['action']->value->getToolTip() ));?>
"
    <?php }?> 
    class="pkp_controllers_linkAction pkp_linkaction_<?php echo $_smarty_tpl->tpl_vars['action']->value->getId();?>
 pkp_linkaction_icon_<?php echo $_smarty_tpl->tpl_vars['action']->value->getImage();?>
"
>
    <?php if ($_smarty_tpl->tpl_vars['anyhtml']->value) {?>
        <?php $_smarty_tpl->_assignInScope('_labelTitle', $_smarty_tpl->tpl_vars['action']->value->getTitle());?>
    <?php } else { ?>
        <?php $_smarty_tpl->_assignInScope('_labelTitle', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['action']->value->getTitle() )));?>
    <?php }?>

    <?php echo $_smarty_tpl->tpl_vars['_labelTitle']->value;?>

</a>
<?php }
}
