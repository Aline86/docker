CREATE TABLE IF NOT EXISTS `page` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `bloc_number` INT(8) NOT NULL,
    `page_id` INT(11) DEFAULT NULL,
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",

    `slug` VARCHAR(250) NOT NULL DEFAULT "",
    `title` VARCHAR(250) NOT NULL DEFAULT "",
    `description` VARCHAR(250) NOT NULL DEFAULT "",
    `type` VARCHAR(55) NOT NULL DEFAULT "page",
    PRIMARY KEY (`id`),
    FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `picture_group` (
    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",           
    `card_number` int(8)  NOT NULL , 
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",
    `is_grid` TINYINT(1) NOT NULL DEFAULT 0,   
    `type` varchar(55)  NOT NULL default "picture_group",     
    `width` int(11)  NOT NULL default 21,
    `height` int(11)  NOT NULL default 250,
    `gap` int(11)  NOT NULL default 30,
    `text` text , 
    `bloc_number` int(11)  NOT NULL ,
    `page_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `picture_group_data` (
    `id` int(11) NOT NULL auto_increment,   
    `title` varchar(250)  NOT NULL default "",          
    `type` varchar(55)  NOT NULL default "picture_group_data",   
    `href_url` varchar(250)  NOT NULL default "",  
    `image_url` varchar(250)  NOT NULL default "",     
    `text` text ,     
    `background_color` varchar(250)  NOT NULL default "",     
    `text_color` varchar(250)  NOT NULL default "",     
    `card_number` int(11)  NOT NULL,   
    `is_data_button` TINYINT(1) default 0,  
    `picture_group_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`picture_group_id`) REFERENCES picture_group(`id`) ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS `button` (

    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",  
    `type` varchar(55)  NOT NULL default "button", 
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",
    `href_url` varchar(250)  NOT NULL default "",  
    `image_url` varchar(250)  NOT NULL default "",     
    `text` varchar(250)  NOT NULL default "",   
    `button_text` varchar(55)  NOT NULL default "",
    `is_parallaxe` TINYINT(1) NOT NULL DEFAULT 0,    
    `background_color` varchar(250)  NOT NULL default "",              

    `width` int(11)  NOT NULL default 21,
    `height` int(11)  NOT NULL default 250,
    `gap` int(11)  NOT NULL default 30,
    `bloc_number` int(11)  NOT NULL ,
    `page_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `carousel` (

    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",  
    `type` varchar(55)  NOT NULL default "carousel",  
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",           
    `carousel_type` varchar(55)  NOT NULL default "carousel",   
    `card_number` int(8)  NOT NULL , 

    `width` int(11)  NOT NULL default 21,
    `height` int(11)  NOT NULL default 25,
    `gap` int(11)  NOT NULL default 30,

    `bloc_number` int(11)  NOT NULL ,
    `page_id` int(11)  NOT NULL,
     PRIMARY KEY  (`id`),
     FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
  );
CREATE TABLE IF NOT EXISTS `carousel_data` (
    `id` int(11) NOT NULL auto_increment,   
    `title` varchar(250)  NOT NULL default "",          
    `type` varchar(55)  NOT NULL default "carousel_data",     
    `href_url` varchar(250)  NOT NULL default "",  
    `image_url` varchar(250)  NOT NULL default "",     
    `text` varchar(250)  NOT NULL default "",     
    `background_color` varchar(250)  NOT NULL default "",     
    `text_color` varchar(250)  NOT NULL default "",     
    `card_number` int(11)  NOT NULL,   
    `carousel_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`carousel_id`) REFERENCES carousel(`id`) ON DELETE CASCADE
  );

/*Table structure for table `text_picture` */

