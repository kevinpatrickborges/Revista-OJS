<?php
/* Smarty version 4.3.1, created on 2025-06-11 11:51:35
  from 'app:frontendcomponentsfooter.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_684997f78f9259_90866972',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4dffb64063bb972c37e05619a2ccd9d0ea7473ac' => 
    array (
      0 => 'app:frontendcomponentsfooter.tpl',
      1 => 1749573643,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_684997f78f9259_90866972 (Smarty_Internal_Template $_smarty_tpl) {
?>
    </main>

    <?php if (empty($_smarty_tpl->tpl_vars['isFullWidth']->value)) {?>
        <?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "sidebarCode", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Sidebar"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
        <?php if ($_smarty_tpl->tpl_vars['sidebarCode']->value) {?>
            <aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-8 col-md-4" role="complementary" aria-label="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.sidebar"),$_smarty_tpl ) ) ));?>
">
                <?php echo $_smarty_tpl->tpl_vars['sidebarCode']->value;?>

            </aside>        <?php }?>
    <?php }?>
    </div>
    <footer id="footer" class="footer-wrapper" role="contentinfo">
        <div class="footer-container">
            <div class="footer-content">
                <div class="footer-details">
                    <div class="footer-line-1">
                        <a href="http://www.itep.rn.gov.br/" target="_blank" rel="noopener">www.itep.rn.gov.br</a>
                        <div class="footer-social">
                            <span>ITEP/RN</span>
                            <a href="https://www.facebook.com/governodorn" target="_blank" rel="noopener" aria-label="Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="https://www.instagram.com/iteprn/" target="_blank" rel="noopener" aria-label="Instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                        </div>
                    </div>
                    <p class="footer-line-2">Endereço: Av. Duque de Caxias, 97 - Ribeira, Natal-RN, CEP: 59010-200</p>
                    <p class="footer-line-3">Núcleo de Gestão do Conhecimento e Informação Documentária e Memória.</p>

                                        <p class="footer-line-contact">
                        E-mail: <a href="mailto:revistapericiacientifica@itep.rn.gov.br">revistapericiacientifica@itep.rn.gov.br</a>
                        <span class="footer-contact-separator">|</span>
                        Contato: <a href="tel:+558432326928">+55 84 3232-6928</a>
                    </p>
                </div>
            </div>

                        <div class="footer-copyright">
                Copyright &copy; <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'date_format' ][ 0 ], array( time(),"Y" ));?>
 - INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA - ITEP/RN. Todos os direitos reservados. Designed by NUGECID.
            </div>
        </div>
    </footer>

</div>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
/plugins/themes/bootstrap3/styles/custom-footer.css" rel="stylesheet">

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"frontend",'scripts'=>$_smarty_tpl->tpl_vars['scripts']->value),$_smarty_tpl ) );?>

<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Common::Footer::PageFooter"),$_smarty_tpl ) );?>

</body>
</html><?php }
}
