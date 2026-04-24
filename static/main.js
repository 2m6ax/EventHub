const EVENTS = [
  {
    title: "Bunter Abend",
    category: "Schulevent",
    date: "12.03.2026",
    location: "Cafeteria LFS",
    price: "4,00 €",
    tickets: "14 verfügbar"
  },
  {
    title: "Fußballtunier",
    category: "Sportevent",
    date: "10.04.2026",
    location: "Sporthalle AGO",
    price: "6,00 €",
    tickets: "Unbegrenzt"
  },
  {
    title: "Abschlussball Abitur 26",
    category: "Schulevent",
    date: "19.06.2026",
    location: "Patentkrug",
    price: "80,00 €",
    tickets: "86 verfügbar"
  }
];

function render() {
  document.getElementById("year").textContent = new Date().getFullYear();

  const grid = document.getElementById("eventsGrid");
  grid.innerHTML = EVENTS.map(e => `
    <div class="card">
      <div class="badge">${e.category}</div>
      <h3>${e.title}</h3>
      <p>${e.date} · ${e.location}</p>
      <div class="row">
        <span class="price">${e.price}</span>
        <span class="meta">${e.tickets}</span>
      </div>
    </div>
  `).join("");
}

render();