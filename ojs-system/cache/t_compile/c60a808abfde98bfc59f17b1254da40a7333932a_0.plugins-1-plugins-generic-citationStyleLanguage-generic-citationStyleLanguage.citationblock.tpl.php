<?php
/* Smarty version 4.3.1, created on 2025-07-08 12:08:10
  from 'plugins-1-plugins-generic-citationStyleLanguage-generic-citationStyleLanguage:citationblock.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_686d345ac749f0_50611654',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'c60a808abfde98bfc59f17b1254da40a7333932a' => 
    array (
      0 => 'plugins-1-plugins-generic-citationStyleLanguage-generic-citationStyleLanguage:citationblock.tpl',
      1 => 1747836870,
      2 => 'plugins-1-plugins-generic-citationStyleLanguage-generic-citationStyleLanguage',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_686d345ac749f0_50611654 (Smarty_Internal_Template $_smarty_tpl) {
if ($_smarty_tpl->tpl_vars['citation']->value) {?>
    <div class="panel panel-default how-to-cite">
        <div class="panel-heading">
            <h2 class="panel-title">
                <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.howToCite"),$_smarty_tpl ) );?>

            </h2>
        </div>
        <div class="panel-body">
            <div id="citationOutput" role="region" aria-live="polite">
                <?php echo $_smarty_tpl->tpl_vars['citation']->value;?>

            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.howToCite.citationFormats"),$_smarty_tpl ) );?>

                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['citationStyles']->value, 'citationStyle');
$_smarty_tpl->tpl_vars['citationStyle']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['citationStyle']->value) {
$_smarty_tpl->tpl_vars['citationStyle']->do_else = false;
?>
                        <li>
                            <a
                                    rel="nofollow"
                                    aria-controls="citationOutput"
                                    href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"citationstylelanguage",'op'=>"get",'path'=>$_smarty_tpl->tpl_vars['citationStyle']->value['id'],'params'=>$_smarty_tpl->tpl_vars['citationArgs']->value),$_smarty_tpl ) );?>
"
                                    data-load-citation
                                    data-json-href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"citationstylelanguage",'op'=>"get",'path'=>$_smarty_tpl->tpl_vars['citationStyle']->value['id'],'params'=>$_smarty_tpl->tpl_vars['citationArgsJson']->value),$_smarty_tpl ) );?>
"
                            >
                                <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['citationStyle']->value['title'] ));?>

                            </a>
                        </li>
                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                </ul>
            </div>
            <?php if (count($_smarty_tpl->tpl_vars['citationDownloads']->value)) {?>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submission.howToCite.downloadCitation"),$_smarty_tpl ) );?>

                        <span class="caret"></span>
                    </button>
                                        <ul class="dropdown-menu" role="menu">
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['citationDownloads']->value, 'citationDownload');
$_smarty_tpl->tpl_vars['citationDownload']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['citationDownload']->value) {
$_smarty_tpl->tpl_vars['citationDownload']->do_else = false;
?>
                        <li>
                            <a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"citationstylelanguage",'op'=>"download",'path'=>$_smarty_tpl->tpl_vars['citationDownload']->value['id'],'params'=>$_smarty_tpl->tpl_vars['citationArgs']->value),$_smarty_tpl ) );?>
">
                                <span class="fa fa-download"></span>
                                <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['citationDownload']->value['title'] ));?>

                            </a>
                        </li>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                    </ul>
                </div>
            <?php }?>
        </div>
    </div>
<?php }
}
}
