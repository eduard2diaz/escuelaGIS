var plantel = function () {

    var configurarFormulario = function () {
        $('select#plantel_d_codigo').select2({
            dropdownParent: $("#basicmodal"),
        });
        $('select#plantel_tipoasentamiento').select2({
            dropdownParent: $("#basicmodal"),
        });
        $('select#plantel_estado').select2({
            dropdownParent: $("#basicmodal"),
        });
        $('select#plantel_municipio').select2({
            dropdownParent: $("#basicmodal"),
        });
        $('select#plantel_tipoensenanza').select2({
            dropdownParent: $("#basicmodal"),
        });
    }

    var edicion = function () {
        $('body').on('click', 'a.edicion', function (evento) {
            evento.preventDefault();
            var link = $(this).attr('data-href');
            $.ajax({
                type: 'get',
                dataType: 'html',
                url: link,
                beforeSend: function (data) {
                    $.blockUI({ message: '<small>Cargando...</small>' });
                },
                success: function (data) {
                    if ($('div#basicmodal').html(data)) {
                        $('div#basicmodal').modal('show');
                        configurarFormulario();
                    }
                },
                error: function () {
                    //base.Error();
                },
                complete: function () {
                    $.unblockUI();
                }
            });
        });
    }


    var newAction = function () {
        $('div#basicmodal').on('submit', 'form#plantel_new', function (evento) {
            evento.preventDefault();
            var padre = $(this).parent();
            var l = Ladda.create(document.querySelector('.ladda-button'));
            $.ajax({
                url: $(this).attr("action"),
                type: "POST",
                data: $(this).serialize(),
                beforeSend: function () {
                    l.start();
                },
                complete: function () {
                    l.stop();
                },
                success: function (data) {
                    if (data['error']) {
                        padre.html(data['form']);
                        configurarFormulario();
                    } else
                        document.location.href=data['url'];
                },
                error: function () {
                    //base.Error();
                }
            });
        });
    }

    var edicionAction = function () {
        $('div#basicmodal').on('submit', 'form#plantel_edit', function (evento) {
            evento.preventDefault();
            var padre = $(this).parent();
            var l = Ladda.create(document.querySelector('.ladda-button'));
            $.ajax({
                url: $(this).attr("action"),
                type: "POST",
                data: $(this).serialize(),
                beforeSend: function () {
                    l.start();
                },
                complete: function () {
                    l.stop();
                },
                success: function (data) {
                    if (data['error']){
                        padre.html(data['form']);
                        configurarFormulario();
                    }
                    else
                        document.location.href=data['url'];
                },
                error: function () {
                    //base.Error();
                }
            });
        });
    }


    var estadoListener = function () {
        $('div#basicmodal').on('change', 'select#plantel_estado', function (evento)
        {
            if ($(this).val() > 0)
                $.ajax({
                    type: 'get', //Se uso get pues segun los desarrolladores de yahoo es una mejoria en el rendimineto de las peticiones ajax
                    dataType: 'json',
                    url: Routing.generate('municipio_find_by_estado', {'id': $(this).val()}),
                    beforeSend: function (data) {
                        $.blockUI({message: '<small>Cargando...</small>'});
                    },
                    success: function (data) {
                        var cadena="";
                        var array=JSON.parse(data);
                        if(data!=null) {
                            for (var i = 0; i < array.length; i++)
                                cadena += "<option value=" + array[i]['id'] + ">" + array[i]['nombre'] + "</option>";
                            $('select#plantel_municipio').html(cadena);
                            $('select#plantel_municipio').change();
                        }else{
                            $('select#plantel_municipio').html(cadena);
                            $('select#plantel_d_codigo').html(cadena);
                        }
                    },
                    error: function () {
                        //base.Error();
                    },
                    complete: function () {
                        $.unblockUI();
                    }
                });
        });
    }

    var municipioListener = function () {
        $('div#basicmodal').on('change', 'select#plantel_municipio', function (evento)
        {
            if ($(this).val() > 0)
                $.ajax({
                    type: 'get', //Se uso get pues segun los desarrolladores de yahoo es una mejoria en el rendimineto de las peticiones ajax
                    dataType: 'json',
                    url: Routing.generate('codigo_postal_find_by_municipio', {'id': $(this).val()}),
                    beforeSend: function (data) {
                        $.blockUI({message: '<small>Cargando...</small>'});
                    },
                    success: function (data) {
                        var cadena="";
                        var array=JSON.parse(data);
                        if(data!=null){
                            for(var i=0;i<array.length;i++)
                                cadena+="<option value="+array[i]['id']+">"+array[i]['nombre']+"</option>";
                        }
                        $('select#plantel_d_codigo').html(cadena);
                    },
                    error: function () {
                        //base.Error();
                    },
                    complete: function () {
                        $.unblockUI();
                    }
                });
        });
    }

    var eliminar = function () {
        $('div#basicmodal').on('click', 'a.eliminar_plantel', function (evento) {
            evento.preventDefault();
            var link = $(this).attr('data-href');
            var token = $(this).attr('data-csrf');
            $('div#basicmodal').modal('hide');

            bootbox.confirm({
                title: 'Eliminar plantel',
                message: '¿Está seguro que desea eliminar esta plantel?',
                buttons: {
                    confirm: {
                        label: 'Si, estoy seguro',
                        className: 'btn-sm btn-primary'
                    },
                    cancel: {
                        label: 'Cancelar',
                        className: 'btn-sm btn-secondary'
                    }
                },
                callback: function (result) {
                    if (result == true)
                        $.ajax({
                            type: 'get',
                            url: link,
                            data: {
                                _token: token
                            },
                            beforeSend: function () {
                                $.blockUI({ message: '<h1><img src="busy.gif" /> Just a moment...</h1>' });
                            },
                            complete: function () {
                                $.unblockUI();
                            },
                            success: function (data) {
                                document.location.href=data['url'];
                            },
                            error: function () {
                                //base.Error();
                            }
                        });
                }
            });
        });
    }


    return {
        init: function () {
            $().ready(function () {
                    newAction();
                    edicion();
                    edicionAction();
                    estadoListener();
                    municipioListener();
                    eliminar();
                }
            );
        }
    }
}();