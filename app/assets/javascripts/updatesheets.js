// Search bar for datasheet
$(document).ready(function(){
  $("#myInput").on("keyup", function() {  //keyup runs when the user releases a key on the keyboard
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
