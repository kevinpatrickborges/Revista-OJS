<?php
/* Smarty version 4.3.1, created on 2025-06-11 10:23:28
  from 'app:frontendcomponentslanguageSwitcher.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_6849835069dc82_59468474',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '49597032b82355ca9af5d112adf30b75b1c6328c' => 
    array (
      0 => 'app:frontendcomponentslanguageSwitcher.tpl',
      1 => 1747836868,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6849835069dc82_59468474 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.count.php','function'=>'smarty_modifier_count',),));
if ($_smarty_tpl->tpl_vars['languageToggleLocales']->value && smarty_modifier_count($_smarty_tpl->tpl_vars['languageToggleLocales']->value) > 1) {?>
    <nav id="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['id']->value ));?>
" class="language-switcher" style="display: flex; gap: 10px; align-items: center;" aria-label="Seletor de idioma" role="navigation">
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['languageToggleLocales']->value, 'localeName', false, 'localeKey');
$_smarty_tpl->tpl_vars['localeName']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['localeKey']->value => $_smarty_tpl->tpl_vars['localeName']->value) {
$_smarty_tpl->tpl_vars['localeName']->do_else = false;
?>
            <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>(defined('ROUTE_PAGE') ? constant('ROUTE_PAGE') : null),'page'=>"user",'op'=>"setLocale",'path'=>$_smarty_tpl->tpl_vars['localeKey']->value,'source'=>$_SERVER['REQUEST_URI']),$_smarty_tpl ) );?>
" 
               title="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['localeName']->value ));?>
" 
               aria-label="Selecionar idioma: <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['localeName']->value ));?>
" 
               style="text-decoration: none;">
                <?php if ($_smarty_tpl->tpl_vars['localeKey']->value == 'pt_BR') {?>
                    <img src="https://flagcdn.com/w24/br.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                <?php } elseif ($_smarty_tpl->tpl_vars['localeKey']->value == 'en_US') {?>
                    <img src="https://flagcdn.com/w24/us.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                <?php } elseif ($_smarty_tpl->tpl_vars['localeKey']->value == 'es_ES') {?>
                    <img src="https://flagcdn.com/w24/es.png" alt="" role="presentation" style="width: 24px; height: 16px;">
                <?php }?>
            </a>
        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
    </nav>
<?php }
}
}
