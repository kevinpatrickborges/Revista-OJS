$BACKUP_DIR = "C:\Users\kevin\Desktop\Revista\backups"
$TIMESTAMP = Get-Date -Format "yyyy-MM-dd_HH-mm"
$BACKUP_FILENAME = "ojs_backup_$TIMESTAMP"
$PROJECT_DIR = "C:\Users\kevin\Desktop\Revista"

$TEMP_BACKUP_DIR = "$BACKUP_DIR\temp_$TIMESTAMP"
New-Item -Path $TEMP_BACKUP_DIR -ItemType Directory -Force | Out-Null
Write-Host "Criando diretório temporário para backup: $TEMP_BACKUP_DIR"

Write-Host "Realizando backup do banco de dados..."
docker exec ojs_db sh -c 'exec mysqldump -u ojs_user -p"ojs_pass" --databases ojss' > "$TEMP_BACKUP_DIR\ojs_database_backup.sql"
if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup do banco de dados concluído com sucesso." -ForegroundColor Green
} else {
    Write-Host "Erro ao fazer backup do banco de dados!" -ForegroundColor Red
    exit 1
}

Write-Host "Copiando arquivos de upload..."
Copy-Item -Path "$PROJECT_DIR\files" -Destination "$TEMP_BACKUP_DIR\files" -Recurse -Force
Write-Host "Cópia dos arquivos de upload concluída." -ForegroundColor Green

Write-Host "Copiando arquivos de configuração..."
Copy-Item -Path "$PROJECT_DIR\ojs-system\config.inc.php" -Destination "$TEMP_BACKUP_DIR\" -Force
Copy-Item -Path "$PROJECT_DIR\docker-compose.yml" -Destination "$TEMP_BACKUP_DIR\" -Force
Copy-Item -Path "$PROJECT_DIR\Dockerfile" -Destination "$TEMP_BACKUP_DIR\" -Force
Write-Host "Cópia dos arquivos de configuração concluída." -ForegroundColor Green

Write-Host "Compactando arquivos de backup..."
Compress-Archive -Path "$TEMP_BACKUP_DIR\*" -DestinationPath "$BACKUP_DIR\$BACKUP_FILENAME.zip" -Force
if ($LASTEXITCODE -eq 0) {
    Write-Host "Arquivos compactados com sucesso." -ForegroundColor Green
} else {
    Write-Host "Erro ao compactar arquivos!" -ForegroundColor Red
    exit 1
}

Write-Host "Removendo diretório temporário..."
Remove-Item -Path $TEMP_BACKUP_DIR -Recurse -Force
Write-Host "Diretório temporário removido." -ForegroundColor Green

Write-Host "Backup concluído com sucesso: $BACKUP_DIR\$BACKUP_FILENAME.zip" -ForegroundColor Green
Write-Host "Tamanho do arquivo de backup: $((Get-Item "$BACKUP_DIR\$BACKUP_FILENAME.zip").Length / 1MB) MB" -ForegroundColor Green

