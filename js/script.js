(function($){

    var $wall = $('#wall');
    var json = [];
    var board_size = -1;

    if ( !($('html').hasClass('audio')) ) {
        var error_messaging = '<p>oops, it looks like your browser doesn&rsquo;t support html5 audio elements.</p>';
        $('body').append(error_messaging);
    } else {
        $.getJSON('/dronemotor/sounds.json', function(data) {
            json = data;
            board_size = Math.ceil(Math.sqrt(json.sounds.length));
            makeWall();
        });
    }

    function makeWall() {
        var board_width = board_size * 74;
        $wall.css('width', board_width);

        $wall.on('click', '.buddha-machine', function() {
            if ( $(this).hasClass('inactive') ) { return; }

            $(this).toggleClass('on');
            var $audio = $(this).find('audio');

            if ( $(this).hasClass('on') ) {
                $audio.trigger('play');
            } else {
                $audio.trigger('pause');
            }
        });

        buildMachines();
    }

    function buildMachines() {
        var total_machines = Math.pow(board_size, 2);
        var inactive_machines = total_machines - json.sounds.length;
        var machine_template = $('#buddha-machine-template').html();

        $.each(json.sounds, function() {
            var buddha_machine_html = _.template(machine_template, this);
            $wall.append(buddha_machine_html);
        });

        for (i = 0; i < inactive_machines; i++) {
            var buddha_machine_html = _.template(machine_template, {mp3: null, ogg: null, wav: null});
            $wall.append(buddha_machine_html);
        }
    }

})(jQuery);