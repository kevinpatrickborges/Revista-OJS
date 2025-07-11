<?php
/* Smarty version 4.3.1, created on 2025-07-08 12:05:08
  from 'plugins-1-plugins-generic-pdfJsViewer-generic-pdfJsViewer:display.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_686d33a4260073_10397215',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '73e5346aaf408dcf1a4b78878ba72a76778861af' => 
    array (
      0 => 'plugins-1-plugins-generic-pdfJsViewer-generic-pdfJsViewer:display.tpl',
      1 => 1747845810,
      2 => 'plugins-1-plugins-generic-pdfJsViewer-generic-pdfJsViewer',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_686d33a4260073_10397215 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
?>
<!DOCTYPE html>
<html lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
" xml:lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['defaultCharset']->value ));?>
" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"article.pageTitle",'title'=>call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['title']->value ))),$_smarty_tpl ) );?>
</title>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_header'][0], array( array('context'=>"frontend",'headers'=>$_smarty_tpl->tpl_vars['headers']->value),$_smarty_tpl ) );?>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_stylesheet'][0], array( array('context'=>"frontend",'stylesheets'=>$_smarty_tpl->tpl_vars['stylesheets']->value),$_smarty_tpl ) );?>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"frontend",'scripts'=>$_smarty_tpl->tpl_vars['scripts']->value),$_smarty_tpl ) );?>

</head>
<body class="pkp_page_<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value ));?>
 pkp_op_<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedOp']->value ));?>
">

		<header class="header_view" style="display: flex; align-items: center; gap: 1em; padding: 0.5em 1em; background: #f8f8f8; border-bottom: 1px solid #ddd;">
        <a href="<?php echo $_smarty_tpl->tpl_vars['parentUrl']->value;?>
" class="return" style="display:inline-flex;align-items:center;text-decoration:none;font-size:1.2em;gap:0.3em;padding:0.3em 0.8em 0.3em 0.3em;border-radius:4px;background:#e0e0e0;color:#222;transition:background 0.2s;">
            <span aria-hidden="true" style="font-size:1.5em;">&#8592;</span>
            <span style="font-size:1em;margin-left:0.4em;">Voltar para o artigo</span>
        </a>
        <a href="<?php echo $_smarty_tpl->tpl_vars['parentUrl']->value;?>
" class="title" style="font-weight:bold;font-size:1.1em;color:#222;text-decoration:none;">
            <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['title']->value ));?>

        </a>
        <a href="<?php echo $_smarty_tpl->tpl_vars['pdfUrl']->value;?>
" class="download" download style="margin-left:auto;display:inline-flex;align-items:center;gap:0.3em;background:#1976d2;color:#fff;padding:0.3em 0.8em;border-radius:4px;text-decoration:none;font-size:1em;">
            <span class="label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.download"),$_smarty_tpl ) );?>
</span>
            <span class="pkp_screen_reader"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.downloadPdf"),$_smarty_tpl ) );?>
</span>
        </a>
    </header>

	<?php echo '<script'; ?>
 type="text/javascript">
		// Creating iframe's src in JS instead of Smarty so that EZProxy-using sites can find our domain in $pdfUrl and do their rewrites on it.
		$(document).ready(function() {
			var urlBase = "<?php echo $_smarty_tpl->tpl_vars['pluginUrl']->value;?>
/pdf.js/web/viewer.html?file=";
			var pdfUrl = <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['pdfUrl']->value,JSON_UNESCAPED_SLASHES ));?>
;
			$("#pdfCanvasContainer > iframe").attr("src", urlBase + encodeURIComponent(pdfUrl));
		});
	<?php echo '</script'; ?>
>

	<div id="pdfCanvasContainer" class="galley_view<?php if (!$_smarty_tpl->tpl_vars['isLatestPublication']->value) {?> galley_view_with_notice<?php }?>">
		<?php if (!$_smarty_tpl->tpl_vars['isLatestPublication']->value) {?>
			<div class="galley_view_notice">
				<div class="galley_view_notice_message" role="alert">
					<?php echo $_smarty_tpl->tpl_vars['datePublished']->value;?>

				</div>
			</div>
		<?php }?>
		<iframe src="" width="100%" height="100%" style="min-height: 500px;" title="<?php echo $_smarty_tpl->tpl_vars['galleyTitle']->value;?>
" allowfullscreen webkitallowfullscreen></iframe>
	</div>
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Footer::PageFooter"),$_smarty_tpl ) );?>

</body>
</html>
<?php }
}
