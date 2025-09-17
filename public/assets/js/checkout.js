

var region_el = document.querySelector("#region");
var delivery_type_el = document.querySelector("#delivery_method");
var district_el = document.querySelector("#district-select");
var free_yandex_deliver = ["1"];

function regionChangeHandler(event) {
    var region = region_el.value;
    if (free_yandex_deliver.includes(region)) {
        delivery_type_el.add(new Option("Yandex", "yandex"));
        delivery_type_el.add(new Option("Free delivery", "free"));
    } else {
        for (let i = delivery_type_el.options.length - 1; i >= 0; i--) {
            if (["yandex", "free"].includes(delivery_type_el.options[i].value)) {
                delivery_type_el.remove(i);
            }
        }
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
async function updateDeliveryPrice() {
    var region = region_el.value;
    var delivery_type = delivery_type_el.value;
    var district = district_el.value;
    let long = document.querySelector("#longitude").value;
    let lat = document.querySelector("#latitude").value;
    let interval = setInterval(function() {
        if (long != document.querySelector("#longitude").value || lat != document.querySelector("#latitude").value) {
            updateDeliveryPrice();
            clearInterval(interval);
            return
        }
    }, 500);
    if (district == "") {
        while (district == "") {
            if (district_el.value != "") {
                district = district_el.value;
                console.log("bor");
            }
            console.log("yo'q");
            await sleep(500);
        }
    }
    console.log(long, lat);
    $.ajax({
        url: "/api/v1/calculate",
        method: "POST",
        data: {
            customer_id: document.querySelector("#customer_id").dataset.value,
            region: region,
            delivery_method: delivery_type,
            district: district,
            long: long,
            lat: lat
        },
    }).done(function(res) {
        localStorage.setItem("delivery_price", res.price);
        document.querySelector("#delivery_price").innerText = new Intl.NumberFormat('uz-UZ', {
            style: 'currency',
            currency: 'UZS',
            minimumFractionDigits: 0
        }).format(res.price);
        $("#total_price").text($("#total_price").text() * 1 + res.price);
        $("#total_price_2").text($("#total_price_w").text() * 1 + res.price);
    })
}
document.addEventListener("DOMContentLoaded", function(e) {
    let $select = $(".region-select");
    $select.on("change", regionChangeHandler);
    $(".region-select").on("change", updateDeliveryPrice);
    $("#district-select").on("change", updateDeliveryPrice);
    $("#delivery_method").on("change", updateDeliveryPrice);
});
