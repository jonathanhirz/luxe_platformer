package states;

import luxe.States;
import luxe.Vector;
import luxe.tilemaps.Tilemap;

import pmi.PyxelMapImporter;
import pmi.LuxeHelper;

class GameState extends State {

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {


    } //init

    override function onenter<T>( _value:T ) {

        Luxe.camera.size = new Vector(240, 160);
        Luxe.camera.center = new Vector(120, 124);

        create_tilemap();

    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update( dt:Float ) {


    } //update

    function create_tilemap() {

        // load tilemap
        var pyxelmap = new PyxelMapImporter(Luxe.resources.text('assets/map_01_outside.xml').asset.text);
        var tilemap = LuxeHelper.getTilemap('assets/tiles.png');
        var base = pyxelmap.getDatasFromLayer('base');
        var decoration = pyxelmap.getDatasFromLayer('decoration');
        var collision = pyxelmap.getDatasFromLayer('collision');
        var one_way_collision = pyxelmap.getDatasFromLayer('one_way_collision');

        LuxeHelper.fillLayer(tilemap, base);
        LuxeHelper.fillLayer(tilemap, decoration);
        LuxeHelper.fillLayer(tilemap, collision);
        LuxeHelper.fillLayer(tilemap, one_way_collision);

        tilemap.layer('collision').visible = false;
        tilemap.layer('one_way_collision').visible = false;

        tilemap.display({});

    } //create_tilemap

} //GameState