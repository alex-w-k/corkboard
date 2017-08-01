$(document).ready(function() {

    $('input[type=submit]').click(function() {
        $('#new_bid').submit()
            // var valuesToSubmit = $("#new_bid").serialize();
            //     $("#myModal").modal('hide');

        //     debugger;
        //     $.post({
        //         url: "/bids",
        //         data: { bid: { valuesToSubmit } },
        //         type: "POST"
        //     })

        //     return false;
    });
});