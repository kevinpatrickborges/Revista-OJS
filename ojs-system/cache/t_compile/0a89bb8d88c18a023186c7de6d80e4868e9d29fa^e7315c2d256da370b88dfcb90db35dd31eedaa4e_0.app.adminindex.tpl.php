<?php
/* Smarty version 4.3.1, created on 2025-06-11 10:22:29
  from 'app:adminindex.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_68498315c2c512_88494004',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e7315c2d256da370b88dfcb90db35dd31eedaa4e' => 
    array (
      0 => 'app:adminindex.tpl',
      1 => 1747835607,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_68498315c2c512_88494004 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_4010574068498315bca7b4_73707098', "page");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "layouts/backend.tpl");
}
/* {block "page"} */
class Block_4010574068498315bca7b4_73707098 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_4010574068498315bca7b4_73707098',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<h1 class="app__pageHeading">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.admin"),$_smarty_tpl ) );?>

	</h1>

	<?php if ($_smarty_tpl->tpl_vars['newVersionAvailable']->value) {?>
		<notification>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"site.upgradeAvailable.admin",'currentVersion'=>$_smarty_tpl->tpl_vars['currentVersion']->value->getVersionString(false),'latestVersion'=>$_smarty_tpl->tpl_vars['latestVersion']->value),$_smarty_tpl ) );?>

		</notification>
	<?php }?>

	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.siteManagement"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.siteManagement.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<pkp-button
				element="a"
				href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"contexts"),$_smarty_tpl ) );?>
"
			>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.hostedContexts"),$_smarty_tpl ) );?>

			</pkp-button>
			<pkp-button
				element="a"
				href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"settings"),$_smarty_tpl ) );?>
"
			>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.siteSettings"),$_smarty_tpl ) );?>

			</pkp-button>
		</template>
	</action-panel>
	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.systemInformation"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.systemInformation.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<pkp-button
				element="a"
				href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"systemInfo"),$_smarty_tpl ) );?>
"
			>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.systemInformation.view"),$_smarty_tpl ) );?>

			</pkp-button>
		</template>
	</action-panel>
	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.expireSessions"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.expireSessions.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<form type="post" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"expireSessions"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

				<button class="pkpButton pkpButton--isWarnable" onclick="return confirm(<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.confirmExpireSessions"),$_smarty_tpl ) ) )) ));?>
)"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.expireSessions"),$_smarty_tpl ) );?>
</button>
			</form>
		</template>
	</action-panel>
	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.deleteCache"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.deleteCache.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<form type="post" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"clearDataCache"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

				<button class="pkpButton pkpButton--isWarnable"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.clearDataCache"),$_smarty_tpl ) );?>
</button>
			</form>
			<form type="post" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"clearTemplateCache"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

				<button class="pkpButton pkpButton--isWarnable" onclick="return confirm(<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.confirmClearTemplateCache"),$_smarty_tpl ) ) )) ));?>
)"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.clearTemplateCache"),$_smarty_tpl ) );?>
</button>
			</form>
		</template>
	</action-panel>
	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.scheduledTask.clearLogs"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.scheduledTask.clearLogs.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<form type="post" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"clearScheduledTaskLogFiles"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>

				<button class="pkpButton pkpButton--isWarnable" onclick="return confirm(<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.scheduledTask.confirmClearLogs"),$_smarty_tpl ) ) )) ));?>
)"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"admin.scheduledTask.clearLogs.delete"),$_smarty_tpl ) );?>
</button>
			</form>
		</template>
	</action-panel>
	<action-panel>
		<h2><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.tools.jobs"),$_smarty_tpl ) );?>
</h2>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.tools.jobs.description"),$_smarty_tpl ) );?>

		</p>
		<template slot="actions">
			<pkp-button
				element="a"
				href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"jobs"),$_smarty_tpl ) );?>
"
			>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.tools.jobs.view"),$_smarty_tpl ) );?>

			</pkp-button>
			<pkp-button
				element="a"
				href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"failedJobs"),$_smarty_tpl ) );?>
"
			>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.tools.jobs.failed.view"),$_smarty_tpl ) );?>

			</pkp-button>
		</template>
	</action-panel>
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Admin::Index::AdminFunctions"),$_smarty_tpl ) );?>

<?php
}
}
/* {/block "page"} */
}
