

var region_el = document.querySelector("#region");
var delivery_type_el = document.querySelector("#delivery_method");
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
regionChangeHandler(null);
region_el.addEventListener("change", regionChangeHandler);
