Ubuntu Feed
============
Centralizador de feeds de los blogs mas famosos sobre Ubuntu y Linux en español.

Surge a partir de la necesidad de juntar y ordenar feeds de blogs relacionados a Ubuntu y Linux para el fácil acceso a noticias.

Proyecto realizado por [@kinduff](http://twitter.com/kinduff) en Ruby on Rails; código de fuente disponible en [Github](http://github.com/kinduff/ubuntufeed)

[Visitar web del proyecto](http://ubuntufeed.herokuapp.com/)

## Actualizar
Tomamos array de blogs en `lib/tasks/main.rake`. Para llenar db:

    rake blogsinfo:get


Mostrar los blogs:

    rake blogsinfo:show


Loopear a través de blogs en db y actualizar posts:

    rake update:posts

