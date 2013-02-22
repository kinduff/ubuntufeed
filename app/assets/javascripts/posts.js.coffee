class Posts
  url = document.location.hostname
  post_template = _.template("
  <article>
    <div class='contenedor'>
      <p data-date='<%= date_string %>'  class='fecha'>
        <%= date %>
      </p>
      <a href='#' class='social'>Compartir</a>
      <ul class='share'>
        <li>
          <a class='copy' href='<%= link %>'>
            Copiar URL</a>
        </li>
        <li>
          <a class='tw' href='<%= link %>' title='<%= title %>'>
            Twitter</a>
        </li>
        <li>
          <a class='fb' href='<%= link %>' title='<%= title %>'>
            Facebook</a>
        </li>
      </ul>
      <p>
        <span class='blog'><%= blog.title %></span>
        <a href='http://"+url+"/post/<%= id %>/<%= slug %>' target='blank' class='link'><%= title %></a>
      </p>
    </div>
  </article>")

  fetch_page: ( page ) ->
    url = '/posts.json'
    $.ajax
      dataType: 'json'
      url: url
      data:
        page: page
      context: this
      success: (posts) ->
        posts_rendered = @render_posts posts
        $('.loading').hide()
        $('.load').show()
        $('.posts_container').append(posts_rendered)
        cargar_fechas()
  render_posts: ( posts ) ->
    content = ''
    _.each(
      posts, 
      (post) -> content += @render_post post, 
      this
    )
    content

  render_post: (post) ->
    post_template(post)

posts_app = new Posts
$('.load_more').on 'click', ->
  current_page++
  posts_app.fetch_page current_page
  $('.load').hide()
  $('.loading').show()
  false
