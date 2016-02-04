//Función encargada de transformar el evento ENTER y hacer Tab
// al siguiente elementeo visible
function enter2Tab(elem, e){
    var key = e.charCode? e.charCode : e.keyCode? e.keyCode : 0;
    if(key == 13){
        e.preventDefault();
        var inputs = jQuery(elem).closest('form').find(':input:visible');
        inputs.eq(inputs.index(elem) + 1).focus();
    }
}



function updateDatePicker () {
                jQuery("input[value='date.struct']:hidden").each(function() {
                    var dateFormat = "dd/mm/yy";
                    var name = jQuery(this).attr('name');
                    var id = name.replace(".", "_").replace("[", "_").replace("]", "_") + "_input"; // Create JQuery Friendly ID

                    if (jQuery('#'+id).length == 0) {

                        // Find the Select Elements
                        var selectDay= jQuery(this).nextAll("select:eq(0)").hide();
                        var selectMonth = jQuery(this).nextAll("select:eq(1)").hide();
                        var selectYear = jQuery(this).nextAll("select:eq(2)").hide();

                        // Get the Values
                        var dateDay= jQuery(selectDay).val();
                        var dateMonth = jQuery(selectMonth).val();
                        var dateYear = jQuery(selectYear).val();

                        // Calculate the Current Input Value
                        var val = "";
                        if (dateDay != "" && dateYear != "" && dateMonth != "") { // If there is a date in the Selects then use it otherwise it's empty
                            var date = new Date (dateYear, dateMonth-1, dateDay);
                            val = jQuery.datepicker.formatDate(dateFormat, date);
                        }

                        // Create element
                        var template = "<input type='text' name='"+ id +"' id='"+ id +"' value='"+ val +"'/>";

                        if (jQuery(this).parent(".datePickerCalenderView").size()) {
                            template = "<div id='"+ id +"'/>";
                        }


                        jQuery(this).before(template);
                        var displayWidget = jQuery('#' + id );

                        displayWidget.blur(function() {
                            var date = jQuery.datepicker.parseDate(dateFormat, jQuery(this).val());

                            if (date == null) {
                                jQuery(selectDay).val("");
                                jQuery(selectMonth).val("");
                                jQuery(selectYear).val("");
                            }
                            else {
                                jQuery(selectDay).val(date.getDate());
                                jQuery(selectMonth).val(date.getMonth()+1);
                                jQuery(selectYear).val(date.getFullYear());
                            }
                        }).keydown(function(event) {
                            // Show popup on Down Arrow
                            if (event.keyCode == 40) {
                                displayWidget.datepicker("show");
                            }
                        });


                        displayWidget.click(function(){

                            displayWidget.datepicker("show");
                        });


                        displayWidget.datepicker({
                            yearRange: '1960:2016',
                            changeMonth: true,
                            changeYear: true,
                            dateFormat: dateFormat,
                            constrainInput: true,
                            showButtonPanel: true,
                            showWeeks: true,
                            showOn: 'button',
                            onSelect: function(dateText, inst) {
                                if (inst == null) {
                                    jQuery(selectDay).val("");
                                    jQuery(selectMonth).val("");
                                    jQuery(selectYear).val("");
                                }
                                else {
                                    jQuery(selectDay).val(inst.selectedDay);
                                    jQuery(selectMonth).val(inst.selectedMonth+1);
                                    jQuery(selectYear).val(inst.selectedYear);
                                }
                            }
                        });
                    }
                });
            }



function setupGridAjax() {
    jQuery("body").on('click','.step a', function(event) {
        event.preventDefault();
        var url = jQuery(this).attr('href');

        var grid = jQuery(this).parents("table.ajax");
        jQuery(grid).html(jQuery("#spinner").html());

        jQuery.ajax({
            type: 'GET',
            url: url,
            success: function(data) {
                jQuery(grid).fadeOut('fast', function() {jQuery(this).html(data).fadeIn('slow');});
            }
        })
    });
}


function setupFilterAjax() {
    jQuery('div.filters :input').change(function() {
        var filterBox = jQuery(this).parents("div.filters");
        filterGrid(filterBox);
    });
    jQuery("div.filters form").submit(function() {
        var filterBox = jQuery(this).parents("div.filters");
        filterGrid(filterBox);
        return false;
    });
}


function filterGrid(filterBox) {
    var grid = jQuery(filterBox).next("div.grid");
    jQuery(grid).html(jQuery("#spinner").html());

    var form = jQuery(filterBox).find("form");
    var url = jQuery(form).attr("action");
    var data = jQuery(form).serialize();
    jQuery.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(data) {
          grid=jQuery("#grid");
            jQuery(grid).fadeOut('fast', function() {jQuery(this).html(data).fadeIn('slow');});
        }
    });
}



