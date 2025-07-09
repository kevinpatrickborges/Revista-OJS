# Personalização do Tema Bootstrap3 para OJS

Este arquivo documenta as alterações realizadas no tema Bootstrap3 do OJS para publicação e manutenção futura.

## Arquivos Customizados

- **indexJournal.tpl**
  - Ajuste do tamanho da fonte do título "Edição Atual".
  - Alteração do botão "Ver todas edições" para estilo borda azul, fundo branco, texto azul e efeito hover.
  - Inclusão de efeito hover no botão "Ver todas edições".
- **issue_toc.tpl**
  - Título das seções (ex: "Artigos") com cor igual ao título principal.
- **galley_link.tpl**
  - Botões de galley (PDF, HTML, etc) com borda azul, fundo branco, texto azul e efeito hover.
  - Inclusão do arquivo de estilo para hover.
- **galley_link_hover_style.tpl**
  - CSS inline para efeito hover azul nos botões customizados.

## Boas Práticas Aplicadas

- Comentários claros em todas as customizações.
- Estilos visuais centralizados sempre que possível.
- Testes de responsividade e contraste visual.
- Manutenção da identidade visual institucional.

## Sugestão de Checklist para Deploy

- [x] Todos arquivos customizados salvos e testados
- [x] Site responsivo e acessível
- [x] Links e imagens revisados
- [x] Performance revisada
- [x] Documentação pronta
- [x] Backup realizado

## Observações

- Para futuras atualizações do OJS, revise este arquivo antes de sobrescrever arquivos do tema.
- Caso precise reverter alguma alteração, compare os arquivos customizados com o original do tema Bootstrap3.
- Para dúvidas ou manutenção, procure o responsável técnico listado abaixo.

## Responsável Técnico

- Nome: [Kevin Patrick Borges]
- E-mail: [kevin.borges.700@ufrn.edu.br]
- Data da última alteração: 2025-04-15

---

Se houver novas customizações, adicione neste arquivo para manter o histórico organizado.
