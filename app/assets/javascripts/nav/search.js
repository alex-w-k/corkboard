document.addEventListener('DOMContentLoaded', function() {
    const searchInputField = document.getElementById('service_search')
    const dataList = document.getElementById('services_list')
    if (searchInputField) {

        searchInputField.addEventListener("keyup", function() {

            search = this.value
            $.getJSON('https://api.myfucking.network/api/search', { query: search },
                function(data) {
                    dataList.innerHTML = ''
                    if (data) {
                        data.forEach(function(datum) {
                            var option = document.createElement('option')
                            option.value = datum.name
                            dataList.appendChild(option)
                        });
                    }
                })
        })
    }
})
