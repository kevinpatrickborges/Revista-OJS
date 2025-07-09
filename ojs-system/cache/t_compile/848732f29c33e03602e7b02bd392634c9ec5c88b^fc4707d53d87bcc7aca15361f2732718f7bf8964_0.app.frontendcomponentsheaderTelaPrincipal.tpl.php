<?php
/* Smarty version 4.3.1, created on 2025-06-13 11:06:06
  from 'app:frontendcomponentsheaderTelaPrincipal.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684c304e92ffb2_85769078',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fc4707d53d87bcc7aca15361f2732718f7bf8964' => 
    array (
      0 => 'app:frontendcomponentsheaderTelaPrincipal.tpl',
      1 => 1749823502,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/headerHead.tpl' => 1,
    'app:frontend/components/languageSwitcher.tpl' => 1,
  ),
),false)) {
function content_684c304e92ffb2_85769078 (Smarty_Internal_Template $_smarty_tpl) {
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

<!-- Adicionar Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<!-- Adicionar CSS Customizado para a Tela Principal -->
<link href="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/plugins/themes/bootstrap3/styles/custom-headerTelaPrincipal.css" rel="stylesheet">

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

        <header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

    <!-- Seção Superior: Banner com imagem de fundo, logo RPCIRN e utilitários -->
    <div class="home-banner-area">
        <div class="container-fluid">
            <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"index",'router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null)),$_smarty_tpl ) );?>
" class="home-banner-logo">
                <img src="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/plugins/themes/bootstrap3/images/RPCIRN.png" alt="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.pageHeaderLogo.altText",'contextName'=>$_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedName()),$_smarty_tpl ) );?>
" />
            </a>
            <div class="home-banner-utilities">
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_menu'][0], array( array('name'=>"user",'id'=>"navigationUserHome",'ulClass'=>"nav nav-pills user-menu-pills white-text-links"),$_smarty_tpl ) );?>
                 <div class="language-switcher-combined-wrapper">
                    <?php $_smarty_tpl->_subTemplateRender("app:frontend/components/languageSwitcher.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
                </div>
            </div>
        </div>
    </div>

    <!-- Seção Inferior: Navegação Principal e Busca -->
    <div class="home-navigation-search-bar">
        <div class="container-fluid">
                        <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNavAndSearchHome" aria-expanded="false" aria-controls="mainNavAndSearchHome">
                    <span class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.bootstrap3.accessible_menu.toggle_navigation"),$_smarty_tpl ) );?>
</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <nav id="mainNavAndSearchHome" class="collapse navbar-collapse">                 <div class="navigation-and-search-inner-wrapper">
                    <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "primaryMenuHome", null);?>
                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_menu'][0], array( array('name'=>"primary",'id'=>"main-navigation-home",'ulClass'=>"nav navbar-nav custom-main-navigation"),$_smarty_tpl ) );?>
                     <?php $_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
                    <?php echo $_smarty_tpl->tpl_vars['primaryMenuHome']->value;?>


                    <?php if ($_smarty_tpl->tpl_vars['currentContext']->value) {?>
                        <div class="custom-search-area">
                            <form class="pkp_search pkp_search_custom_layout" method="get" action="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"search"),$_smarty_tpl ) );?>
" role="search">
                                <div class="search-container">
                                    <input type="text" name="query" value="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['searchQuery']->value )) ?? null)===null||$tmp==='' ? '' ?? null : $tmp);?>
" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.search"),$_smarty_tpl ) );?>
" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.search"),$_smarty_tpl ) );?>
">
                                    <button type="submit">
                                        <i class="fas fa-search" aria-hidden="true"></i>
                                        <span class="sr-only"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.search"),$_smarty_tpl ) );?>
</span>
                                    </button>
                                </div>
                            </form>
                        </div>
                    <?php }?>
                </div>
            </nav>
        </div>
    </div>
</header><!-- .pkp_structure_head -->

                <div class="pkp_structure_content container">
            <main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">



</body>
</html><?php }
}
