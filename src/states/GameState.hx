package states;

import luxe.States;
import luxe.Vector;
import luxe.Color;
import luxe.Sprite;
import luxe.tilemaps.Tilemap;

import pmi.PyxelMapImporter;
import pmi.LuxeHelper;

import component.PlayerControls;

class GameState extends State {

    var player : Sprite;
    var tilemap : Tilemap;
    var map_scale : Int = 1;

    public function new( _name:String ) {
        super({ name:_name });
    } //new

    override function init() {


    } //init

    override function onenter<T>( _value:T ) {

        Luxe.camera.size = new Vector(240, 160);
        Luxe.camera.center = new Vector(120, 124);

        create_tilemap();
        create_player();
        create_bounds();
        create_oneway_bounds();

    } //onenter

    override function onleave<T>( _value:T ) {


    } //onleave

    override function update( dt:Float ) {

        Luxe.camera.center.weighted_average_xy(player.pos.x, player.pos.y, 5);

    } //update

    function create_tilemap() {

        // load tilemap
        var pyxelmap = new PyxelMapImporter(Luxe.resources.text('assets/map_01_outside.xml').asset.text);
        tilemap = LuxeHelper.getTilemap('assets/tiles.png');
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

    function create_player() {

        player = new Sprite({
            size : new Vector(16, 16),
            color : new Color().rgb(0x430f7c),
            pos : new Vector(32, 32),
            depth : 1
        });

        player.add(new PlayerControls());

    } //create_player

    function create_bounds() {

        var bounds = tilemap.layer('collision').bounds_fitted();
        for(bound in bounds) {
            bound.x *= tilemap.tile_width * map_scale;
            bound.y *= tilemap.tile_height * map_scale;
            bound.w *= tilemap.tile_width * map_scale;
            bound.h *= tilemap.tile_height * map_scale;
        }

    } //create_bounds

    function create_oneway_bounds() {


    } //create_oneway_bounds

} //GameState
