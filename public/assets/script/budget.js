let totalPrice = 0;

function addToTotal(price) {
const parsedPrice = parseInt(price, 10);
if (isNaN(parsedPrice)) {
console.error("Invalid price:", price);
return;
}
totalPrice += parsedPrice;
document.getElementById("totalDisplay").innerText = "Total: " + new Intl.NumberFormat('ja-JP', {
style: 'currency',
currency: 'JPY'
}).format(totalPrice);
}

function handleReservation(event) {
event.preventDefault();
const price = event.target.getAttribute("data-price");
addToTotal(price);
}

document.addEventListener('DOMContentLoaded', function () {
const reservationButtons = document.querySelectorAll("[onclick='addToTotal(this)']");

reservationButtons.forEach((btn) => {
btn.removeAttribute("onclick");
btn.addEventListener("click", handleReservation);
});

const apiKey = 'UPIc4vnV6tlhBpeF7hZpuAhyGxCePrne'; // Remplacez par votre clé API Exchange Rates Data
const convertButton = document.getElementById('convert');

convertButton.addEventListener('click', function () {
const fromCurrency = 'JPY';
const toCurrency = document.getElementById('currencySelect').value;
const resultElement = document.getElementById('totalDisplay');

if (totalPrice && fromCurrency !== toCurrency) {
const apiUrl = `https://api.apilayer.com/exchangerates_data/convert?to=${toCurrency}&from=${fromCurrency}&amount=${totalPrice}`;
const myHeaders = new Headers();
myHeaders.append("apikey", apiKey);
const requestOptions = {
method: 'GET',
redirect: 'follow',
headers: myHeaders
};

fetch(apiUrl, requestOptions).then(response => {
if (response.ok) {
return response.json();
} else {
throw new Error('Erreur lors de la récupération des taux de change');
}
}).then(data => {
if (data && data.result) {
const currencySymbol = getCurrencySymbol(toCurrency);
resultElement.textContent = `Total: ${currencySymbol}${
data.result.toFixed(2)
}`;
} else {
resultElement.textContent = 'Erreur lors de la récupération des taux de change';
}
}).catch(error => {
resultElement.textContent = error.message;
});
} else {
resultElement.textContent = 'Veuillez entrer un montant et sélectionner des devises différentes';
}
});
});

function getCurrencySymbol(currencyCode) {
const currencySymbols = {
'JPY': '￥',
'USD': '$',
'EUR': '€',
'GBP': '£',
'AUD': 'A$',
'CAD': 'C$',
// Ajoutez d'autres symboles de devise ici
};
return currencySymbols[currencyCode] || '';
}