---
title: Create a new theme
---

**Table of content**

* placeholder for TOC generation
{:toc}

## Themes compatibility

Ubooquity 3 introduces a new theme system that gives full control over the served CSS, HTML and Javascript content.   
However, this new system makes previous themes (for Ubooquity 2.x) incompatible wih Ubooquity 3.x.

## Generate a new theme template

In Ubooquity administration page, in the `General` section, click the `Create new theme...` button and enter the name of your theme. A folder with that name will be created in Ubooquity's working directory (by default the folder from where you launched it).  
This new folder will contain all the files of the default theme, that you can now edit to your liking.


## Edit the theme files

<div class="infobox">
When creating a theme, you only need to include the files that differ from the default theme. If Ubooquity needs to display a file and doesn't find it in your theme, it will fall back to the default theme version.  
This makes the default theme very easy to tweak (you don't need to all the files of a full theme).
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

The five `page-*.html` files are the pages served by Ubooquity, they are the entry points of the theme.  
`inc-*.html` files are just HTML fragments included in page files by the templating engine, you can keep them, or remove them (or create new ones) depending on the structure of your theme.

### Templating syntax

The template files use the [**Mustache**](https://mustache.github.io/) syntax for variable substitution.  
The complete syntax can be found in [Mustache syntax documentation](https://mustache.github.io/mustache.5.html).  

The main Mustache features used in the default theme are the following. 

#### Variable substitution

Variables enclosed in `{{...}}` are replaced with values provided by Ubooquity.  
See the [**variables reference page**](https://vaemendis.github.io/ubooquity-doc/pages/theme-variables-reference.html) for an exhaustive list of available variables for each page.

#### Sections

Mustache sections can be used to hide or show blocks of text depending on a varaible value.  
They start with `{{#...}}` and end with `{{/...}}`.

```
{{#myVariable}}
    <div>Some text</div>
{{/myVariable}}
```
The `div` block will be displayed only if `myVariable` is **not** `false` nor empty.

Inverted sections, starting with `{{^...}}`, can be used to obtain the opposite behaviour: the block will be displayed if the value is false or empty.

#### List sections

When the variable is a list of objects, the content of the sections is rendered once for each element of the list.  
Fields of the object then become variables that can be accessed using the usual `{{...}}` syntax.

**Example** 
A list of book objects (`items`) with the following values
```
items:
  - itemTitle: "Red Prophet"
    itemCoverUrl: "/proxy-prefix/cover/3646"
  - itemTitle: "Green Mars"
    itemCoverUrl: "/proxy-prefix/cover/3645"
```
using the follwing template
```
{{#items}}
        <div class="book">
                <img src="{{itemCoverUrl}}"/>
                <div class="title">{{itemTitle}}</div>
        </div>        
{{/items}}
```
will be rendered as the following HTML
```
 <div class="book">
        <img src="/proxy-prefix/cover/3646"/>
        <div class="title">Red Prophet</div>
 </div> 
  <div class="book">
        <img src="/proxy-prefix/cover/3645"/>
        <div class="title">Green Mars</div>
 </div> 
```

#### Partials

Mustache templates can import other Mustahce templates ("partials") with the `{{>...}}` syntax.

### Resources path (images, CSS...)
 
Themes contain template files but also resources (usually images and CSS).  
Using such resources in your theme means accessing them through their URL.

#### Using a theme resource in a template file

When using a theme resource link in a template, the URL must start with the current Ubooquity URL, that you get through the `rootUrl` variable, followed by the `theme` path.  
The rest of the path is your theme structure (the name of your theme does **not** appear in the URL though).

**Example:** using a CSS file in a template
```
<link rel="stylesheet" type="text/css" href="{{rootPath}}/theme/library/books.css"/>
```
- `{{rootPath}}/theme/` is the path of Ubooquity's theme provider (whatever the theme) 
- `library` is a folder inside the theme. The theme name (this one is "default") does not appear.


#### Using a theme resource in a CSS file

All CSS files inside a theme are considered Mustache templates, the `{{rootPath}}` is always available.

**Example**: using an icon from the theme

```
#arrowleft {
	background-image:url('{{rootPath}}/theme/library/arrowleft.svg');
	background-repeat:no-repeat;	
}
```


## Advanced features 

For advanced use, additional syntax capabilites are offered by the specific implementation of Mustach used by Ubooquity: [**JMustache**](https://github.com/samskivert/jmustache#special-variables) (see the "Special variables" section). 


## Appendix: template variables

The list of variables available for each template page [is available here](https://vaemendis.github.io/ubooquity-doc/pages/theme-variables-reference.html).



