﻿$(function () {

    $(".dropdown-search").on('show.bs.dropdown', function () {
        $.ajax({
            type: "GET",
            url: '/Search/ShowCategories',
            success: function (data) {
                for (cat of data) {
                    $(".dropdown-search .dropdown-menu").append(`<li role="presentation"><a role="menuitem" value="${cat.id}" tabindex="-1" href="#">${cat.name}</a></li>`);
                }
            }
        });
    });
    $(".dropdown-search").on('hidden.bs.dropdown', function () {
        $(".dropdown-search .dropdown-menu")[0].innerHTML = '';
    });
    $(".dropdown-search").click(function (e) {
        if (e.target.tagName == 'A') {
            $('#categoryMenu')[0].innerHTML = e.target.innerHTML + `   <span class="caret"></span>`;
            $('#categoryId').val(e.target.getAttribute('value'));
        }
    });

    $("#subCategory").autocomplete({
        source: function (request, response) {
            let param = { name: $('#subCategory').val(), categoryId: $('#categoryId').val() };
            $.ajax({
                url: '/Search/SubCategoriesCollection',
                data: JSON.stringify(param),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data,
                        function(item) {
                            return {
                                value: item.name,
                                subCategory: item.id,
                                category: item.categoryId

                            }
                        }))
                },
                error: function (xmlHttpRequest, textStatus, errorThrown) {
                    var err = eval("(" + XMLHttpRequest.responseText + ")");
                    alert(err.Message)
                    // console.log("Ajax Error!");
                }
            });
        },
        minLength: 2, //This is the Char length of inputTextBox
        select: function (event, ui) {
            window.location.href = "/Search/Search/" + ui.item.category + "/" + ui.item.subCategory;
        }
    });
});