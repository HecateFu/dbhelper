create schema familytree charset 'utf8mb4';

create table familytree.person (
	id int auto_increment comment '主键，自增',
    name varchar(20) not null comment '姓名',
    gender int comment '性别',
    solar_calendar_birthday date comment '阳历生日',
    lunar_calendar_birthday varchar(50) comment '阴历生日',
    age int comment '年龄',
    country int comment '所在地-国家',
    province int comment '所在地-省份',
    prefecture int comment '所在地-县',
    district int comment '所在地-乡(区)',
    detail_address varchar(100) comment '所在地-详细地址',
    phone varchar(30) comment '电话',
    zodiac int comment '星座',
    chinese_zodiac int comment '生肖',
    job varchar(30) comment '职业',
    avatar varchar(50) comment '头像',
    create_date datetime default current_timestamp comment '创建日期',
    create_by int comment '创建人,person.id',
    update_date datetime default current_timestamp on update current_timestamp comment '修改日期',
    update_by int comment '修改人,person.id',
    primary key(id),
    key idx_person(name)
) engine=InnoDB default charset = 'utf8mb4' comment='人员信息';

create table familytree.person (
	id int auto_increment comment '主键，自增',
    
    create_date datetime default current_timestamp comment '创建日期',
    create_by int comment '创建人,person.id',
    update_date datetime default current_timestamp on update current_timestamp comment '修改日期',
    update_by int comment '修改人,person.id',
    primary key(id)
) engine=InnoDB default charset = 'utf8mb4' comment='人员关系';


INSERT INTO comment_tree_paths(ancestor,descendant) 
SELECT t.ancestor,@NEW_COMMENT_ID FROM comment_tree_paths as t WHERE t.descendant = 1
UNION ALL SELECT @NEW_COMMENT_ID,@NEW_COMMENT_ID;
