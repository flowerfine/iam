create database if not exists iam default character set utf8mb4 collate utf8mb4_unicode_ci;
use iam;

/* security user */
drop table if exists sec_user;
create table sec_user
(
    id          bigint      not null auto_increment comment 'id',
    username    varchar(32) not null comment '用户名',
    password    varchar(64) not null comment '用户密码',
    salt        varchar(16) not null comment 'random salt',
    `type`      tinyint(4) comment '用户类型',
    status      varchar(4)  not null comment '用户状态',
    remark      varchar(16) comment '备注',
    creator     varchar(32) comment '创建人',
    create_time timestamp default current_timestamp comment '创建时间',
    editor      varchar(32) comment '修改人',
    update_time timestamp default current_timestamp on update current_timestamp comment '更新时间',
    primary key (id),
    key (update_time)
) engine = innodb comment = 'security-user';