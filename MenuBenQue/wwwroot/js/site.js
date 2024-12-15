// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(window).on('beforeunload', function () {
    $("#blockUI").show();
});

$(window).on('load', function () {
    $("#blockUI").hide();
});


$(document).ready(function () {
    $(document).ajaxStart(function () {
        $("#blockUI").show();
    });

    $(document).ajaxStop(function () {
        $("#blockUI").hide();
    });
});
