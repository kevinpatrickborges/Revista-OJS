<?php
// Ativar exibição de todos os erros
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

echo "Script de depuração de email iniciado...\n";

try {
    echo "Tentando carregar arquivo de configuração...\n";
    // Verificar se o arquivo existe
    if (!file_exists('/var/www/html/config.inc.php')) {
        echo "ERRO: Arquivo config.inc.php não encontrado!\n";
        exit(1);
    }
    
    echo "Arquivo de configuração encontrado. Tentando carregá-lo...\n";
    include_once('/var/www/html/config.inc.php');
    echo "Arquivo de configuração carregado com sucesso.\n";
    
    // Carregar manualmente as configurações do arquivo
    echo "\nExtraindo configurações diretamente do arquivo...\n";
    $configFile = file_get_contents('/var/www/html/config.inc.php');
    preg_match('/smtp_server\s*=\s*"([^"]+)"/', $configFile, $serverMatches);
    preg_match('/smtp_port\s*=\s*(\d+)/', $configFile, $portMatches);
    preg_match('/smtp_auth\s*=\s*(\w+)/', $configFile, $authMatches);
    preg_match('/smtp_username\s*=\s*"([^"]+)"/', $configFile, $usernameMatches);
    preg_match('/default_envelope_sender\s*=\s*"([^"]+)"/', $configFile, $senderMatches);
    
    echo "SMTP Server: " . ($serverMatches[1] ?? "Não encontrado") . "\n";
    echo "SMTP Port: " . ($portMatches[1] ?? "Não encontrado") . "\n";
    echo "SMTP Auth: " . ($authMatches[1] ?? "Não encontrado") . "\n";
    echo "SMTP Username: " . ($usernameMatches[1] ?? "Não encontrado") . "\n";
    echo "Default Envelope Sender: " . ($senderMatches[1] ?? "Não encontrado") . "\n";
    
    // Teste de envio de email básico usando mail()
    echo "\n=== Teste de envio de email básico ===\n";
    $to = 'revistapericiacientifica@itep.rn.gov.br';
    $subject = 'Teste de Email OJS - ' . date('Y-m-d H:i:s');
    $message = "Este é um email de teste enviado em: " . date('Y-m-d H:i:s');
    $from = $senderMatches[1] ?? 'ojs@localhost';
    
    $headers = "From: $from\r\n";
    $headers .= "Reply-To: $from\r\n";
    $headers .= "X-Mailer: PHP/" . phpversion();
    
    echo "Enviando email para: $to\n";
    echo "De: $from\n";
    echo "Assunto: $subject\n";
    
    $result = mail($to, $subject, $message, $headers);
    
    if ($result) {
        echo "Email enviado com sucesso!\n";
    } else {
        echo "FALHA ao enviar email.\n";
        echo "Verificando logs do sistema...\n";
        
        // Tentar verificar logs de email
        if (file_exists('/var/log/mail.log')) {
            echo "Últimas 5 linhas do log de email:\n";
            system('tail -5 /var/log/mail.log');
        } else {
            echo "Arquivo de log de email não encontrado.\n";
        }
    }
    
    echo "\n=== Verificando ferramentas de email ===\n";
    echo "Sendmail está instalado? ";
    system('which sendmail');
    echo "Postfix está instalado? ";
    system('which postfix');
    
} catch (Exception $e) {
    echo "ERRO: " . $e->getMessage() . "\n";
    echo "Linha: " . $e->getLine() . "\n";
    echo "Arquivo: " . $e->getFile() . "\n";
    echo "Trace:\n" . $e->getTraceAsString() . "\n";
}

echo "\nScript concluído. Verifique sua caixa de entrada e pasta de spam para confirmar recebimento.\n";
?>
