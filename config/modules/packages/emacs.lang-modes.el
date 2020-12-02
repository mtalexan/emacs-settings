;; Various major modes for different languages


(use-package adoc-mode
  :ensure t
  :commands (
            adoc-mode
    )
  )

(use-package apt-sources-list
  :ensure t
  :commands (
            apt-sources-list-mode
    )
  )

(use-package bats-mode
  :ensure t
  :commands (
            bats-mode
    )
  )

(use-package bison-mode
  :ensure t
  :commands (
            bison-mode
    )
  )

(use-package cargo
  :ensure t
  :commands (
            cargo-mode
    )
  )

(use-package cask-mode
  :ensure t
  :commands (
            cask-mode
    )
  )

(use-package cmake-mode
  :ensure t
  :commands (
            cmake-mode
    )
  )

(use-package crontab-mode
  :ensure t
  :commands (
            crontab-mode
    )
  )

(use-package csharp-mode
  :ensure t
  :commands (
            csharp-mode
    )
  )

(use-package csproj-mode
  :ensure t
  :commands (
            csproj-mode
    )
  )

(use-package csv-mode
  :ensure t
  :commands (
            csv-mode
    )
  )

(use-package cuda-mode
  :ensure t
  :commands (
            cuda-mode
    )
  )

(use-package cython-mode
  :ensure t
  :commands (
            cython-mode
    )
  )

(use-package docker-compose-mode
  :ensure t
  :commands (
            docker-compose-mode
    )
  )

(use-package dockerfile-mode
  :ensure t
  :commands (
            dockerfile-mode
    )
  )

(use-package dotenv-mode
  :ensure t
  :commands (
            dotenv-mode
    )
  )

(use-package dts-mode
  :ensure t
  :commands (
            dts-mode
    )
  )

(use-package elf-mode
  :ensure t
  :commands (
            elf-mode
    )
  )

(use-package elisp-docstring-mode
  :ensure t
  :commands (
            elisp-docstring-mode
    )
  )

(use-package enh-ruby-mode
  :ensure t
  :commands (
            enh-ruby-mode
    )
  )

(use-package fish-mode ;fish shell mode
  :ensure t
  :commands (
            fish-mode
    )
  )

(use-package gitattributes-mode
  :ensure t
  :commands (
            gitattributes-mode
    )
  )

(use-package gitconfig-mode
  :ensure t
  :commands (
            gitconfig-mode
    )
  )

(use-package gitignore-mode
  :ensure t
  :commands (
            gitignore-mode
    )
  )

(use-package gitlab-ci-mode
  :ensure t
  :commands (
            gitlab-ci-mode
    )
  )

(use-package go-mode
  :ensure t
  :commands (
            go-mode
    )
  )

(use-package grip-mode ;GitHub Markdown
  :ensure t
  :commands (
            grip-mode
    )
  )

(use-package groovy-mode
  :ensure t
  :commands (
            groovy-mode
    )
  )

(use-package haskell-mode
  :ensure t
  :commands (
            haskell-mode
    )
  )

(use-package hcl-mode ;Hashicorp
  :ensure t
  :commands (
            hcl-mode
    )
  )

(use-package ini-mode
  :ensure t
  :commands (
            ini-mode
    )
  )

(use-package intel-hex-mode
  :ensure t
  :commands (
            intel-hex-mode
    )
  )

(use-package jq-mode
  :ensure t
  :commands (
            jq-mode
    )
  )

(use-package js3-mode ;javascript
  :ensure t
  :commands (
            js3-mode
    )
  )

(use-package json-mode
  :ensure t
  :commands (
            json-mode
    )
  )

(use-package k8s-mode
  :ensure t
  :commands (
            k8s-mode
    )
  )

(use-package kconfig-mode
  :ensure t
  :commands (
            kconfig-mode
    )
  )