CREATE TABLE IF NOT EXISTS `text_picture` (
    `id` int(11) NOT NULL auto_increment,  
    `title` varchar(250)  NOT NULL default "", 
    `type` varchar(55)  NOT NULL default "text_picture",  
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",           
    `show_picture` TINYINT(1) default 1 ,     
    `show_text` TINYINT(1) default 1 ,  
    `bloc_column` TINYINT(1)  default 0 ,     
    `image_right` TINYINT(1) default 0 ,     
    `text_button_more` TINYINT(1) default 0 ,        
    `text` text ,     
    `image_url` varchar(250)  NOT NULL default "",     
    `alt_image` varchar(250)  NOT NULL default "",     
    `css` text ,     
    `background_color` varchar(250)  NOT NULL default "#fffffff",     
    `bloc_number` int(11)  NOT NULL,
    `page_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
);
/*Table structure for table `video` */

CREATE TABLE IF NOT EXISTS `video` (
    `id` int(11) NOT NULL auto_increment,  
    `title` varchar(250)  NOT NULL default "", 
    `type` varchar(55)  NOT NULL default "video",   
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",          
    `overlay` TINYINT(1) NOT NULL DEFAULT 0,   
    `text` text ,    
    `width` int(11)  NOT NULL default 100,
    `height` int(11)  NOT NULL default 100, 
    `image_url` text , 
    `bloc_number` int(11)  NOT NULL,
    `page_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
);
/*Table structure for table `header` */

CREATE TABLE IF NOT EXISTS `header` (
    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",
    `type` varchar(55)  NOT NULL default "header", 
    `favicon_url` varchar(250)  NOT NULL default "",
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",    
    `bloc_number` int(11)  NOT NULL,
    `logo_url` varchar(250)  NOT NULL default "",
    `image_url` varchar(250)  NOT NULL default "",
  
    `background_color` varchar(50)  NOT NULL default "",
    PRIMARY KEY  (`id`)
);
/* user */
CREATE TABLE IF NOT EXISTS `user` (
    `id` int(11) NOT NULL auto_increment,        
    `email` varchar(250)  NOT NULL default "",
    `password` varchar(250)  NOT NULL default "",       
    `token` text , 
    `connection_attempts` int(11)  NOT NULL default 0,
    PRIMARY KEY  (`id`)
);

CREATE TABLE IF NOT EXISTS `footer` (
    `id` int(11) NOT NULL auto_increment,   
    `title` varchar(250)  NOT NULL default "",
    `uuid` VARCHAR(150) NOT NULL DEFAULT "",  
    `type` varchar(55)  NOT NULL default "footer", 
    `bloc_number` int(11)  NOT NULL , 
    `map_iframe_url` text ,
    `background_color` varchar(50)  NOT NULL default "",

    PRIMARY KEY  (`id`)
);
/*Table structure for table `links_network_and_others_footer` */
CREATE TABLE IF NOT EXISTS `links_network_and_others_footer` (
    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",
    `type` varchar(55)  NOT NULL default "links_network_and_others_footer",    
    `name` varchar(250)  NOT NULL default "",     
    `image_url` varchar(250)  NOT NULL default "",
    `background_url` varchar(250)  NOT NULL default "",
    `bloc_number` int(11)  NOT NULL , 
    `footer_id` int,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`footer_id`) REFERENCES footer(`id`) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `address` (
    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",
    `type` varchar(55)  NOT NULL default "address",  
    `address` varchar(250)  NOT NULL default "",
    `town` varchar(250)  NOT NULL default "",
    `footer_id` int,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`footer_id`) REFERENCES footer(`id`) ON DELETE CASCADE

);

/*Table structure for table `link_networks_and_others_header` */

CREATE TABLE IF NOT EXISTS `link_networks_and_others_header` (
    `id` int(11) NOT NULL auto_increment,        
    `title` varchar(250)  NOT NULL default "",
    `type` varchar(55)  NOT NULL default "link_networks_and_others_header",   
    `bloc_number` int(11)  NOT NULL,
    `name` varchar(250)  NOT NULL default "",     
    `image_url` varchar(250)  NOT NULL default "",
    `background_url` varchar(250)  NOT NULL default "",

    `header_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`header_id`) REFERENCES header(`id`) ON DELETE CASCADE
);

/*Table structure for table `screen` */
CREATE TABLE IF NOT EXISTS `screen` (
    `id` int(11) NOT NULL auto_increment,  
    `title` varchar(250)  NOT NULL default "", 
    `type` varchar(55)  NOT NULL default "screen",

    `uuid` VARCHAR(150) NOT NULL DEFAULT "",             
    `overlay` TINYINT(1) NOT NULL DEFAULT 0,   
    `text` text ,    
    `image_url` text , 
    `bloc_number` int(11)  NOT NULL,
    `page_id` int(11)  NOT NULL,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (`page_id`) REFERENCES page(`id`) ON DELETE CASCADE
);

