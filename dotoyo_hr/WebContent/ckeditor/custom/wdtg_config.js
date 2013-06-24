/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
	config.uiColor = '#FFF';
	config.skin = 'v2';
	config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;'+ config.font_names;//将中文字体加入到字体列表    

	config.toolbar = 'MyToolbar';

    config.toolbar_MyToolbar =
    [        
        ['Cut','Copy','Paste','-','Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat','-','Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
        '/',
        ['Link','Unlink','Anchor','Maximize','-','Bold','Italic','Strike','NumberedList','BulletedList','-','Outdent','Indent','Blockquote','-','TextColor','BGColor'],
        '/',
        ['Styles','Format','Font','FontSize']
    ];

	config.width = '100%';
	config.height = '200';
};
