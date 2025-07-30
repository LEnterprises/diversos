--tabela authors
CREATE TABLE authors (
  id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50) not null, 
  last_name VARCHAR(50) not null, 
  email VARCHAR(100) not null, 
  birthdate DATETIME not null, 
  added VARCHAR(20) not null, 
  CONSTRAINT email_unique UNIQUE (email)
) 
--popular tabela authors

declare @v_count int = 1;
declare @v_id  int = 1 ;
declare @v_fisrt_name varchar(50) ;
declare @v_last_name varchar(50);
declare @v_email varchar(100);
declare @v_birthdate datetime;
declare @v_added varchar(20) ;

begin
set @v_id = 1;
while (@v_count < 10000)
begin
set @v_fisrt_name    = 'Minion' + Cast(isnull(@v_count, '') AS varchar);
set @v_last_name  = 'Banana' + Cast(isnull(@v_count, '') AS varchar);
set @v_email      = 'Minion' + Cast(isnull(@v_count, '') AS varchar) +'@minions.com';
set @v_birthdate = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 364), '2010-01-01');
set @v_added = convert (DATETIME, '2020-09-01');

INSERT INTO AUTHORS
(ID,FIRST_NAME,last_name,email, birthdate, added)
 values(@v_id,@v_fisrt_name,@v_last_name,@v_email, @v_birthdate, @v_added);

set @v_id = @v_id +1;
set @v_count= @v_count +1;

end;

commit;
end;



--tabela posts

CREATE TABLE posts(
  id INT NOT NULL PRIMARY KEY,
 author_id int  not null  FOREIGN KEY REFERENCES authors(id), 
 title VARCHAR(255)  not null, 
 descriptionpost VARCHAR(500)  not null, 
 contentspost VARCHAR(2500)  not null, 
 datepost DATETIME  not null );
 
--popular tabela posts
 declare @v_count int = 1;
declare @v_id  int = 1 ;
declare @v_author_id  int = 1 ;
declare @v_title varchar(255) ;
declare @v_descriptionpost varchar(500);
declare @v_contentspost varchar(2500);
declare @v_datepost datetime;
declare @v_added varchar(20);

begin
set @v_id = 1;
while (@v_count < 50000)
begin
set @v_author_id = (SELECT top 1 id
    FROM AUTHORS
	order by newid()) 
;

