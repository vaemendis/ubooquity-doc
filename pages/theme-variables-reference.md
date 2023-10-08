---
title: Theme templates variable reference
---

**Table of content**

* placeholder for TOC generation
{:toc}

<style>
body{
  font-family: arial;
}
table {
    font-size: 14px;
  border:none;
}
th, td {
  text-align: left;
  padding: 4px;
  border: none !important;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
tr:nth-child(odd) {
  background-color: #fff;
}
.jh-key{
  color: blue;
  text-align: start;
  vertical-align: top
}
.jh-value {
  text-align: start;
  vertical-align: top;
  color: grey;
  font-style: italic;
  padding-right: 10px;
}

.header {
  font-weight: bold;
}

</style>

This page describes the variables available for each template, along with example values.

<div class="infobox">
You can print all these variables and their actual values in your logs by activating the debug mode in the "Advanced" section of Ubooquity settings.
</div>











## Login page

### Templates used

- `login/page-login.html`
- `common/inc-header.html`

### Variables

<table class="jh-type-object jh-root">
  <tbody class="">
    <tr class="header">
      <td>Name</td>
      <td>Example value</td>
      <td>Description</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rootPath</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix</span>
      </td>
      <td>The prefix part of Ubooquity URL if a proxy is defined, an empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">loginScripts</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">&lt;script type="text/javascript" ...&lt;/script&gt;</span>
      </td>
      <td>The JS scripts required by the login page. Always include this.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">hiddenInputs</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">&lt;input type="hidden" id="serversalt"... name="hash"/&gt;</span>
      </td>
      <td>The input fields required by the login page. Always include this.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">formId</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">loginform</span>
      </td>
      <td>The id of the HTML login form. Provided by the server so that it stays consistent with the scripts.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">loginFieldName</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">login</span>
      </td>
      <td>The name of the login field. Provided by the server so that it stays consistent with the scripts.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">passwordFieldId</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">passwordfield</span>
      </td>
      <td>The id of the password field. Provided by the server so that it stays consistent with the scripts.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">onLoginClick</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">submitform();</span>
      </td>
      <td>The JS function to call when the login button is clicked. Provided by the server so that it stays consistent with the scripts.</td>
    </tr>
  </tbody>
</table>















## Home page

### Templates used

- `home/page-home.html`
- `common/inc-header.html`

### Variables

<table class="jh-type-object jh-root">
  <tbody class="">
    <tr class="header">
      <td>Name</td>
      <td>Example value</td>
      <td>Description</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rootPath</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix</span>
      </td>
      <td>The prefix part of Ubooquity URL if a proxy is defined, an empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">userName</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">Tom</span>
      </td>
      <td>The name of the currently logged user. Null if security is disabled.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">displayRawFiles</th>
      <td class="jh-value jh-object-value">
        <div>
          <span class="jh-type-bool-true">true</span>
        </div>
      </td>
      <td>Boolean. True if the "raw files" section is activated in the settings.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rawFilesUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix/files/</span>
      </td>
      <td>URL of the "raw files" section, if activated.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">displayNoFileMessage</th>
      <td class="jh-value jh-object-value">
        <div>
          <span class="jh-type-bool-false">false</span>
        </div>
      </td>
      <td>Boolean. True if no file is accessible to the current user (or if no file is shared at all).</td>
    </tr>
  </tbody>
</table>
<table class="jh-type-object jh-root">
  <tbody class="">
  <tr>
      <th class="jh-key jh-object-key">categories</th>
      <td class="jh-value jh-object-value">
        <table class="jh-type-array">
          <tbody class="">
            <tr>
              <td class="jh-value jh-array-value">
                <table class="jh-type-object">
                  <tbody class="">
                    <tr>
                      <th class="jh-key jh-object-key">categoryUrl</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">/proxy-prefix/comics</span>
                      </td>
      <td>URL of the category section.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">categoryName</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">Comics</span>
                      </td>
      <td>Display name of the category (used in URLs).</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">categoryId</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">comics</span>
                      </td>
      <td>Id of the category.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">categoryItemCount</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-int jh-type-number">1234</span>
                      </td>
      <td>Item count for this category.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">categoryLatestUrl</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">/proxy-prefix/comics?latest=true</span>
                      </td>
      <td>URL of the page for the most recently added items of the category. </td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">categoryLatestId</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">latest-comics</span>
                      </td>
      <td>Id of the link element that contains the "categoryLatestUrl" URL.</td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    </tbody>
</table>















## Library - category root folders page

### Templates used

- `library/page-library-category-root-dirs.html`
- `common/inc-header.html`
- `library/inc-library-topbar.html`
- `library/inc-library-popups.html`

### Variables

<table class="jh-type-object jh-root">
  <tbody class="">
    <tr class="header">
      <td>Name</td>
      <td>Example value</td>
      <td>Description</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rootPath</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix</span>
      </td>
      <td>The prefix part of Ubooquity URL if a proxy is defined, an empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">parentUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix/comics/47</span>
      </td>
      <td>The URL of the parent page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">prev10pageUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">?index=0</span>
      </td>
      <td>URL of the 10th previous page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">prev10pageClass</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">hidden</span>
      </td>
      <td>"hidden" if there are less than 10 pages before this one, an emtpy string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">prevPageUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">?index=1</span>
      </td>
      <td>URL of the previous page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">prevPageClass</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">hidden</span>
      </td>
      <td>"hidden" if there is a previous page, an emtpy string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">nextPageUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">?index=3</span>
      </td>
      <td>URL of the next page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">nextPageClass</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">hidden</span>
      </td>
      <td>"hidden" if there is no next page, an emtpy string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">next10pageUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">?index=13</span>
      </td>
      <td>URL of the 10<sup>th</sup> next page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">next10pageClass</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">hidden</span>
      </td>
      <td>"hidden" if there are less than 10 pages after this one, an emtpy string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">pageNumber</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">2</span>
      </td>
      <td>Number of the current page.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">displayPageSelector</th>
      <td class="jh-value jh-object-value">
        <div>
          <span class="jh-type-bool-false">false</span>
        </div>
      </td>
      <td>Boolean, true if the page selection pop-pup link should be displayed.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortDesc</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting order is DESCENDING. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortByWriters</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting criterion is WRITER. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortByDate</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting criterion is DATE. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortByTitle</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting criterion is TITLE. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortByFileName</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting criterion is FILE NAME. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedNoGrouping</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the grouping criterion is NONE. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedGroupByFolder</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the grouping criterion is FOLDER. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortAsc</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting order is ASCENDING. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">checkedSortByFilePath</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">checked="true"</span>
      </td>
      <td>The string 'checked="true"' if the sorting criterion is FILE PATH. An empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">pageSelectorLinks</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">&lt;a href="?index=0" class="pagenumber"&gt;1&lt;/a&gt;&lt;a href=... &lt;/a&gt;</span>
      </td>
      <td>Links to the different pages of the current folder or category.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">isSearchResult</th>
      <td class="jh-value jh-object-value">
        <div>
          <span class="jh-type-bool-false">false</span>
        </div>
      </td>
      <td>Boolean. True if the displayed items are the result of a search.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">searchString</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">John Brunner</span>
      </td>
      <td>The string entered by the user for a search (empty if no search is undergoing).</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">totalPages</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">12</span>
      </td>
      <td>The total number of pages in the current folder or category (depending on the display settings.)</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">category</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">comics</span>
      </td>
      <td>The currently displayed category of items.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">pageLabel</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string jh-empty">Search results</span>
      </td>
      <td>The label of the page (search results, latests books...), or an empty string if this is a regular page.</td>
    </tr>
  </tbody>
</table>
<table class="jh-type-object jh-root">
  <tbody class="">
  <tr>
      <th class="jh-key jh-object-key">rootFolders</th>
      <td class="jh-value jh-object-value">
        <table class="jh-type-array">
          <tbody class="">
            <tr>
              <td class="jh-value jh-array-value">
                <table class="jh-type-object">
                  <tbody class="">
                    <tr>
                      <th class="jh-key jh-object-key">folderUrl</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">/proxy-prefix/comics/1</span>
                      </td>
      <td>URL of this root folder.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">folderName</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">CBR Regular</span>
                      </td>
      <td>Name of this root folder.</td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    </tbody>
</table>
















## Library - items page

### Templates used

- `library/page-library.html`
- `common/inc-header.html`
- `library/inc-library-topbar.html`
- `library/inc-library-topbar-search.html`
- `library/inc-library-popups.html`

### Variables

Same variables as for the **Library - category root folders** page above, without the `rootFolders` variable, and with a list of `items` (items are books, comics... and the folder containing them).

<table class="jh-type-object jh-root">
  <tbody class="">
  <tr>
      <th class="jh-key jh-object-key">items</th>
      <td class="jh-value jh-object-value">
        <table class="jh-type-array">
          <tbody class="">
            <tr>
              <td class="jh-value jh-array-value">
                <table class="jh-type-object">
                  <tbody class="">
                  <tr>
      <th class="jh-key jh-object-key">downloadUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix/comics/148/Ghost in the shell 01.cbz</span>
      </td>
<td>URL to download this item.</td>
    </tr>    
    <tr>
      <th class="jh-key jh-object-key">readerUrl</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-unk">/proxy-prefix/pagereader/reader.html#!...dex=0&nbPages=89</span>
      </td>
<td>URL to open the online reader on this item.</td>
    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">itemId</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-int jh-type-number">803</span>
                      </td>
<td>Id of the displayed item.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">itemFolderUrl</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">/proxy-prefix/comics/803/</span>
                      </td>
<td>URL of the folder. Useful only if the item is a folder.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">isFolder</th>
                      <td class="jh-value jh-object-value">
                        <div>
                          <span class="jh-type-bool-true">true</span>
                        </div>
                      </td>
<td>Boolean. True if the item is a folder.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">itemCoverUrl</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">/proxy-prefix/cover/803</span>
                      </td>
<td>URL of the cover of this item.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">itemTitle</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">Dark Reign - Wolverine Origins</span>
                      </td>
<td>Title of this item.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">progress</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-int jh-type-number">42</span>
                      </td>
<td>Reading progression of this item (integer between 0 and 100).</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">readingStatusClass</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-string">status_unread</span>
                      </td>
<td>CSS class associated to the reading status. Can be `status_unread`, `status_inprogress` or `status_finished`.</td>
                    </tr>
                    <tr>
                      <th class="jh-key jh-object-key">itemChildrenCount</th>
                      <td class="jh-value jh-object-value">
                        <span class="jh-type-int jh-type-number">21</span>
                      </td>
<td>Number of elements inside this item (when the item is a folder).</td>
                    </tr>
                  </tbody>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    </tbody>
</table>
















## Library - item details

### Templates used

- `library/page-library-details.html`

### Variables

Same variables as for the **items** elements above, with the following additional fields.

<table class="jh-type-object jh-root">
  <tbody class="">
    <tr class="header">
      <td>Name</td>
      <td>Example value</td>
      <td>Description</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rootPath</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">/proxy-prefix</span>
      </td>
<td>The prefix part of Ubooquity URL if a proxy is defined, an empty string otherwise.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">seriesName</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">The Hitchhiker's Guide to the Galaxy</span>
      </td>
<td>Name of the series the item belongs to, or an empty string.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">rating</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">★★★★☆</span>
      </td>
<td>The calibre rating found in the item metadata.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">description</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">In The Restaurant at the End of the Universe (published in 1980), Zaphod is separated from ...</span>
      </td>
<td>Description found in the item matadata.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">language</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">fr-FR</span>
      </td>
<td>Language found in the item matadata.</td>
    </tr>   
    <tr>
      <th class="jh-key jh-object-key">writers</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">Douglas Adams</span>
      </td>
<td>Writers found in the item matadata.</td>
    </tr>      
    <tr>
      <th class="jh-key jh-object-key">seriesIndex</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">2</span>
      </td>
<td>Index of this item in its series (or an empty string).</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">tags</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">Novel Science-fiction Humor</span>
      </td>
<td>Tags found in the item matadata.</td>
    </tr>    
    <tr>
      <th class="jh-key jh-object-key">fileSize</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">4.8 MB</span>
      </td>
<td>Size of the item file.</td>
    </tr>
    <tr>
      <th class="jh-key jh-object-key">fileExtension</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">EPUB</span>
      </td>
<td>Extension of the item file.</td>
    </tr>     
    <tr>
      <th class="jh-key jh-object-key">publicationDate</th>
      <td class="jh-value jh-object-value">
        <span class="jh-type-string">2020-07-14</span>
      </td>
<td>Publication date found in the item matadata.</td>
    </tr>
  </tbody>
</table>
