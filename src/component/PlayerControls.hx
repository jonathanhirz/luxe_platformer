package component;

import luxe.Component;
import luxe.Entity;

class PlayerControls extends Component {

    var player : Entity;
    var player_speed : Int = 2;

    override function init() {

        player = cast entity;

    } //init

    override function update( dt:Float ) {

        if(Luxe.input.inputdown("left")) player.pos.x -= player_speed;
        if(Luxe.input.inputdown("right")) player.pos.x += player_speed;
        if(Luxe.input.inputdown("up")) player.pos.y -= player_speed;
        if(Luxe.input.inputdown("down")) player.pos.y += player_speed;

    } //update

} //PlayerControls