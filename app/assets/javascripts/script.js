// let select = document.querySelector('text');
// let div = document.querySelector('div');
// object.addEventListener("change", myScript);

// select.addEventListener('click', () =>{
//   if(div.style.display === "none"){
//     div.style.display = "block" ;
//   }else{
//     div.style.display === "none"
//   }
// })

//$(document).ready(function () {
//   $("#select_type").change(function () {
//   getelementfromdropdown()
//   });
//   });
//   function getelementfromdropdown(); {
//   var value = $("#select_type").val();
//   if (value == "Text") {
//   $("#options").hide();
//   } else {
//   $("#options").show();
//   }
//   } 
  
$(function() {
  $('#question_type').change(function() {
    if ($(this).val() == 'Text') {
      $('#options').show();
    } else {
      $('#options').hide();
    }
  }).change();
})