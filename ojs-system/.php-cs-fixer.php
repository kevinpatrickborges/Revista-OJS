<?php

$finder = PhpCsFixer\Finder::create()
    ->in(__DIR__)
    ->name('*.php')
    
    ->ignoreDotFiles(true)
    ->ignoreVCS(true)
    
    ->notPath($ignoredDirectories = ['cypress/', 'js/', 'locale/', 'node_modules/', 'styles/', 'templates/', 'vendor/'])
    
    ->exclude(array_merge($ignoredDirectories, ['cache', 'dbscripts', 'docs', 'lib', 'public', 'registry', 'schemas']))
    
    ->notPath((function () {
        $recursiveIterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator(__DIR__ . '/plugins', FilesystemIterator::SKIP_DOTS | FilesystemIterator::UNIX_PATHS | FilesystemIterator::CURRENT_AS_FILEINFO),
            RecursiveIteratorIterator::SELF_FIRST
        );
        $recursiveIterator->setMaxDepth(1);
        $gitFolders = new CallbackFilterIterator(
            $recursiveIterator,
            fn (SplFileInfo $file) => $recursiveIterator->getDepth() === $recursiveIterator->getMaxDepth()
                && $file->isDir()
                && file_exists("{$file}/.git")
        );
        $folders = [];
        foreach ($gitFolders as $folder) {
            $folders[] = str_replace(__DIR__ . '/', '', $folder);
        }
        return $folders;
    })());

$rules = include './lib/pkp/.php_cs_rules';
$config = new PhpCsFixer\Config();
return $config->setRules($rules)
    ->setFinder($finder);
