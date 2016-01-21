## API de prueba en Rails 5 (--api)

Para preparar el proyecto:

* Configurar el acceso a la base de datos en `config/database.yml`
* Crear y cargar la base de datos: `bundle exec rails db:create db:migrate db:seed`
* Levantar el server: `bundle exec rails s`

Luego, acceder a cualquiera de los endpoints disponibles en el puerto `:3000`:

* [/academic_units](http://localhost:3000/academic_units)
* [/academic_units/:code](http://localhost:3000/academic_units/26)
* [/document_types](http://localhost:3000/document_types)
* [/document_types/:code](http://localhost:3000/document_types/1)

El proyecto implementa caching con las cabeceras `ETag` y `Last-Modifed`, respondiendo con `304 Not Modified' cuando corresponde.

### Pruebas documentadas

Primera consulta:

```console
$ curl -I -w "@curl_format.txt" http://localhost:3000/document_types
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Last-Modified: Thu, 21 Jan 2016 17:02:09 GMT
Content-Type: application/json; charset=utf-8
Cache-Control: public
X-Request-Id: d3a452a8-d972-4b3a-821a-68bfd4ae5b26
X-Runtime: 0.008419

    time_namelookup:  0.005
       time_connect:  0.005
    time_appconnect:  0.000
   time_pretransfer:  0.005
      time_redirect:  0.000
 time_starttransfer:  0.014
                      ----------
         time_total:  0.014
```

Consulta con `If-Modified-Since` (notar que se usa una fecha **posterior** a la que el server devuelve en el ejemplo anterior en `Last-Modified`, por lo que el server retorna `304 Not Modified` sin contenido):

```console
$ curl -I -w "@curl_format.txt" -H 'If-Modified-Since: Thu, 21 Jan 2016 17:02:21 GMT' http://localhost:3000/document_types
HTTP/1.1 304 Not Modified
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Last-Modified: Thu, 21 Jan 2016 17:02:09 GMT
Cache-Control: public
X-Request-Id: cdca807b-0698-4be8-a459-e496a0d40d04
X-Runtime: 0.004307

    time_namelookup:  0.005
       time_connect:  0.006
    time_appconnect:  0.000
   time_pretransfer:  0.006
      time_redirect:  0.000
 time_starttransfer:  0.010
                      ----------
         time_total:  0.010
```
