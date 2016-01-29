[![Build Status](https://travis-ci.org/civica-digital/sedeco-oficina-virtual.svg?branch=master)](https://travis-ci.org/civica-digital/sedeco-oficina-virtual)
[![Code Climate](https://codeclimate.com/github/civica-digital/sedeco-oficina-virtual/badges/gpa.svg)](https://codeclimate.com/github/civica-digital/sedeco-oficina-virtual)
[![Test Coverage](https://codeclimate.com/github/civica-digital/sedeco-oficina-virtual/badges/coverage.svg)](https://codeclimate.com/github/civica-digital/sedeco-oficina-virtual/coverage)

<img src="https://raw.githubusercontent.com/civica-digital/sedeco-oficina-virtual/master/app/assets/images/logo.png" alt="" height="100%" width="100%"/>
===
Es una herramienta que tiene 3 módulos:

**Diagnóstico**: Te permite conocer los requisitos que tienes y los que te faltan para que tu negocio este en regla a partir de un cuestionario. 

**Citas**: Agendar una cita con SEDECO.

**Centro de aprendizaje**: Permite ver contenidos(Videos o PDF's) que los administradores suben. 
___

Realizado en [Ruby: 2.2.3  on Rails: 4.2.1](http://rubyonrails.org/)


##Dependencias:

**[Sengrid](https://sendgrid.com/)**: para el manejo de envío de correos.

Se requieren las siguientes llaves:

 	admin_emails: 'correo1@mail.com, correo2@mail.com'
 	SENDGRID_PASSWORD: 'SOMETHING'
 	SENDGRID_USERNAME: 'SOMETHING'
    
    
##Instalación:

Puedes acceder al repositorio en [GitHub](https://github.com) de [AsesorEnLínea:YoTeApoyo](https://github.com/civica-digital/sedeco-oficina-virtual)

Clonamos el repositorio:

    git clone git@github.com:civica-digital/sedeco-oficina-virtual.git
    
Instalamos y actualizamos las gemas:

	bundle install
	
Creamos las migraciones de la base de datos:

	rake db:create && rake db:migrate 
	
	
	
##Árbol de preguntas

AsesorEnLínea:YoTeApoyo cuenta con una sección de diagnóstico el cual se alimenta de 3 archivos json ubicados en 'lib/inputs':

    impacto.json
    seguridad.json
    suelo.json    

##¿Preguntas o problemas? 

Mantenemos la conversación del proyecto en nuestra página de problemas [issues](https://github.com/civica-digital/sedeco-oficina-virtual/issues). Si usted tiene cualquier otra pregunta, nos puede contactar por correo a <equipo@civica.digital>.

##Licencia

Licensed under the Apache License, Version 2.0 Read the document [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for more information

Creado por [Cívica Digital](http://www.civica.digital), el [Instituto Mexicano para la competitividad](http://imco.org.mx/home/) y [SEDECO](http://www.sedecodf.gob.mx/sedeco/), 2015-2016.
