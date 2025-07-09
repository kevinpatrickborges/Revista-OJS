<?php
/* Smarty version 4.3.1, created on 2025-07-08 12:08:10
  from 'app:frontendobjectsgalley_link.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_686d345a3fc238_52375380',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '9190456890661656c2db668fc3c363ee4354c517' => 
    array (
      0 => 'app:frontendobjectsgalley_link.tpl',
      1 => 1747836869,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/objects/galley_link_hover_style.tpl' => 1,
  ),
),false)) {
function content_686d345a3fc238_52375380 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['journalOverride']->value) {?>
	<?php $_smarty_tpl->_assignInScope('currentJournal', $_smarty_tpl->tpl_vars['journalOverride']->value);
}?>

<?php if ($_smarty_tpl->tpl_vars['galley']->value->isPdfGalley()) {?>
	<?php $_smarty_tpl->_assignInScope('type', "pdf");
} else { ?>
	<?php $_smarty_tpl->_assignInScope('type', "file");
}?>

<?php if ($_smarty_tpl->tpl_vars['parent']->value instanceOf Issue) {?>
	<?php $_smarty_tpl->_assignInScope('page', "issue");?>
	<?php $_smarty_tpl->_assignInScope('parentId', $_smarty_tpl->tpl_vars['parent']->value->getBestIssueId());?>
	<?php $_smarty_tpl->_assignInScope('path', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['parentId']->value,$_smarty_tpl->tpl_vars['galley']->value->getBestGalleyId() )));
} else { ?>
	<?php $_smarty_tpl->_assignInScope('page', "article");?>
	<?php $_smarty_tpl->_assignInScope('parentId', $_smarty_tpl->tpl_vars['parent']->value->getBestId());?>
		<?php if ($_smarty_tpl->tpl_vars['publication']->value && $_smarty_tpl->tpl_vars['publication']->value->getId() !== $_smarty_tpl->tpl_vars['parent']->value->getCurrentPublication()->getId()) {?>
		<?php $_smarty_tpl->_assignInScope('path', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['parentId']->value,"version",$_smarty_tpl->tpl_vars['publication']->value->getId(),$_smarty_tpl->tpl_vars['galley']->value->getBestGalleyId() )));?>
	<?php } else { ?>
		<?php $_smarty_tpl->_assignInScope('path', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'to_array' ][ 0 ], array( $_smarty_tpl->tpl_vars['parentId']->value,$_smarty_tpl->tpl_vars['galley']->value->getBestGalleyId() )));?>
	<?php }
}?>

<?php if (!$_smarty_tpl->tpl_vars['hasAccess']->value) {?>
	<?php if ($_smarty_tpl->tpl_vars['restrictOnlyPdf']->value && $_smarty_tpl->tpl_vars['type']->value == "pdf") {?>
		<?php $_smarty_tpl->_assignInScope('restricted', "1");?>
	<?php } elseif (!$_smarty_tpl->tpl_vars['restrictOnlyPdf']->value) {?>
		<?php $_smarty_tpl->_assignInScope('restricted', "1");?>
	<?php }
}?>

<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/galley_link_hover_style.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
<a class="galley-link btn <?php if ($_smarty_tpl->tpl_vars['isSupplementary']->value) {?>btn-default<?php } else { ?>btn-primary<?php }?> <?php echo $_smarty_tpl->tpl_vars['type']->value;?>
" role="button" href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>$_smarty_tpl->tpl_vars['page']->value,'op'=>"view",'path'=>$_smarty_tpl->tpl_vars['path']->value),$_smarty_tpl ) );?>
" style="background:#fff; color:#337ab7; border:1px solid #337ab7;">

		<?php if ($_smarty_tpl->tpl_vars['restricted']->value) {?>
		<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
		<span class="sr-only">
			<?php if ($_smarty_tpl->tpl_vars['purchaseArticleEnabled']->value) {?>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"reader.subscriptionOrFeeAccess"),$_smarty_tpl ) );?>

			<?php } else { ?>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"reader.subscriptionAccess"),$_smarty_tpl ) );?>

			<?php }?>
		</span>
	<?php }?>

	<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['galley']->value->getGalleyLabel() ));?>


	<?php if ($_smarty_tpl->tpl_vars['restricted']->value && $_smarty_tpl->tpl_vars['purchaseFee']->value && $_smarty_tpl->tpl_vars['purchaseCurrency']->value) {?>
		<span class="purchase-cost">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"reader.purchasePrice",'price'=>$_smarty_tpl->tpl_vars['purchaseFee']->value,'currency'=>$_smarty_tpl->tpl_vars['purchaseCurrency']->value),$_smarty_tpl ) );?>

		</span>
	<?php }?>
</a>
<?php }
}
