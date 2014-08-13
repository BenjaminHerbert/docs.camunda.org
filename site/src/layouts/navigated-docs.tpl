---

layout: 'default'

---

<% part = @getPages(@document) %>

<%- ''/*  @partial('breadcrumb.html.eco', @, {})  */ %>

<div class="col-md-3">
  <div class="docs-sidebar affix" data-spy="affix">

    <% if @document.searchable: %>
    <div class="search docs-sidenav">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Docs" />
        <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
      </div>
    </div>
    <% end %>

    <ul class="nav docs-sidenav">
      <% if part.categories.length != 1: %>
        <% for category, i in part.categories: %>
          <li class="<%= ''/*  'active' unless i  */ %>">
            <a href="#<%= ''/*  @linkify(category.name)  */ %>"><%= ''/*  category.name  */ %></a>
            <ul class="nav">
              <% for page in category.pages: %>
                <li data-nav-id="<%= ''/*  @linkify(category.name, page.title)  */ %>">
                  <a href="#<%= ''/*  @linkify(category.name, page.title)  */ %>"><%= ''/*  page.shortTitle  */ %></a>
                </li>
              <% end %>
            </ul>
          </li>
        <% end %>
      <% else: %>
        <% for page, i in part.categories[0].pages: %>
          <li class="<%= ''/*  'active' unless i  */ %>" data-nav-id="<%= ''/*  @linkify(part.categories[0].name, page.title)  */ %>">
            <a href="#<%= ''/*  @linkify(part.categories[0].name, page.title)  */ %>"><%= ''/*  page.shortTitle  */ %></a>
          </li>
        <% end %>
      <% end %>
    </ul>
  </div>
</div>

<div class="col-md-9">
  <div class="document-header">
    <h1><%= ''/*  @getPreparedHeadline()  */ %></h1>
  </div>
  <%- ''/*  @partial('part-contents', @, { part: part })  */ %>
</div>
