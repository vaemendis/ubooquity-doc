---
title: Create a new theme
---

**Table of content**

* placeholder for TOC generation
{:toc}

## Themes compatibility

Ubooquity 3 introduced a new theme system that gives full control over the served CSS, HTML and Javascript content.   
However, this new system makes previous themes (for Ubooquity 2.x) incompatible wih Ubooquity 3.x.

## Generate a new theme template

In Ubooquity administration page, in the `General` section, click the `Create new theme...` button and choose the name of your theme. A folder with that name will be created in Ubooquity's working directory (by default the folder from where you launched it).  
This new folder will contain all the files of the default theme, that you can now edit to your liking.


## Edit the theme files

<div class="infobox">
When creating a theme, you only need to include the files that differ from the default theme. If Ubooquity needs to display a file and doesn't find it in your theme, it will fall back to the default theme version.  
This makes the default theme very easy to tweak (you don't need to write a full theme).
</div>

Here are the structure and principal files of a theme:

```
your_theme_name
 │
 ├───common
 │       themeScript.js                         ──> Javascript code included in header  
 │       inc-header.html                        ──> Header included in all pages
 │
 ├───home
 │       page-home.html                         ──> Homepage (categories)
 │
 ├───library
 │       page-library-details.html              ──> Book details window
 │       inc-library-popups.html                ──> Popup windows (search and settings)
 │       inc-library-topbar-search.html         ──> Navigation menu bar (on top of screen) 
 │       inc-library-topbar.html                ──> Navigation menu bar for search results
 │       page-library.html                      ──> Books grid
 │       page-library-category-root-dirs.html   ──> Root directories of a category
 │
 └───login
         page-login.html                        ──> Login page
``` 

The five `page-*.html` files are the pages served by Ubooquity, they must exist in all themes.  
`inc-*.html` files are just HTML fragments included in page files by the templating engine, you can keep them, or remove them (or create new ones) depending on the structure of your theme.

### Templating syntax

The template files use the [**Mustache**](https://mustache.github.io/) syntax for variable substitution.  
The complete syntax can be found in [Mustache syntax documentation](https://mustache.github.io/mustache.5.html).  

> Insert examples

### Resources path (images, CSS...)
 
Themes contain template files but also resources (usually images and CSS).  
Using such resources in your theme means using their URL, which fall into 2 categories depending on their usage location.




... unified path: "/..." -> only

<div class="infobox">
... auto sub in case of reverse proxy (CSS and templates only, not JS)
</div>

.. activate debug to get values of variables


#### Using a theme resource in a template file

When using a theme resource link in a template, the URL must start with the current Ubooquity URL, that you get through the `rootUrl` variable, followed by the `theme` path. The rest of the path is your theme structure (the name of your theme does **not** appear in the URL though).

**Example:** using a css file in a template
```
<link rel="stylesheet" type="text/css" href="{{rootUrl}}/theme/library/books.css"/>
```
- `{{rootUrl}}/theme/` is the path of Ubooquity's theme provider (whatever the theme) 
- `library` is a folder inside the theme. The theme name (this one is "default") does not appear.


#### Using a theme resource in a CSS file



====

For advanced use, additional syntax capabilites are offered by the specific implementation of Mustach used by Ubooquity: [**JMustache**](https://github.com/samskivert/jmustache#special-variables) (see the "Special variables" section). 





- CSS variables (cover W H and rootUrl)
- template files
- mustache, jmustache
- explanation of basic features
- template paths are relative to theme folder
- resource paths (e.g. image paths in your css or template files) must be prefixed with the absolute path "/theme/"
  

## Appendix: template variables




