package component;

import luxe.Component;
import luxe.Entity;

class PlayerControls extends Component {

    var player : Entity;

    override function init() {

        player = cast entity;

    } //init

    override function update( dt:Float ) {

        if(Luxe.input.inputdown("left")) player.pos.x -= 2;
        if(Luxe.input.inputdown("right")) player.pos.x += 2;
        if(Luxe.input.inputdown("up")) player.pos.y -= 2;
        if(Luxe.input.inputdown("down")) player.pos.y += 2;

    } //update

} //PlayerControls