set @v_title    = 'Minion' + Cast(isnull(@v_count, '') AS varchar) + 'talk';
set @v_descriptionpost = Cast(isnull(@v_count, '') AS varchar) +  '--' + 'Banana pewde na? bello poopaye tank yu bi-do para tu sa ia ka! tatata bala tu underwear me want banana luk at tu tulaliloo ti amo hana dul sae bapples papples gelato buttom chasy kampai muak muak muak bee do bee do bee do la boda stupa baboi bananonina po ka ' + (select substring('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus a fringilla quam. Praesent laoreet quam leo, non suscipit lacus convallis ut. Cras sapien diam, dapibus vitae nisl pharetra, pretium vehicula neque. In luctus metus vitae lorem pulvinar, a tempor orci efficitur. Ut semper purus non dolor interdum luctus. Quisque id diam diam. Curabitur molestie, erat sed tempor venenatis, risus augue egestas erat, sed dapibus lacus elit sit amet erat. Vivamus vulputate vitae ex nec iaculis. Donec consequat est nec velit tincidunt tincidunt. Duis nec justo felis. Pellentesque venenatis, ipsum et dapibus tincidunt, arcu sapien interdum felis, a tempus nisi dolor id nisi. Nulla in tincidunt justo. Ut cursus placerat ipsum, a rhoncus erat porttitor vitae. Aliquam euismod fermentum lectus, eu molestie quam molestie ut. Aenean ultrices interdum rutrum. Cras venenatis fermentum tempus. Nunc eu tellus ac purus vulputate condimentum eget vel nisi. Mauris et odio nibh. Pellentesque ut ipsum sit amet dolor vulputate molestie vel et leo. Praesent semper varius faucibus. Vivamus lobortis erat ac viverra luctus. Maecenas consequat dui sit amet leo tempus, eu cursus dolor laoreet. Nam scelerisque, turpis vulputate varius molestie, augue odio lobortis metus, tempor consequat lectus purus eget lorem. Suspendisse porttitor ullamcorper libero porttitor gravida. Morbi ornare augue ut felis euismod fermentum. Ut eleifend at diam id mollis. Nunc non dui non lectus bibendum interdum id vel tortor. Nam elit orci, consectetur in fringilla ut, porttitor a risus. Vivamus a pulvinar diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus velit massa, posuere vitae blandit eget, dapibus ac quam. Sed nec tellus nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras a leo efficitur, scelerisque mauris sit amet, blandit dolor. Curabitur quis odio at lectus aliquet euismod quis dictum augue. Nam in faucibus massa. Proin viverra, lectus id dignissim vehicula, nulla sem suscipit enim, eu sollicitudin lacus odio sit amet justo. Phasellus dolor ligula, accumsan sed suscipit ac, aliquam id risus. Nam nulla elit, aliquam vitae ante vulputate, tincidunt rutrum justo. Phasellus nec accumsan neque, quis pretium tortor. Donec elit tellus, ultrices porta feugiat nec, lacinia eu massa. Duis urna risus, semper nec fermentum ut, dignissim vel dolor. Nulla in sapien ac dui gravida tempus. Curabitur eu interdum mauris, quis efficitur elit. Fusce interdum tempus tincidunt. Phasellus ut mattis augue. Curabitur congue pharetra velit, ut ullamcorper massa scelerisque a. Sed malesuada in odio quis commodo. Aliquam a aliquam tortor. Donec a eros interdum justo cursus consequat. Phasellus pellentesque nisl vel mauris feugiat efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non nibh vel metus placerat efficitur. Etiam hendrerit ac sem at tincidunt. Suspendisse id vehicula elit, quis vulputate ligula. Cras lacinia dolor leo, vestibulum aliquam sem ultricies in. Phasellus dapibus nibh semper diam euismod fermentum. Vivamus vel est non diam iaculis aliquam. Nullam auctor leo lorem, a fermentum felis blandit ac. Donec eu pretium purus. Quisque quis nisi lacus. Integer in justo dui. Donec iaculis sed odio non placerat. In quis lacus nunc. Maecenas eget gravida leo. Quisque ac vehicula felis, varius suscipit nisl. Donec lacinia nibh vel nisi facilisis tincidunt. Praesent ante metus, auctor ut laoreet eget, hendrerit at turpis. Phasellus porta nisl vitae ipsum laoreet, nec fringilla ex ultrices. Nam placerat, lorem vitae elementum consectetur, nunc velit tempus augue, id sollicitudin elit turpis vel sem. Sed luctus sem a ante efficitur mollis. Cras sed neque quis diam mattis aliquam id quis arcu. Vestibulum dignissim ante non fermentum iaculis. Aenean sed posuere leo. Sed et euismod dolor. Aliquam dapibus rutrum ultricies. Nunc nec purus quis arcu tempor iaculis in id nulla. Fusce eu consectetur lectus. Vivamus ac dignissim libero. Donec finibus placerat tellus, in ultrices justo consequat vel. Phasellus at arcu at massa luctus lacinia at ut magna. Integer imperdiet dui at dolor gravida, vel fringilla lacus placerat. Phasellus risus augue, tincidunt ac sem nec, tempus finibus nulla. Suspendisse in diam pretium, imperdiet metus nec, maximus nisi. Phasellus luctus dictum suscipit. Vivamus purus risus, lacinia a blandit et, molestie sed nisl. Etiam non augue sem. Etiam nec sollicitudin sapien. Sed et magna tellus. Proin tempor gravida tempor. In consectetur, justo interdum varius efficitur, risus massa consectetur lorem, non congue erat elit in nulla. Sed ac porta nibh. Maecenas eros lorem, rutrum aliquam consequat sit amet, hendrerit nec nulla. Cras sed rutrum odio, in congue ligula. In volutpat quam eu nisi dictum, vel lacinia est elementum. Aliquam et tortor diam. Nulla sapien nisl, pharetra in iaculis quis, sollicitudin vel metus. Aenean vitae semper nisi, ut volutpat sem. Mauris a dapibus lectus. Suspendisse volutpat ligula ligula, quis semper velit dignissim nec. Donec tincidunt non ligula sit amet congue. Ut vulputate eros eget mi pharetra, nec dignissim felis scelerisque. Maecenas sed augue metus. Praesent auctor id eros ut tristique. Pellentesque non tortor nisi. Nullam ac tincidunt neque. Donec quis magna nec tortor pellentesque iaculis. Morbi leo nunc, bibendum vitae fermentum sed, efficitur ut sapien. Vestibulum eleifend sodales magna. Vestibulum cursus est ac eros gravida tristique. Etiam sollicitudin risus ipsum, sagittis mollis ipsum malesuada eget. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In interdum malesuada enim et interdum. Nulla in vehicula orci, id dignissim mi. Vivamus nec faucibus tellus. Suspendisse vestibulum luctus eros sed condimentum. Etiam porttitor blandit ante, et gravida odio consequat vulputate. Suspendisse hendrerit sodales vehicula. Morbi lacinia suscipit massa ac sodales. Ut at tellus in velit eleifend bibendum. ',
                 (abs(checksum(newid())) % 6088)+1, 230));

