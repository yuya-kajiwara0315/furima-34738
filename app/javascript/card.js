const pay = () => {
  Payjp.setPublicKey("pk_test_******************");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[hoge]"),
      exp_month: formData.get("order_address[hoge]"),
      exp_year: `20${formData.get("order_address[hoge]")}`,
      cvc: formData.get("order_address[hoge]"),
    };
  });
};

window.addEventListener("load", pay);