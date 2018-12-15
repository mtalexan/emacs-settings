These are the specialty files that contain startup configuration settings.  Anything that needs to be
done that's not a module, either a built-in one or a package.el one, ends up in one of these.

The emacs._01custom-set.el cannot be byte compiled.  It will be overwritten and modified if a user makes use of the custom-set-var or custom-set-group to modify the settings.  It will also automatically be modified if new package modules are installed.  This has to be text-modifiable to work properly.