set @v_contentspost = Cast(isnull(@v_count, '') AS varchar) +  '--' + 'Banana pewde na? bello poopaye tank yu bi-do para tu sa ia ka! tatata bala tu underwear me want banana luk at tu tulaliloo ti amo hana dul sae bapples papples gelato buttom chasy kampai muak muak muak bee do bee do bee do la boda stupa baboi bananonina po ka ' + (select substring('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus a fringilla quam. Praesent laoreet quam leo, non suscipit lacus convallis ut. Cras sapien diam, dapibus vitae nisl pharetra, pretium vehicula neque. In luctus metus vitae lorem pulvinar, a tempor orci efficitur. Ut semper purus non dolor interdum luctus. Quisque id diam diam. Curabitur molestie, erat sed tempor venenatis, risus augue egestas erat, sed dapibus lacus elit sit amet erat. Vivamus vulputate vitae ex nec iaculis. Donec consequat est nec velit tincidunt tincidunt. Duis nec justo felis. Pellentesque venenatis, ipsum et dapibus tincidunt, arcu sapien interdum felis, a tempus nisi dolor id nisi. Nulla in tincidunt justo. Ut cursus placerat ipsum, a rhoncus erat porttitor vitae. Aliquam euismod fermentum lectus, eu molestie quam molestie ut. Aenean ultrices interdum rutrum. Cras venenatis fermentum tempus. Nunc eu tellus ac purus vulputate condimentum eget vel nisi. Mauris et odio nibh. Pellentesque ut ipsum sit amet dolor vulputate molestie vel et leo. Praesent semper varius faucibus. Vivamus lobortis erat ac viverra luctus. Maecenas consequat dui sit amet leo tempus, eu cursus dolor laoreet. Nam scelerisque, turpis vulputate varius molestie, augue odio lobortis metus, tempor consequat lectus purus eget lorem. Suspendisse porttitor ullamcorper libero porttitor gravida. Morbi ornare augue ut felis euismod fermentum. Ut eleifend at diam id mollis. Nunc non dui non lectus bibendum interdum id vel tortor. Nam elit orci, consectetur in fringilla ut, porttitor a risus. Vivamus a pulvinar diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus velit massa, posuere vitae blandit eget, dapibus ac quam. Sed nec tellus nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras a leo efficitur, scelerisque mauris sit amet, blandit dolor. Curabitur quis odio at lectus aliquet euismod quis dictum augue. Nam in faucibus massa. Proin viverra, lectus id dignissim vehicula, nulla sem suscipit enim, eu sollicitudin lacus odio sit amet justo. Phasellus dolor ligula, accumsan sed suscipit ac, aliquam id risus. Nam nulla elit, aliquam vitae ante vulputate, tincidunt rutrum justo. Phasellus nec accumsan neque, quis pretium tortor. Donec elit tellus, ultrices porta feugiat nec, lacinia eu massa. Duis urna risus, semper nec fermentum ut, dignissim vel dolor. Nulla in sapien ac dui gravida tempus. Curabitur eu interdum mauris, quis efficitur elit. Fusce interdum tempus tincidunt. Phasellus ut mattis augue. Curabitur congue pharetra velit, ut ullamcorper massa scelerisque a. Sed malesuada in odio quis commodo. Aliquam a aliquam tortor. Donec a eros interdum justo cursus consequat. Phasellus pellentesque nisl vel mauris feugiat efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non nibh vel metus placerat efficitur. Etiam hendrerit ac sem at tincidunt. Suspendisse id vehicula elit, quis vulputate ligula. Cras lacinia dolor leo, vestibulum aliquam sem ultricies in. Phasellus dapibus nibh semper diam euismod fermentum. Vivamus vel est non diam iaculis aliquam. Nullam auctor leo lorem, a fermentum felis blandit ac. Donec eu pretium purus. Quisque quis nisi lacus. Integer in justo dui. Donec iaculis sed odio non placerat. In quis lacus nunc. Maecenas eget gravida leo. Quisque ac vehicula felis, varius suscipit nisl. Donec lacinia nibh vel nisi facilisis tincidunt. Praesent ante metus, auctor ut laoreet eget, hendrerit at turpis. Phasellus porta nisl vitae ipsum laoreet, nec fringilla ex ultrices. Nam placerat, lorem vitae elementum consectetur, nunc velit tempus augue, id sollicitudin elit turpis vel sem. Sed luctus sem a ante efficitur mollis. Cras sed neque quis diam mattis aliquam id quis arcu. Vestibulum dignissim ante non fermentum iaculis. Aenean sed posuere leo. Sed et euismod dolor. Aliquam dapibus rutrum ultricies. Nunc nec purus quis arcu tempor iaculis in id nulla. Fusce eu consectetur lectus. Vivamus ac dignissim libero. Donec finibus placerat tellus, in ultrices justo consequat vel. Phasellus at arcu at massa luctus lacinia at ut magna. Integer imperdiet dui at dolor gravida, vel fringilla lacus placerat. Phasellus risus augue, tincidunt ac sem nec, tempus finibus nulla. Suspendisse in diam pretium, imperdiet metus nec, maximus nisi. Phasellus luctus dictum suscipit. Vivamus purus risus, lacinia a blandit et, molestie sed nisl. Etiam non augue sem. Etiam nec sollicitudin sapien. Sed et magna tellus. Proin tempor gravida tempor. In consectetur, justo interdum varius efficitur, risus massa consectetur lorem, non congue erat elit in nulla. Sed ac porta nibh. Maecenas eros lorem, rutrum aliquam consequat sit amet, hendrerit nec nulla. Cras sed rutrum odio, in congue ligula. In volutpat quam eu nisi dictum, vel lacinia est elementum. Aliquam et tortor diam. Nulla sapien nisl, pharetra in iaculis quis, sollicitudin vel metus. Aenean vitae semper nisi, ut volutpat sem. Mauris a dapibus lectus. Suspendisse volutpat ligula ligula, quis semper velit dignissim nec. Donec tincidunt non ligula sit amet congue. Ut vulputate eros eget mi pharetra, nec dignissim felis scelerisque. Maecenas sed augue metus. Praesent auctor id eros ut tristique. Pellentesque non tortor nisi. Nullam ac tincidunt neque. Donec quis magna nec tortor pellentesque iaculis. Morbi leo nunc, bibendum vitae fermentum sed, efficitur ut sapien. Vestibulum eleifend sodales magna. Vestibulum cursus est ac eros gravida tristique. Etiam sollicitudin risus ipsum, sagittis mollis ipsum malesuada eget. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In interdum malesuada enim et interdum. Nulla in vehicula orci, id dignissim mi. Vivamus nec faucibus tellus. Suspendisse vestibulum luctus eros sed condimentum. Etiam porttitor blandit ante, et gravida odio consequat vulputate. Suspendisse hendrerit sodales vehicula. Morbi lacinia suscipit massa ac sodales. Ut at tellus in velit eleifend bibendum. ',
                 (abs(checksum(newid())) % 6088)+1, 2230));
