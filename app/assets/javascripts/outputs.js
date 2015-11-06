/***********************************IMPACTO***************************************/
  

  /*Prepara la vista cuando de detecta un impacto vecinal*/
  function finaliza_impacto_vecinal(tipo){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    

    if(tipo == 'cita'){
      $('.jumbotron').html('<H2 class="colorprimario">Impacto Vecinal<H2><p>Debido a los dato que recabamos hasta este punto, lo más conveniente para dar seguimeinto a tu caso es hacer una cita.</p>');
      $('.next-step').html("<colorprimario>Siguiente paso 'Hacer una cita'</colorprimario><a class='colorprimario' href='/' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");   
    }else if('normal'){
      $('.jumbotron').html('<H2 class="colorprimario">Impacto Vecinal<H2><p>Porfavor continua y al final se daran todos los trámites y pasos que tu negocio necesita.</p>');
      $('.next-step').html("<colorprimario>Siguiente paso 'Uso de suelo'</colorprimario><a class='colorprimario' href='/zoning' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");   
    }
     
    //Actualizamos los progressBars
    progressBar("100","0","0");
  }


 /***********************************SUELO***************************************/
 function finaliza_uso_equipamiento(){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    $('.jumbotron').html("<H2 class='colorprimario'>Especial<H2><p>Debido a los dato que recabamos hasta este punto, lo más conveniente para dar seguimeinto a tu caso es hacer una cita.</p>");
    $('.next-step').html("<colorprimario>Siguiente paso 'Hacer una cita'</colorprimario><a class='colorprimario' href='/' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");   
    progressBar("100","100","0"); 
  }

   function finaliza_uso_derechos_adquiridos(){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    $('.jumbotron').html("<H2 class='colorprimario'>Derechos adquiridos<H2><p>Debido a los dato que recabamos hasta este punto, lo más conveniente para dar seguimeinto a tu caso es hacer una cita.</p>");
    $('.next-step').html("<colorprimario>Siguiente paso 'Hacer una cita'</colorprimario><a class='colorprimario' href='/' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");   
    progressBar("100","100","0"); 
  }

  function finaliza_sin_uso_de_suelo(){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    $('.jumbotron').html("<H2 class='colorprimario'>Habitacional<H2><p>y tu negocio mide menos del 20% de tu propiedad por lo que no requieres un uso de suelo diferente.</p><p>Porfavor continua y al final se daran todos los trámites y pasos que tu negocio necesita.</p>");
    $('.next-step').html("<colorprimario>Siguiente paso 'Protección civíl</colorprimario><a class='colorprimario' href='/safety' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");    
    progressBar("100","100","0"); 
  }

    function finaliza_con_uso_de_suelo(){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    $('.jumbotron').html("<H2 class='colorprimario'><H2>Apto para poner un negocio<p>Porfavor continua y al final se daran todos los trámites y pasos que tu negocio necesita.</p>");
    $('.next-step').html("<colorprimario>Siguiente paso 'Protección civíl</colorprimario><a class='colorprimario' href='/safety' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");    
    progressBar("100","100","0"); 
  }

 /***********************************SEGURIDAD***************************************/
  function finaliza_sefuridad_visto_bueno(){
    //hacemos visible la salida y la llenamos con la información
    $('.diagnostic').removeClass("hidden");
    $('.jumbotron').html("<H2 class='colorprimario'><H2>No cuenta con el Vo.Bo. de Seguridad y operación<p>Porfavor haz una cita para poder tramitarlo y continuar el diagnóstico</p>");
    $('.next-step').html("<colorprimario>Página para ver trámite 'Ir'</colorprimario><a class='colorprimario' href='/safety' data-no-turbolink='true'><span class='glyphicon glyphicon-chevron-right'></span></a>");    
    progressBar("100","100","100"); 
  }
