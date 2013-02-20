Ubuntu Feed
============
Centralizador de feeds de los blogs mas famosos sobre Ubuntu y Linux en español.

Surge a partir de la necesidad de juntar y ordenar feeds de blogs relacionados a Ubuntu y Linux para el fácil acceso a noticias.

Proyecto realizado por [@kinduff](http://twitter.com/kinduff) en Ruby on Rails; código de fuente disponible en [Github](http://github.com/kinduff/ubuntufeed)

[Visitar web del proyecto](http://ubuntufeed.herokuapp.com/)
[Entrada al blog](http://abarcarodriguez.com/blog/ubuntufeed-noticias-de-ubuntu-para-todos)

## Actualizar
Tomamos array de blogs en `lib/tasks/main.rake`. Para llenar db:

    rake blogs:get


Mostrar los blogs:

    rake blogs:show


Loopear a través de blogs en db y actualizar posts:

    rake update:posts

## Licencia
UbuntuFeed por Alejandro AR ([@kinduff][1])

![Licencia Creative Commons Atribución-NoComercial-CompartirIgual 3.0 Unported](http://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png)

Este obra está bajo una [Licencia Creative Commons Atribución-NoComercial-CompartirIgual 3.0 Unported][2].

[1]: http://twitter.com/kinduff
[2]: http://creativecommons.org/licenses/by-nc-sa/3.0/deed.es