set @v_datepost = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 364), '2019-01-01');

INSERT INTO posts
(id, author_id, title, descriptionpost, contentspost, datepost)
 values(@v_id,@v_author_id,@v_title,@v_descriptionpost, @v_contentspost, @v_datepost);

set @v_id = @v_id +1;
set @v_count= @v_count +1;

end;

commit;
end;

------
--tabela rates

CREATE TABLE rates(
  id INT NOT NULL PRIMARY KEY,
 author_id int  not null  FOREIGN KEY REFERENCES authors(id), 
 post_id int  not null  FOREIGN KEY REFERENCES posts(id), 
 daterate  DATETIME  not null	,
 noterate VARCHAR(500)  not null
  );

--popular tabela rates

declare @v_count float = 1;
declare @v_id  float = 1 ;
declare @v_author_id  float = 1 ;
declare @v_posts_id  float = 1 ;
declare @v_noterate varchar(500);
declare @v_daterate  datetime;

begin
set @v_id = 1;
while (@v_count < 10000)
begin
SELECT @v_author_id = s.id_author,  @v_posts_id = s.id_post
FROM (
    SELECT top(1)  a.id as id_author, p.id as id_post
    FROM AUTHORS a
    inner join posts p
    on p.author_id = a.id
   order by newid()
    ) s
