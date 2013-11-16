// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
var blocks = [];
var blocksTable = [[], [], [], [], []];
var panelX = 200;
var marginX = 20;
var maxFImgIdx = 11;
var maxHImgIdx = 11;
var furnitureType = 0;
var housingType = 1;

function Block(title, imgUrl, description, id, type){
	this.title = title;
	this.imgUrl = imgUrl;
	this.description = description;
	var idx = blocks.length;
	blocks.push(this);
	this.col = idx%5;
	this.row = blocksTable[this.col].length;
	this.id = id;
	this.type = type;
	blocksTable[this.col].push(this);
}

Block.prototype.getX = function(){
	return this.col * (panelX + marginX);
};

Block.prototype.getY = function(){
	return this.row * (panelY + marginY);
};

function renderPanel(block, parent){
	// create the new div
	var newDiv = $('<div></div>');
	newDiv.addClass('thumbnail');
	newDiv.addClass('block');
	//$newDiv.css('height', 200);
	
	// feed content to the new div
	var newImg;
	var newShow;
	var newLike;
	if(block.type === housingType){
		newImg = $('<img src=' + block.imgUrl + ' ></img>');
		newShow = $('<a class="btn btn-mini btn-info block_button" href="/housings/' + block.id + '">Show </a>');
		newLike = $('<a class="btn btn-mini block_button" href="/housings/' + block.id + '">Like </a>');
	}
	else{
		newImg = $('<img src=' + block.imgUrl + '.jpg" ></img>');
		newShow = $('<a class="btn btn-mini btn-info block_button" href="/furnitures/' + block.id + '">Show </a>');
		newLike = $('<a class="btn btn-mini block_button" href="/furnitures/' + block.id + '">Like </a>');
	}
	var newHeader = $('<h4>'+block.title+'</h4>');
	var newP = $('<p>' + block.description + '</p>');
	newShow.css("left", "10px");
	newLike.css("left", "60px");
	newDiv.append(newImg);
	newDiv.append(newHeader);
	newDiv.append(newP);
	newDiv.append(newShow);
	newDiv.append(newLike);
	
	// add the panel to panels div
	parent.append( newDiv );
}

function renderThumbnail(block, parent){
	// create the new div
	var newDiv = $('<div></div>');
	newDiv.addClass('thumbnail');
	newDiv.addClass('block_square');
	
	// feed content to the new div
	var fImgIdx = (Math.floor(Math.random()*maxFImgIdx))+1;
	var hImgIdx = (Math.floor(Math.random()*maxHImgIdx))+1;
	var newImg;
	if(block.type === housingType){
		newImg = $('<img src="/assets/h' + hImgIdx + '.jpg" ></img>');
	}
	else{
		newImg = $('<img src="/assets/f' + fImgIdx + '.jpg" ></img>');
	}
	newImg.addClass('img_square');
	newDiv.append(newImg);
	
	// add the panel to panels div
	parent.append( newDiv );
}

function renderGrid(divName){
	for(var i = 0; i < blocksTable.length; i++){
		var $newPanelColumn = $('<div id="panel_column'+i+'" class="panel_column"'+'></div>');
		$newPanelColumn.css('left', (panelX+marginX) * i);
		$( "#panels" ).append( $newPanelColumn );	
	}
	
	for(var i = 0; i < blocks.length; i++){
		renderPanel(blocks[i], $( "#panel_column"+blocks[i].col));
	}
}

function renderList(divName){
	for(var i = 0; i < blocks.length; i++){
		var newLi = $('<li></li>');
		$('#panel_list').append(newLi);
		renderThumbnail(blocks[i], newLi);
	}
}
