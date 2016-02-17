      /*Flags*/
    var IMPACTO = 1;
    var SUELO = 2;
    var SEGURIDAD = 3;

    var TIPO_NORMAL= 1;
    var TIPO_FECHA = 2;
    var TIPO_RANGO = 3;
    var TIPO_LUGAR = 4;
  
/*************************************************GENERALES************************************/

/*Cuando se da clic a una opcion se obtiene el tama*/
  function buttonClick(actual,clicked, next, restriction, next_restrictions){
    changeColorSelected(actual,clicked);
    deleteAndFill(actual,clicked, next, restriction, next_restrictions,TIPO_NORMAL, 0);
  }

  /*Cuando se da clic a una opcion de un dropdown se obtiene el tama*/
  function dateClick(actual,clicked, next, restriction, next_restrictions,index){
    //var date = $(".date_"+clicked).val();
    var date = $("#date_"+actual+"_"+clicked+" option:selected").text();
    deleteAndFill(actual,clicked, next, restriction, next_restrictions,TIPO_FECHA, date);
  }

    /*Cuando se escribe un valor manualmente*/
  function dateText(actual,clicked, next, restriction, next_restrictions,index){
    //var date = $(".date_"+clicked).val();
    var date = $("#date_"+actual+"_"+clicked).val();

    deleteAndFill(actual,clicked, next, restriction, next_restrictions,TIPO_FECHA, date);
  }

/*Se muestra la vista dependiendo si existe una restriccion */
  function show_view(next, restriction,next_restrictions){
    $.ajax({
         type:'GET', 
         url: "#{root_path}",
         success: function(){
            up_page();
         },
        error: function(){
        }, 
         data: $.param({ pagetime: {next: next, totals: number_of_views, restriction: restriction, next_restrictions: next_restrictions }})
    });
  }

/*Se elimina la classe hidden para hacer visible el view y se actualizan los progress bar*/
  function hidden_div(id, impacto, suelo, seguiridad){
    //hacemos invisible la salida
    $('.diagnostic').addClass("hidden");
    //hacemos visible el view de pregunta
    document.getElementById(id).removeAttribute("class");
    $('#'+document.getElementById(id).id).addClass('animated fadeIn');

    ga('send', 'event', 'answer', window.location.href, id);

    
    //Actualizamos los progressBars
    progressBar(impacto, suelo, seguiridad);
  }

  /*Elimina todos los views despues del clickeado y con ajax muestra el siguiente view*/
  function deleteAndFill(actual,clicked,next,restriction,next_restrictions, tipo, date){
    for(i = parseInt(actual,10)+1; i <= number_of_views; i++){
      var element = document.getElementById(i);
        if(element !== null){
          element.setAttribute("class", "hidden");
        }
    }
    if(tipo === TIPO_NORMAL){
      save_advance(actual,clicked,next,restriction,next_restrictions);
    }else if(tipo === TIPO_FECHA){
     save_advance_date(actual,clicked,next,restriction,next_restrictions, date);
    }
    
  }

  /*Cambia el color del texto seleccionado, en caso de regresarte cambia todos los textos siguientes a color original*/
  function changeColorSelected(actual, clicked){
    for(i=actual; i<=number_of_views; i++){
      for(j=1; j<8; j++){

        var element = document.getElementById(i+"-"+j)
        if(element !== null){
          element.style.color = '#000000';//Cambiamos el color del texto por default
        }

        var element_imagen = document.getElementById("image"+i+"-"+j);
        if(element_imagen !== null){
          element_imagen.classList.remove("rcorner-selected");
        }
      }
    }

    document.getElementById(actual+"-"+clicked).style.color = '#871C57'; //Cambiamos el color del texto que seleccionamos
    document.getElementById("image"+actual+"-"+clicked).className = "rcorner rcorner-selected";

  }

  /*Se guarda el valor clikeado para saber que vista sigue*/
  function save_advance(actual,clicked,next,restriction,next_restrictions){
    $.ajax({
         type:'GET', 
         url: "#{root_path}",
         success: function(){
          show_view(next, restriction, next_restrictions);
         },
        error: function(){
        }, 
         data: $.param({ savetime: {actual: actual, clicked: clicked}})
    });
  }

  /*Se guarda el valor clikeado para saber que vista sigue SOLO PARA LOS DE FORMATO FECHA*/
  function save_advance_date(actual,clicked,next,restriction,next_restrictions, date){
    $.ajax({
         type:'GET', 
         url: "#{root_path}",
         success: function(){
          show_view(next, restriction, next_restrictions);
         },
        error: function(){
          //alert('error');
        }, 
         data: $.param({ savedate: {actual: actual, clicked: clicked, date: date}})
    });
  }

  /*Maneja el llenado de las barras de progreso*/
  function progressBar(impacto,suelo, seguiridad){
        $('.progress-impacto').text("Impacto: "+impacto+"%");
        $('.progress-impacto-css').css({'width': impacto+'%'});

        $('.progress-uso').text("Uso de suelo: "+suelo+"%");
        $('.progress-uso-css').css({'width': suelo+'%'});

        $('.progress-proteccion').text("Protección civil: "+seguiridad+"%");
        $('.progress-proteccion-css').css({'width': seguiridad+'%'});

  }

/*************************************************IMPACTO************************************/
 