;
 
 set @v_noterate = Cast(isnull(@v_count, '') AS varchar)  +  '--' + 'Banana pewde na? bello poopaye tank yu bi-do para tu sa ia ka! tatata bala tu underwear me want banana luk at tu tulaliloo ti amo hana dul sae bapples papples gelato buttom chasy kampai muak muak muak bee do bee do bee do la boda stupa baboi bananonina po ka '  + (select substring('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus a fringilla quam. Praesent laoreet quam leo, non suscipit lacus convallis ut. Cras sapien diam, dapibus vitae nisl pharetra, pretium vehicula neque. In luctus metus vitae lorem pulvinar, a tempor orci efficitur. Ut semper purus non dolor interdum luctus. Quisque id diam diam. Curabitur molestie, erat sed tempor venenatis, risus augue egestas erat, sed dapibus lacus elit sit amet erat. Vivamus vulputate vitae ex nec iaculis. Donec consequat est nec velit tincidunt tincidunt. Duis nec justo felis. Pellentesque venenatis, ipsum et dapibus tincidunt, arcu sapien interdum felis, a tempus nisi dolor id nisi. Nulla in tincidunt justo. Ut cursus placerat ipsum, a rhoncus erat porttitor vitae. Aliquam euismod fermentum lectus, eu molestie quam molestie ut. Aenean ultrices interdum rutrum. Cras venenatis fermentum tempus. Nunc eu tellus ac purus vulputate condimentum eget vel nisi. Mauris et odio nibh. Pellentesque ut ipsum sit amet dolor vulputate molestie vel et leo. Praesent semper varius faucibus. Vivamus lobortis erat ac viverra luctus. Maecenas consequat dui sit amet leo tempus, eu cursus dolor laoreet. Nam scelerisque, turpis vulputate varius molestie, augue odio lobortis metus, tempor consequat lectus purus eget lorem. Suspendisse porttitor ullamcorper libero porttitor gravida. Morbi ornare augue ut felis euismod fermentum. Ut eleifend at diam id mollis. Nunc non dui non lectus bibendum interdum id vel tortor. Nam elit orci, consectetur in fringilla ut, porttitor a risus. Vivamus a pulvinar diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus velit massa, posuere vitae blandit eget, dapibus ac quam. Sed nec tellus nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras a leo efficitur, scelerisque mauris sit amet, blandit dolor. Curabitur quis odio at lectus aliquet euismod quis dictum augue. Nam in faucibus massa. Proin viverra, lectus id dignissim vehicula, nulla sem suscipit enim, eu sollicitudin lacus odio sit amet justo. Phasellus dolor ligula, accumsan sed suscipit ac, aliquam id risus. Nam nulla elit, aliquam vitae ante vulputate, tincidunt rutrum justo. Phasellus nec accumsan neque, quis pretium tortor. Donec elit tellus, ultrices porta feugiat nec, lacinia eu massa. Duis urna risus, semper nec fermentum ut, dignissim vel dolor. Nulla in sapien ac dui gravida tempus. Curabitur eu interdum mauris, quis efficitur elit. Fusce interdum tempus tincidunt. Phasellus ut mattis augue. Curabitur congue pharetra velit, ut ullamcorper massa scelerisque a. Sed malesuada in odio quis commodo. Aliquam a aliquam tortor. Donec a eros interdum justo cursus consequat. Phasellus pellentesque nisl vel mauris feugiat efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed non nibh vel metus placerat efficitur. Etiam hendrerit ac sem at tincidunt. Suspendisse id vehicula elit, quis vulputate ligula. Cras lacinia dolor leo, vestibulum aliquam sem ultricies in. Phasellus dapibus nibh semper diam euismod fermentum. Vivamus vel est non diam iaculis aliquam. Nullam auctor leo lorem, a fermentum felis blandit ac. Donec eu pretium purus. Quisque quis nisi lacus. Integer in justo dui. Donec iaculis sed odio non placerat. In quis lacus nunc. Maecenas eget gravida leo. Quisque ac vehicula felis, varius suscipit nisl. Donec lacinia nibh vel nisi facilisis tincidunt. Praesent ante metus, auctor ut laoreet eget, hendrerit at turpis. Phasellus porta nisl vitae ipsum laoreet, nec fringilla ex ultrices. Nam placerat, lorem vitae elementum consectetur, nunc velit tempus augue, id sollicitudin elit turpis vel sem. Sed luctus sem a ante efficitur mollis. Cras sed neque quis diam mattis aliquam id quis arcu. Vestibulum dignissim ante non fermentum iaculis. Aenean sed posuere leo. Sed et euismod dolor. Aliquam dapibus rutrum ultricies. Nunc nec purus quis arcu tempor iaculis in id nulla. Fusce eu consectetur lectus. Vivamus ac dignissim libero. Donec finibus placerat tellus, in ultrices justo consequat vel. Phasellus at arcu at massa luctus lacinia at ut magna. Integer imperdiet dui at dolor gravida, vel fringilla lacus placerat. Phasellus risus augue, tincidunt ac sem nec, tempus finibus nulla. Suspendisse in diam pretium, imperdiet metus nec, maximus nisi. Phasellus luctus dictum suscipit. Vivamus purus risus, lacinia a blandit et, molestie sed nisl. Etiam non augue sem. Etiam nec sollicitudin sapien. Sed et magna tellus. Proin tempor gravida tempor. In consectetur, justo interdum varius efficitur, risus massa consectetur lorem, non congue erat elit in nulla. Sed ac porta nibh. Maecenas eros lorem, rutrum aliquam consequat sit amet, hendrerit nec nulla. Cras sed rutrum odio, in congue ligula. In volutpat quam eu nisi dictum, vel lacinia est elementum. Aliquam et tortor diam. Nulla sapien nisl, pharetra in iaculis quis, sollicitudin vel metus. Aenean vitae semper nisi, ut volutpat sem. Mauris a dapibus lectus. Suspendisse volutpat ligula ligula, quis semper velit dignissim nec. Donec tincidunt non ligula sit amet congue. Ut vulputate eros eget mi pharetra, nec dignissim felis scelerisque. Maecenas sed augue metus. Praesent auctor id eros ut tristique. Pellentesque non tortor nisi. Nullam ac tincidunt neque. Donec quis magna nec tortor pellentesque iaculis. Morbi leo nunc, bibendum vitae fermentum sed, efficitur ut sapien. Vestibulum eleifend sodales magna. Vestibulum cursus est ac eros gravida tristique. Etiam sollicitudin risus ipsum, sagittis mollis ipsum malesuada eget. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In interdum malesuada enim et interdum. Nulla in vehicula orci, id dignissim mi. Vivamus nec faucibus tellus. Suspendisse vestibulum luctus eros sed condimentum. Etiam porttitor blandit ante, et gravida odio consequat vulputate. Suspendisse hendrerit sodales vehicula. Morbi lacinia suscipit massa ac sodales. Ut at tellus in velit eleifend bibendum. ',
                 (abs(checksum(newid())) % 6088)+1, 230));
 
set @v_daterate = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 364), '2020-01-01');

INSERT INTO rates
(id, author_id, post_id, daterate, noterate)
 values(@v_id,@v_author_id,@v_posts_id,@v_daterate, @v_noterate);

set @v_id = @v_id +1;
set @v_count= @v_count +1;

end;

commit;
end;