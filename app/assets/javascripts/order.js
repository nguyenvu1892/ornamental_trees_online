$(document).ready(function () {
  changed();

  $("select").change(function () {
    changed();
  });

  function changed(){
    totalPrice = 0;
    price = $(".price");

    quantity = $(".quantity select");
    for (var i = 0; i < price.length; i++){
      totalPrice += parseFloat(price.text()) * parseFloat(quantity.val());
    }
    $("#total").html(totalPrice);
    $("#total").append(" $"); 
  }
});