(use-package lua-mode
  :ensure t
  :commands (
             lua-mode
             )
  :config
  ;; default to camelCase word boundaries
  (add-hook 'lua-mode-hook
            (lambda () (subword-mode 1)))
  )

(use-package markdown-mode
  :ensure t
  :commands (
            markdown-mode
    )
  )

(use-package mermaid-mode
  :ensure t
  :commands (
            mermaid-mode
    )
  )

(use-package meson-mode
  :ensure t
  :commands (
            meson-mode
    )
  )

(use-package msvc
  :ensure t
  :commands (
            msvc-mode
    )
  )

(use-package nginx-mode
  :ensure t
  :commands (
            nginx-mode
    )
  )

(use-package ninja-mode
  :ensure t
  :commands (
            ninja-mode
    )
  )

(use-package nix-mode
  :ensure t
  :commands (
            nix-mode
    )
  )

(use-package npm-mode
  :ensure t
  :commands (
            npm-mode
    )
  )

(use-package pcap-mode
  :ensure t
  :commands (
            pcap-mode
    )
  )

(use-package php-mode
  :ensure t
  :commands (
            php-mode
    )
  )

(use-package pip-requirements
  :ensure t
  :commands (
            pip-requirements-mode
    )
  )

(use-package pkgbuild-mode
  :ensure t
  :commands (
            pkgbuild-mode
    )
  )

(use-package powershell
  :ensure t
  :commands (
            powershell-mode
    )
  )

(use-package puppet-mode
  :ensure t
  :commands (
            puppet-mode
    )
  )

(use-package python-mode
  :ensure t
  :commands (
            python-mode
    )
  )

(use-package qml-mode
  :ensure t
  :commands (
            qml-mode
    )
  )

(use-package qt-pro-mode
  :ensure t
  :commands (
            qt-pro-mode
    )
  )

(use-package quilt
  :ensure t
  :commands (
            quilt-mode
    )
  )

(use-package racket-mode
  :ensure t
  :commands (
            racket-mode
    )
  )

(use-package rfc-mode
  :ensure t
  :commands (
            rfc-mode
    )
  )

(use-package ruby-electric
  :ensure t
  :commands (
            ruby-electric
    )
  )

(use-package ruby-tools
  :ensure t
  :commands (
            ruby-tools
    )
  )

(use-package rust-mode
  :ensure t
  :commands (
     rust-mode
   ) ; end :commands
  :config
    ;; auto-format on save
    (setq rust-format-on-save t)
  :bind (
    ) ;end of :bind
  ) ; end of use-package

(use-package scala-mode
  :ensure t
  :commands (
            scala-mode
    )
  )

(use-package sed-mode
  :ensure t
  :commands (
            sed-mode
    )
  )

(use-package ssh-config-mode
  :ensure t
  :commands (
            ssh-config-mode
    )
  )

(use-package strace-mode
  :ensure t
  :commands (
            strace-mode
    )
  )

(use-package systemd
  :ensure t
  :commands (
            systemd-mode
    )
  )

(use-package terraform-mode
  :ensure t
  :commands (
            terraform-mode
    )
  )

(use-package thrift
  :ensure t
  :commands (
            thrift-mode
    )
  )

(use-package typescript-mode
  :ensure t
  :commands (
            typescript-mode
    )
  )

(use-package uml-mode
  :ensure t
  :commands (
            uml-mode
    )
  )

(use-package vala-mode
  :ensure t
  :commands (
            vala-mode
    )
  )

(use-package verilog-mode
  :ensure t
  :commands (
            verilog-mode
    )
  )

(use-package vimrc-mode
  :ensure t
  :commands (
            vimrc-mode
    )
  )

(use-package vmd-mode ;real-time GitHub Markdown
  :ensure t
  :commands (
            vmd-mode
    )
  )

(use-package x509-mode
  :ensure t
  :commands (
            x509-mode
    )
  )


(use-package yaml-mode
  :ensure t
  :commands (
             yaml-mode
             )
  )
