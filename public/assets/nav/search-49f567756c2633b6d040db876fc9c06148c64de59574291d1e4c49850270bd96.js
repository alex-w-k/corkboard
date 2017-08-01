$(document).on('turbolinks:load', function() {
    const searchInputField = document.getElementById('service_search')
    const dataList = document.getElementById('services_list')


    searchInputField.addEventListener("keyup", function() {
        search = this.value
        $.getJSON('api/search', { query: search },
            function(data) {
                if (data) {
                    dataList.innerHTML = ''
                    data.forEach(function(datum) {
                        var option = document.createElement('option')
                        option.value = datum.name
                        dataList.appendChild(option)
                    });
                }
            })
    })
})
;
