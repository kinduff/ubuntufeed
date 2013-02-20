class Posts
  post_template = _.template("
  <article>
    <p data-date='<%= date_string %>'  class='fecha'>
      <%= date %>
    </p>
    <p>
      <a href='<%= link %>' target='blank'><%= title %></a>
    </p>
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
  false
