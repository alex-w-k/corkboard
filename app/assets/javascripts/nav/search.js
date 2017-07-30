$(document).on('turbolinks:load', function() {
    let searchInputField = document.getElementById('service_search')
    let dataList = document.getElementById('services_list')


    searchInputField.addEventListener("keyup", function() {
        search = this.value
        $.getJSON(`api/search?query=${search}`, function(data) {
            if (data) {
                dataList.innerHTML = ''
                data.forEach(function(datum) {
                    let option = document.createElement('option')
                    option.value = datum.name
                    dataList.appendChild(option)
                });
            }
        })
    })
})