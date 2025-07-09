<?php
/* Smarty version 4.3.1, created on 2025-06-11 12:00:52
  from 'app:managementworkflow.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_68499a2421f502_75269665',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4673846e66bcdae63c2168b2d58f5c6e48515e92' => 
    array (
      0 => 'app:managementworkflow.tpl',
      1 => 1747835615,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_68499a2421f502_75269665 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_31907007168499a241a3077_85931744', "page");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, "layouts/backend.tpl");
}
/* {block "page"} */
class Block_31907007168499a241a3077_85931744 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_31907007168499a241a3077_85931744',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

	<h1 class="app__pageHeading">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.workflow.title"),$_smarty_tpl ) );?>

	</h1>

	<?php if ($_smarty_tpl->tpl_vars['currentContext']->value->getData('disableSubmissions')) {?>
		<notification>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.setup.disableSubmissions.notAccepting"),$_smarty_tpl ) );?>

		</notification>
	<?php }?>

	<tabs :track-history="true">
		<tab id="submission" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.publication.submissionStage"),$_smarty_tpl ) );?>
">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"settings/workflow-settings",'section'=>"submission",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<tabs :is-side-tabs="true" :track-history="true">
				<tab id="disableSubmissions" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.setup.disableSubmissions"),$_smarty_tpl ) );?>
">
					<pkp-form
						v-bind="components.<?php echo (defined('FORM_DISABLE_SUBMISSIONS') ? constant('FORM_DISABLE_SUBMISSIONS') : null);?>
"
						@set="set"
					/>
				</tab>
				<tab id="instructions" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.setup.workflow.guidance"),$_smarty_tpl ) );?>
">
					<pkp-form
						v-bind="components.submissionGuidanceSettings"
						@set="set"
					/>
				</tab>
				<tab id="metadata" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.informationCenter.metadata"),$_smarty_tpl ) );?>
">
					<pkp-form
						v-bind="components.<?php echo (defined('FORM_METADATA_SETTINGS') ? constant('FORM_METADATA_SETTINGS') : null);?>
"
						@set="set"
					/>
				</tab>
				<tab id="components" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"grid.genres.title.short"),$_smarty_tpl ) );?>
">
					<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'genresUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_COMPONENT,'component'=>"grid.settings.genre.GenreGridHandler",'op'=>"fetchGrid",'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_url_in_div'][0], array( array('id'=>"genresGridContainer",'url'=>$_smarty_tpl->tpl_vars['genresUrl']->value),$_smarty_tpl ) );?>

				</tab>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Template::Settings::workflow::submission"),$_smarty_tpl ) );?>

			</tabs>
		</tab>
		<?php if ($_smarty_tpl->tpl_vars['hasReviewStage']->value) {?>
			<tab id="review" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.publication.reviewStage"),$_smarty_tpl ) );?>
">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"settings/workflow-settings",'section'=>"review",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

				<tabs :is-side-tabs="true" :track-history="true">
					<tab id="reviewSetup" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.setup"),$_smarty_tpl ) );?>
">
						<pkp-form
							v-bind="components.<?php echo (defined('FORM_REVIEW_SETUP') ? constant('FORM_REVIEW_SETUP') : null);?>
"
							@set="set"
						/>
					</tab>
					<tab id="reviewerGuidance" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.publication.reviewerGuidance"),$_smarty_tpl ) );?>
">
						<pkp-form
							v-bind="components.<?php echo (defined('FORM_REVIEW_GUIDANCE') ? constant('FORM_REVIEW_GUIDANCE') : null);?>
"
							@set="set"
						/>
					</tab>
					<tab id="reviewForms" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.reviewForms"),$_smarty_tpl ) );?>
">
						<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'reviewFormsUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_COMPONENT,'component'=>"grid.settings.reviewForms.ReviewFormGridHandler",'op'=>"fetchGrid",'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_url_in_div'][0], array( array('id'=>"reviewFormGridContainer",'url'=>$_smarty_tpl->tpl_vars['reviewFormsUrl']->value),$_smarty_tpl ) );?>

					</tab>
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Template::Settings::workflow::review"),$_smarty_tpl ) );?>

				</tabs>
			</tab>
		<?php }?>
		<tab id="library" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.publication.library"),$_smarty_tpl ) );?>
">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"settings/workflow-settings",'section'=>"publisher",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'libraryGridUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_COMPONENT,'component'=>"grid.settings.library.LibraryFileAdminGridHandler",'op'=>"fetchGrid",'canEdit'=>true,'escape'=>false),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_url_in_div'][0], array( array('id'=>"libraryGridDiv",'url'=>$_smarty_tpl->tpl_vars['libraryGridUrl']->value),$_smarty_tpl ) );?>

		</tab>
		<tab id="emails" label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"manager.publication.emails"),$_smarty_tpl ) );?>
">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['help'][0], array( array('file'=>"settings/workflow-settings",'section'=>"emails",'class'=>"pkp_help_tab"),$_smarty_tpl ) );?>

			<pkp-form
				v-bind="components.emailSetup"
				@set="set"
			/>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Template::Settings::workflow::emails"),$_smarty_tpl ) );?>

		</tab>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Template::Settings::workflow"),$_smarty_tpl ) );?>

	</tabs>
<?php
}
}
/* {/block "page"} */
}
