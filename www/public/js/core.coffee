class trend
  constructor: ()->
  vars: {
    base_url: "/",
    tpl_path: "public/tpl/",
    user: "anonymous",
    students: []
  }, 
  init: () ->
    this.ui.build()
    this.listen()
    this.login.shortpoll()
  listen: () ->
    content = $('#content');
    breadcrumbs = $('#breadcrumbs')

    breadcrumbs.on('click', '#logout', (e) ->
      e.preventDefault();
      trend::login.logout()
    )

    content.on('click', '#btn-add-student', (e) -> 
      trend::ui.dialog.show("#add-dialog")
    )
    content.on('click', 'button.close', (e) -> 
      trend::ui.dialog.hide("#add-dialog")
    )

    content.on('submit', '#login form', (re) ->
      re.preventDefault()
      trend::login.submit($(@))
    )

    content.on('keyup', '.student span', (e) ->
      val = $(@).text()
      field = $(@).data('fieldname')
      id = $(@).closest('tr').data('student-id');
      $.post('op/crud.jsp', {"intent" : "u","field" : field, "val" : val, "id" : id}, (e) ->
        console.log(e);
      )
    )

    content.on('click', '.delete', (e) ->
      id = $(@).data('student-id');
      $.post('op/crud.jsp', {"intent" : "d", id: id}, (e) ->
        console.log(e);
      ).done () ->
        trend::ui.rebuild()
        location.reload()
    )
    content.on('keydown', '#txtSearchStudents', (e) ->
      val = $(@).val()
      $.post('op/crud.jsp', {"intent" : "s","key" : val}, (e) ->
        console.log(e);
      ).done (re) ->
        re = JSON.parse(re)
        student_list = $('#student-list')
        tbody = student_list.find('tbody').html("")
        for k, v of re
          tbody.append "<tr class='student' data-student-id='#{v.id}'>" +
            "<td><img src='#{v.profile}'>" +
            "<td><span contenteditable data-fieldname='name'>#{v.name}</span>" +
            "<td><span contenteditable data-fieldname='username'>#{v.username}</span>" +
            "<td><span contenteditable data-fieldname='address'>#{v.address}</span>" +
            "<td><span contenteditable data-fieldname='email'>#{v.email}</span>" +
            "<td><span contenteditable data-fieldname='contact'>#{v.contact}</span>" +
            "<td><a href='#' class='delete' data-student-id='#{v.id}'><i class='icon-trash'></i></a>";
        
    )

    content.on('click', '#btn-register-student', (e) ->
      e.preventDefault()
      form = $(@).closest('form')
      data = form.serializeArray()
      $.post('op/crud.jsp', data, (e) ->
        console.log e
      ).done () ->
        trend::ui.dialog.hide('.dialog')
        trend::ui.rebuild()
        location.reload()
    )

  ui: 
    vars: {
      breadcrumbs: [
          {"location" : "#login", "title": "Login"}
        ],
      page: {"title":"Management System for Interns", "icon": "icon-code-fork"},
      content_tpl: "login",
      view_tpl: "table"
    },
    build: () ->
      this.rebuild()
    rebuild: () ->
      # dirty hack
      vars = this.vars
      tpl = trend::vars.tpl_path + vars.content_tpl
      # rebuild user navigation
      user_nav = $('#secondary-nav')
      user_nav.find('.user').text(trend::vars.user)

      # rebuild page title
      page = vars.page
      page_info = $('.page-info')
      page_info.find('h1').html("<i class='#{page.icon}'></i>#{page.title}")

      # rebuild breadcrumbs
      breadcrumbs = $('#breadcrumbs').find('ul')
      home = $("<li><i class='icon-home'></i>Home</li>")
      breadcrumbs.html(home)
      $.each(vars.breadcrumbs, (k,v)->
        breadcrumbs.append("<li><i class='icon-angle-right'></i><a href='#{v.location}' id='#{v.id}'>#{v.title}</a></li>")
      )
      
      # rebuild content
      content = $('#content')
      $.get("#{tpl}.tpl", (html) ->
          content.html(html)
        )

    dialog: {
      show: (dialog) ->
        $('.overlay').show()
        $(dialog).show()
      hide: (dialog) ->
        $('.overlay').hide()
        $(dialog).hide()
    }

  login: {
    shortpoll: (data) ->
      $.get('op/session.jsp', (e) ->
          re = JSON.parse(e)
          if re.loggedin is true
            trend::ui.vars.breadcrumbs = [
              {"location" : "#logout", "title": "Logout", "id" : "logout"}
            ]
            trend::ui.vars.content_tpl = "template";
            trend::vars.user = re.user
            $.get('op/crud.jsp', {"intent":"r"}, (re) ->
                console.log("")
              ).done (re) ->
                re = JSON.parse(re)
                student_list = $('#student-list')
                tbody = student_list.find('tbody').html("")
                for k, v of re
                  tbody.append "<tr class='student' data-student-id='#{v.id}'>" +
                    "<td><img src='#{v.profile}'>" +
                    "<td><span contenteditable data-fieldname='name'>#{v.name}</span>" +
                    "<td><span contenteditable data-fieldname='username'>#{v.username}</span>" +
                    "<td><span contenteditable data-fieldname='address'>#{v.address}</span>" +
                    "<td><span contenteditable data-fieldname='email'>#{v.email}</span>" +
                    "<td><span contenteditable data-fieldname='contact'>#{v.contact}</span>" +
                    "<td><a href='#' class='delete' data-student-id='#{v.id}'><i class='icon-trash'></i></a>";
          else
            trend::ui.vars.content_tpl = "login";
            trend::ui.breadcrumbs = [{"location" : "#login", "title": "Login"} ]
            trend::vars.user = "anonymous"
        ).done () ->
          trend::ui.rebuild()
          
            
    submit: (that) ->
      data = that.serializeArray()
      $.post "op/login.jsp", data, (re) ->
        re = JSON.parse(re)
      .done (re) ->
        trend::login.shortpoll(re)
    logout: () ->
      $.get("op/logout.jsp").done (re) ->
        trend::login.shortpoll(re)
  }
$(document).ready () ->
  app = new trend
  app.init()