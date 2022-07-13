create
database if not exists iam default character set utf8mb4 collate utf8mb4_unicode_ci;
use
iam;

drop table if exists sec_org;
create table sec_org
(
    id          bigint      not null auto_increment,
    `name`      varchar(32) not null,
    `type`      varchar(4) comment 'type',
    status      varchar(4) comment 'status。0: disabled, 1: enabled',
    remark      varchar(16),
    sort        int(8) not null default 0,
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_dept;
create table sec_dept
(
    id             bigint      not null auto_increment,
    org_id         bigint      not null,
    parent_id      bigint comment 'parent dept id, null means top dept',
    `name`         varchar(32) not null,
    `type`         varchar(4) comment 'type',
    dept_id_path   varchar(256),
    dept_name_path varchar(256),
    status         varchar(4) comment 'status。0: disabled, 1: enabled',
    remark         varchar(16),
    sort           int(8) not null default 0,
    creator        varchar(32),
    create_time    datetime default current_timestamp,
    editor         varchar(32),
    update_time    datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_org_dept_relation;
create table sec_org_dept_relation
(
    id          bigint not null auto_increment,
    org_id      bigint not null,
    dept_id     bigint not null,
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_user;
create table sec_user
(
    id          bigint      not null auto_increment,
    dept_id     bigint      not null,
    username    varchar(32) not null comment 'user name',
    password    varchar(64) not null comment 'user password',
    salt        varchar(16) not null comment 'random salt',
    `type`      varchar(4) comment 'type',
    status      varchar(4)  not null comment 'status. 0: disabled, 1: enabled',
    remark      varchar(16),
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_user_dept_relation;
create table sec_user_dept_relation
(
    id          bigint not null auto_increment,
    user_id     bigint not null,
    dept_id     bigint not null,
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_role;
create table sec_role
(
    id          bigint      not null auto_increment,
    `name`      varchar(64) not null,
    `type`      varchar(4) comment 'type. 0: admin, 1: normal',
    status      varchar(4)  not null comment 'status. 0: disabled, 1: enabled',
    remark      varchar(16),
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32) comment '修改人',
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_role_user_relation;
create table sec_role_user_relation
(
    id          bigint not null auto_increment,
    role_id     bigint not null,
    user_id     bigint not null,
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_menu;
create table `sec_menu`
(
    id             bigint       not null auto_increment,
    parent_id      bigint comment 'parent menu id, null means top menu',
    `name`         varchar(64)  not null,
    `path`         varchar(256) not null,
    `type`         varchar(4) comment 'type. 0: menu, 1: page, 2: button',
    menu_id_path   varchar(256),
    menu_name_path varchar(256),
    status         varchar(4)   not null comment 'status. 0: disabled, 1: enabled',
    remark         varchar(16),
    sort           int(8) not null default 0,
    creator        varchar(32),
    create_time    datetime default current_timestamp,
    editor         varchar(32),
    update_time    datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;

drop table if exists sec_role_menu_relation;
create table sec_role_menu_relation
(
    id          bigint not null auto_increment,
    role_id     bigint not null,
    menu_id     bigint not null,
    creator     varchar(32),
    create_time datetime default current_timestamp,
    editor      varchar(32),
    update_time datetime default current_timestamp on update current_timestamp,
    primary key (id),
    key (update_time)
) engine = innodb;