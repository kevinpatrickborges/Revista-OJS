<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:54:04
  from 'app:frontendcomponentsheader.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849988c3ba5e3_88498957',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '10ae5578a0959129b8d4ceeb9f99c1bb2a9cbd65' => 
    array (
      0 => 'app:frontendcomponentsheader.tpl',
      1 => 1749558359,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/headerHead.tpl' => 1,
  ),
),false)) {
function content_6849988c3ba5e3_88498957 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
?>

<?php $_smarty_tpl->_assignInScope('showingLogo', true);
if ($_smarty_tpl->tpl_vars['displayPageHeaderTitle']->value && !$_smarty_tpl->tpl_vars['displayPageHeaderLogo']->value && is_string($_smarty_tpl->tpl_vars['displayPageHeaderTitle']->value)) {?>
    <?php $_smarty_tpl->_assignInScope('showingLogo', false);
}?>

<!DOCTYPE html>
<html lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
" xml:lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
">
<?php if (!$_smarty_tpl->tpl_vars['pageTitleTranslated']->value) {
$_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "pageTitleTranslated", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['pageTitle']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);
}
$_smarty_tpl->_subTemplateRender("app:frontend/components/headerHead.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link href="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/plugins/themes/bootstrap3/styles/custom-header.css" rel="stylesheet">

<body class="pkp_page_<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) ?? null)===null||$tmp==='' ? "index" ?? null : $tmp);?>
 pkp_op_<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedOp']->value )) ?? null)===null||$tmp==='' ? "index" ?? null : $tmp);
if ($_smarty_tpl->tpl_vars['showingLogo']->value) {?> has_site_logo<?php }?>">

    <div class="pkp_structure_page">

                <nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.label"),$_smarty_tpl ) ) ));?>
">
            <ul>
                <li><a href="#main-navigation"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.main_navigation"),$_smarty_tpl ) ) ));?>
</a></li>
                <li><a href="#main-content"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.main_content"),$_smarty_tpl ) ) ));?>
</a></li>
                <li><a href="#sidebar"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.sidebar"),$_smarty_tpl ) ) ));?>
</a></li>
                <li><a href="#footer">Rodapé</a></li>
            </ul>
        </nav>

                <header class="pkp_structure_head" id="headerNavigationContainer" role="banner">

                        <div class="header-top-bar">
                <div class="container">
                
                    <div class="top-bar-right">
                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_menu'][0], array( array('name'=>"user",'id'=>"navigationUser",'ulClass'=>"user-menu-pills"),$_smarty_tpl ) );?>

                    </div>
                </div>
            </div>

                        <div class="header-main">
                <div class="container">
                    <div class="header-main-inner">
                        <div class="site-branding">
                            <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "homeUrl", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"index",'router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null)),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['homeUrl']->value;?>
" class="logo-link">
                                                                <img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/plugins/themes/bootstrap3/images/RPCIRN.png" alt="Logo da Revista Polícia Científica do Rio Grande do Norte">
                            </a>

                        <nav id="main-navigation" class="main-navigation" role="navigation" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.primary"),$_smarty_tpl ) );?>
">
                                                         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#primary-nav-menu" aria-expanded="false">
                                <span class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.toggle_navigation"),$_smarty_tpl ) );?>
</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div id="primary-nav-menu" class="collapse navbar-collapse">
                                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_menu'][0], array( array('name'=>"primary",'ulClass'=>"nav navbar-nav"),$_smarty_tpl ) );?>

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>

                <div class="pkp_structure_content container">
            <main class="pkp_structure_main col-xs-12<?php if ($_smarty_tpl->tpl_vars['isFullWidth']->value) {?> col-md-12<?php } else { ?> col-md-8<?php }?>" role="main"><?php }
}
