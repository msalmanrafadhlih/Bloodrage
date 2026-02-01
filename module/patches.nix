{ pkgs, modules, patches, ... } :

{
  home.file.".local/bin/apply-patches.sh" = {
    text = ''
		#!/usr/bin/env bash
		for patch in ./patches/*.diff; do
		    echo "Applying $patch..."
		    patch -p1 < "$patch" || {
		        echo "Failed to apply $patch"
		        exit 1
		    }
		done   
    '';
    executable = true;
  };
}
