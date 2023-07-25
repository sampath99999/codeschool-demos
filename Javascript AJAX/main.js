function showStore(products) {
    let productTag = "";
    for (let i = 0; i < products.length; i++) {
        productTag += `<div class="col-12 col-md-3">
                            <div class="card">
                                <img src="${products[i].img}"
                                    class="card-img-top" alt="Iphone">
                                <div class="card-body">
                                    <p class="card-title">${products[i].name}</p>
                                    <h3>₹ ${products[i].price}.00</h3>
                                    <button class="btn btn-primary">Add to Cart</button>
                                </div>
                            </div>
                        </div>`;
    }

    document.getElementById("storeDiv").innerHTML = productTag;
}

function loadProducts() {
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        let products = JSON.parse(this.responseText);
        showStore(products);
    };
    xhttp.open("GET", "data.json");
    xhttp.send();
}
