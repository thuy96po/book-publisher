function edit(id)
{
  var quantity = $('#quantity-'+id).val();
  var cart = {id: id, quantity: quantity};
  $.ajax({
    type: 'POST',
    url: '/carts',
    data: cart,
    dataType: 'script'
  });
}