/*************************************************SUELO************************************/
   /*Se piden las colonias de una delegacion */
  function show_city(town){
    $.ajax({
         type:'GET', 
         url: "#{root_path}",
         success: function(){
          up_page();
         },
        error: function(){
        }, 
         data: $.param({ pagetime: {next: next, totals: number_of_views, restriction: restriction, next_restrictions: next_restrictions }})
    });
  }


 /*Cuando se da clic a una delegacion se obtiene las colonias*/
  function dateClickTown(actual,clicked, next, restriction, next_restrictions,index){
    var date = $("#date_"+actual+"_"+clicked+" option:selected").text();
    $("#date_"+next+"_"+clicked)
    deleteAndFill(actual,clicked, next, restriction, next_restrictions,TIPO_FECHA, date);
    window.order = date;
    window.key = "date_"+next+"_"+clicked
    var url = window.location.href;

      $.ajax({
        type:'GET', 
        url: window.url,
        success: function(){
          ga('send', 'event', 'business_city', window.order, '');
        },
        error: function(){
        }, 
        data: $.param({ pagetown: {city_id: window.order, key: window.key}}), format: 'js'
      });
  }

/*************************************************SEGURIDAD************************************/

/*Permite obtener y validar el aforo del negocio*/
 function valueAforo(type,size){

    var superficie_t = $("#superficie_t").val();
    var mobiliario_t = $("#mobiliario_t").val();
    var impact_t = $("#impacto_t option:selected").text();

    var superficie_s = $("#superficie_s").val();
    var mobiliario_s = $("#mobiliario_s").val();

    if(superficie_s !== "" && mobiliario_s !== "" && superficie_t !== "" && mobiliario_t !== "" && impact_t !== ""){
     if(parseInt(superficie_s,10)<parseInt(mobiliario_s,10)){
        alert('El mobiliario  en el área de servicio no puede ser mayor al establecimiento');
        $("#superficie_s").val("");
        $("#mobiliario_s").val("");
      }else if(parseInt(superficie_t,10)<parseInt(mobiliario_t,10)){
        alert('El mobiliario  en el área de atención no puede ser mayor al establecimiento');
        $("#superficie_t").val("");
        $("#mobiliario_t").val("");
      }else if(parseInt(superficie_s,10)+parseInt(superficie_t,10) !== size){
        alert("La suma del area de servicio y el area de atención deben ser iguales al tamaño de tu negocio: "+size+"m2");
        $("#superficie_s").val("");
        $("#superficie_t").val("");
      }else{
        set_aforo(superficie_s,mobiliario_s,type,superficie_t,mobiliario_t,impact_t);
      }
    }
  }

  /*Obtiene y regresa el valor de aforo de un negocio*/
  function set_aforo(superficie_s,mobiliario_s,type,superficie_t,mobiliario_t,impacto_t){
    $.ajax({
         type:'GET', 
         url: "#{root_path}",
         success: function(){
          up_page();
         },
        error: function(){
        }, 
         data: $.param({ impact: {type: type ,
          superficie_s: superficie_s, mobiliario_s: mobiliario_s,
          impacto_t: impacto_t,superficie_t: superficie_t, mobiliario_t: mobiliario_t}})
    });
  }


/*Se coloca el valor del aforo y se borran los valores de la calculadora*/
  function set_value_aforo(valor){
    document.getElementById('date_1_1').value = valor;
    $('#date_1_1').trigger("change");
    $("#mobiliario option:selected").removeAttr("selected");
    $('#mobiliario').trigger("chosen:updated");
    $("#superficie option:selected").removeAttr("selected");
    $('#superficie').trigger("chosen:updated");
    $("#impacto option:selected").removeAttr("selected");
    $('#impacto').trigger("chosen:updated");
    document.getElementById(2).setAttribute("class", "hidden");
  }


/*animacion que sube el scroll lentamente*/
  function up_page(){
    $('html, body').animate({
    scrollTop: '+=900'
    }, 2000);
  }

/*Controla las flechas del acordion*/
$(function () {
      $(".details-toggle1").click(function () {
          $( ".suelo1" ).removeClass( "hidden");
          $( ".suelo2" ).addClass( "hidden" );
          $( ".seguridad1" ).removeClass( "hidden");
          $( ".seguridad2" ).addClass( "hidden" );
        if($( ".impacto1" ).is(":visible")){
          $( ".impacto2" ).removeClass( "hidden");
          $( ".impacto1" ).addClass( "hidden" );
        }else{
          $( ".impacto2" ).addClass( "hidden");
          $( ".impacto1" ).removeClass( "hidden" );
        }
      });
      
      $(".details-toggle2").click(function () {
          $( ".impacto1" ).removeClass( "hidden");
          $( ".impacto2" ).addClass( "hidden" );
          $( ".seguridad1" ).removeClass( "hidden");
          $( ".seguridad2" ).addClass( "hidden" );
        if($( ".suelo1" ).is(":visible")){
          $( ".suelo2" ).removeClass( "hidden");
          $( ".suelo1" ).addClass( "hidden" );
        }else{
          $( ".suelo2" ).addClass( "hidden");
          $( ".suelo1" ).removeClass( "hidden" );
        }
      });

      $(".details-toggle3").click(function () {
        $( ".impacto1" ).removeClass( "hidden");
        $( ".impacto2" ).addClass( "hidden" );
        $( ".suelo1" ).removeClass( "hidden");
        $( ".suelo2" ).addClass( "hidden" );
        if($( ".seguridad1" ).is(":visible")){
          $( ".seguridad2" ).removeClass( "hidden");
          $( ".seguridad1" ).addClass( "hidden" );
        }else{
          $( ".seguridad2" ).addClass( "hidden");
          $( ".seguridad1" ).removeClass( "hidden" );
        }
      });

  });