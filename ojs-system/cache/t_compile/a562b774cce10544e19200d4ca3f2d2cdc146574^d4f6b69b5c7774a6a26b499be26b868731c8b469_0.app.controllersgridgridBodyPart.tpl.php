<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:46:59
  from 'app:controllersgridgridBodyPart.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684996e3d0e305_83461677',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd4f6b69b5c7774a6a26b499be26b868731c8b469' => 
    array (
      0 => 'app:controllersgridgridBodyPart.tpl',
      1 => 1747835609,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684996e3d0e305_83461677 (Smarty_Internal_Template $_smarty_tpl) {
?><tbody>
	<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['rows']->value, 'row');
$_smarty_tpl->tpl_vars['row']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->do_else = false;
?>
		<?php echo $_smarty_tpl->tpl_vars['row']->value;?>

	<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
	<tr></tr>
</tbody>

<?php }
}
