let cart = [];
let totalPrice = 0;

function addToCart(productName, productPrice) {
    cart.push({ name: productName, price: productPrice });
    totalPrice += productPrice;
	document.getElementById('cartItems').innerHTML="";
	document.getElementById('totalPrice').innerHTML=totalPrice;
    displayCart();
}

function displayCart() {
    const cartItems = document.getElementById('cartItems');
    const totalPriceElement = document.getElementById('totalPrice');
    
    cartItems.innerHTML = '';
    cart.forEach(item  => {
        const li = document.createElement('li');
        li.textContent = `${item.name}` - `${item.price.toFixed(2)}`;
        cartItems.appendChild(li);
    });
    
    totalPriceElement.textContent = totalPrice.toFixed(2);
}