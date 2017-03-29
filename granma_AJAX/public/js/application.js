$(document).ready(function() {
//   console.log($('input').bind(function(){
  // detener proceso
  //tomar control del botón  submit
   
    $("form").submit(function(event){
      event.preventDefault();
      var info = $("form").serialize();
      $.post("/abuelita", info, function(data){
        response = "<p id='grandma_says'>Tu Abuelita dice: \"<span >" + data + "</span>\"</p>"
        $("#grandma_says").html(response)
      
      });
    //con serialize obtienes los datos de la forma
    
    //hacer el post $.post
    //Pasarle la ruta al post y los datos
  });
  //trabajar con los datos dentro de .post
});

	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

//investigar el request.xhr?
//identificar en el controlador si
//existe una peticion ajax
