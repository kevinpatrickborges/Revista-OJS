{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *}

    </main>

    {if empty($isFullWidth)}
        {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
        {if $sidebarCode}
            <aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-8 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
                {$sidebarCode}
            </aside>{* pkp_sidebar.left *}
        {/if}
    {/if}
    </div>{* pkp_structure_content *}

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

                    {* LINHA DE CONTATO REINSERIDA ABAIXO *}
                    <p class="footer-line-contact">
                        E-mail: <a href="mailto:revistapericiacientifica@itep.rn.gov.br">revistapericiacientifica@itep.rn.gov.br</a>
                        <span class="footer-contact-separator">|</span>
                        Contato: <a href="tel:+558432326928">+55 84 3232-6928</a>
                    </p>
                </div>
            </div>

            {* SEÇÃO DE COPYRIGHT REINSERIDA ABAIXO *}
            <div class="footer-copyright">
                Copyright &copy; {$smarty.now|date_format:"Y"} - INSTITUTO TÉCNICO-CIENTÍFICO DE PERÍCIA - ITEP/RN. Todos os direitos reservados. Designed by NUGECID.
            </div>
        </div>
    </footer>

</div>{* pkp_structure_page *}

{* Links para CSS e JS *}
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="{$baseUrl}/plugins/themes/bootstrap3/styles/custom-footer.css" rel="stylesheet">

{load_script context="frontend" scripts=$scripts}
{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>