<?php
/* Smarty version 4.3.1, created on 2025-06-11 10:23:06
  from 'app:dashboardindex.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849833accf128_90018829',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'a9f648fa76ca397b9d4cc4c6c88f9417b91e0ea8' => 
    array (
      0 => 'app:dashboardindex.tpl',
      1 => 1747835616,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6849833accf128_90018829 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_7652967226849833ac5cd77_29610308', "page");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "layouts/backend.tpl");
}
/* {block "page"} */
class Block_7652967226849833ac5cd77_29610308 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_7652967226849833ac5cd77_29610308',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<h1 class="app__pageHeading">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.submissions"),$_smarty_tpl ) );?>

	</h1>

	<tabs :track-history="true">
		<tab id="myQueue" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"dashboard.myQueue"),$_smarty_tpl ) );?>
" :badge="components.<?php echo (defined('SUBMISSIONS_LIST_MY_QUEUE') ? constant('SUBMISSIONS_LIST_MY_QUEUE') : null);?>
.itemsMax">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"submissions",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<submissions-list-panel
				v-bind="components.<?php echo (defined('SUBMISSIONS_LIST_MY_QUEUE') ? constant('SUBMISSIONS_LIST_MY_QUEUE') : null);?>
"
				@set="set"
			/>
		</tab>
		<?php if (array_intersect(array(\PKP\security\Role::ROLE_ID_SITE_ADMIN,\PKP\security\Role::ROLE_ID_MANAGER),(array)$_smarty_tpl->tpl_vars['userRoles']->value)) {?>
			<tab id="unassigned" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.queue.long.submissionsUnassigned"),$_smarty_tpl ) );?>
" :badge="components.<?php echo (defined('SUBMISSIONS_LIST_UNASSIGNED') ? constant('SUBMISSIONS_LIST_UNASSIGNED') : null);?>
.itemsMax">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"submissions",'section'=>"unassigned",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

				<submissions-list-panel
					v-bind="components.<?php echo (defined('SUBMISSIONS_LIST_UNASSIGNED') ? constant('SUBMISSIONS_LIST_UNASSIGNED') : null);?>
"
					@set="set"
				/>
			</tab>
			<tab id="active" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.queue.long.active"),$_smarty_tpl ) );?>
" :badge="components.<?php echo (defined('SUBMISSIONS_LIST_ACTIVE') ? constant('SUBMISSIONS_LIST_ACTIVE') : null);?>
.itemsMax">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"submissions",'section'=>"active",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

				<submissions-list-panel
					v-bind="components.<?php echo (defined('SUBMISSIONS_LIST_ACTIVE') ? constant('SUBMISSIONS_LIST_ACTIVE') : null);?>
"
					@set="set"
				/>
			</tab>
		<?php }?>
		<tab id="archive" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submissions.archived"),$_smarty_tpl ) );?>
" :badge="components.<?php echo (defined('SUBMISSIONS_LIST_ARCHIVE') ? constant('SUBMISSIONS_LIST_ARCHIVE') : null);?>
.itemsMax">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"submissions",'section'=>"archives",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<submissions-list-panel
				v-bind="components.<?php echo (defined('SUBMISSIONS_LIST_ARCHIVE') ? constant('SUBMISSIONS_LIST_ARCHIVE') : null);?>
"
				@set="set"
			/>
		</tab>
	</tabs>
<?php
}
}
/* {/block "page"} */
}
