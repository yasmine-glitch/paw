// const price = () => {
//   // console.log(end_date);
//   // const value_end_date = () => {
//   //   const end_date = document.querySelector("#reservation_end_date");
//   //   end_date.addEventListener("change", (event) => {
//   //     const result_end_date = event.currentTarget.value;
//   //   });
//   // };
//   // console.log("hello world");
//   console.log(value_end_date());

// };

const computePrice = () => {
  const form = document.querySelector('#new_reservation')
  form.addEventListener('change', (event) => {
    const startDate = document.querySelector("#reservation_start_date");
    const endDate = document.querySelector("#reservation_end_date");
    if (startDate.value && endDate.value) {
      const days = (Date.parse(endDate.value) - Date.parse(startDate.value)) / 86400000
      const price_per_day = parseInt(document.querySelector("#price").innerText.match(/\d+/)[0]);
      const total_price = (price_per_day * days)
      const price_in_html = document.querySelector('#price_html');
      price_in_html.insertAdjacentHTML('beforeend', `${total_price} €`);
    }

      // const price_per_day = animal.price;
      // console.log(price_per_day);

  })
}

export {computePrice}


// const value_end_date = () => {
//   const end_date = document.querySelector("#reservation_end_date");
//   end_date.addEventListener("change", (event) => {
//     console.log(event.currentTarget.value);
//   });
// };

// const value_start_date = () => {
//   const start_date = document.querySelector("#reservation_start_date");
//   start_date.addEventListener("change", (event) => {
//     console.log(event.currentTarget.value);
//   });
// };


// export {price}
// export {value_end_date}
// export {value_start_date}



// recuperer les 2 dates
    // - récuperer l'élément du formulaire
    // - addEventListener pour écouter quand la valeur change

// parser les dates. // Date.parse
//soustraire les dates
// convertir le résultat
// récupérer l'élément du DOM price
// insérer le résultat final
