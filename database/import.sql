-- 如果数据库 file 不存在，则创建它
CREATE DATABASE IF NOT EXISTS file;

-- 切换到 file 数据库
USE file;

-- 创建 user 表（如果不存在）
CREATE TABLE IF NOT EXISTS `user` (
    `userId` INT PRIMARY KEY,
    `username` VARCHAR(255),
    `telephone` VARCHAR(255),
    `salt` VARCHAR(255),
    `password` VARCHAR(255),
    `available` INT
);

-- 创建 role 表（如果不存在）
CREATE TABLE IF NOT EXISTS `role` (
    `roleId` INT PRIMARY KEY,
    `available` INT,
    `description` VARCHAR(255),
    `roleName` VARCHAR(255),
    `createTime` DATETIME,
    `createUserId` INT,
    `modifyTime` DATETIME,
    `modifyUserId` INT
);

-- 创建 sysparam 表（如果不存在）
CREATE TABLE IF NOT EXISTS `sysparam` (
    `sysParamId` INT PRIMARY KEY,
    `sysParamKey` VARCHAR(255),
    `sysParamValue` VARCHAR(255),
    `sysParamDesc` VARCHAR(255)
);

-- 创建 filetype 表（如果不存在）
CREATE TABLE IF NOT EXISTS `filetype` (
    `fileTypeId` INT PRIMARY KEY,
    `fileTypeName` VARCHAR(255)
);

-- 创建 fileextend 表（如果不存在）
CREATE TABLE IF NOT EXISTS `fileextend` (
    `fileExtendId` INT AUTO_INCREMENT PRIMARY KEY,
    `fileExtendName` VARCHAR(255)
);

-- 创建 fileclassification 表（如果不存在）
CREATE TABLE IF NOT EXISTS `fileclassification` (
    `fileClassificationId` INT PRIMARY KEY,
    `fileTypeId` INT,
    `fileExtendName` VARCHAR(255),
    FOREIGN KEY (`fileTypeId`) REFERENCES `filetype`(`fileTypeId`)
);

-- 删除现有数据
DELETE FROM user WHERE userId = 1;
INSERT INTO user (userId, username, telephone, salt, password, available) 
VALUES (1, 'admin', 'admin', 'admin', 'df655ad8d3229f3269fad2a8bab59b6c', 1);

DELETE FROM role WHERE roleId IN (1, 2);
INSERT INTO role (roleId, available, description, roleName, createTime, createUserId, modifyTime, modifyUserId) 
VALUES (1, 1, '超级管理员', '超级管理员', NULL, NULL, '2021-11-10 20:46:06', NULL);
INSERT INTO role (roleId, available, description, roleName, createTime, createUserId, modifyTime, modifyUserId) 
VALUES (2, 1, '普通用户', '普通用户', NULL, NULL, NULL, NULL);

DELETE FROM sysparam WHERE sysParamId IN (1, 2, 3);
INSERT INTO sysparam (sysParamId, sysParamKey, sysParamValue, sysParamDesc) 
VALUES (1, 'totalStorageSize', '1024', '总存储大小（单位M）');
INSERT INTO sysparam (sysParamId, sysParamKey, sysParamValue, sysParamDesc) 
VALUES (2, 'initDataFlag', '1', '系统初始化数据标识');
INSERT INTO sysparam (sysParamId, sysParamKey, sysParamValue, sysParamDesc) 
VALUES (3, 'version', '1.1.2', '当前脚本的版本号');

DELETE FROM filetype WHERE fileTypeId IN (0, 1, 2, 3, 4, 5);
INSERT INTO filetype (fileTypeId, fileTypeName) 
VALUES (0, '全部'), (1, '图片'), (2, '文档'), (3, '视频'), (4, '音乐'), (5, '其他');

DELETE FROM fileextend WHERE 1 = 1;
INSERT INTO fileextend (fileExtendName) 
VALUES 
    ('bmp'), ('jpg'), ('png'), ('tif'), ('gif'), ('jpeg'),
    ('doc'), ('docx'), ('docm'), ('dot'), ('dotx'), ('dotm'),
    ('odt'), ('fodt'), ('ott'), ('rtf'), ('txt'), ('html'),
    ('htm'), ('mht'), ('xml'), ('pdf'), ('djvu'), ('fb2'),
    ('epub'), ('xps'), ('xls'), ('xlsx'), ('xlsm'), ('xlt'),
    ('xltx'), ('xltm'), ('ods'), ('fods'), ('ots'), ('csv'),
    ('pps'), ('ppsx'), ('ppsm'), ('ppt'), ('pptx'), ('pptm'),
    ('pot'), ('potx'), ('potm'), ('odp'), ('fodp'), ('otp'),
    ('hlp'), ('wps'), ('avi'), ('mp4'), ('mpg'), ('mov'), 
    ('swf'), ('wav'), ('aif'), ('au'), ('mp3'), ('ram'), 
    ('wma'), ('mmf'), ('amr'), ('aac'), ('flac'), ('java'), 
    ('js'), ('css'), ('json');

DELETE FROM fileclassification WHERE 1 = 1;
INSERT INTO fileclassification (fileClassificationId, fileTypeId, fileExtendName) 
VALUES
    (1, 1, 'bmp'), (2, 1, 'jpg'), (3, 1, 'png'), (4, 1, 'tif'), 
    (5, 1, 'gif'), (6, 1, 'jpeg'), (7, 2, 'doc'), (8, 2, 'docx'), 
    (9, 2, 'docm'), (10, 2, 'dot'), (11, 2, 'dotx'), (12, 2, 'dotm'), 
    (13, 2, 'odt'), (14, 2, 'fodt'), (15, 2, 'ott'), (16, 2, 'rtf'), 
    (17, 2, 'txt'), (18, 2, 'html'), (19, 2, 'htm'), (20, 2, 'mht'), 
    (21, 2, 'xml'), (22, 2, 'pdf'), (23, 2, 'djvu'), (24, 2, 'fb2'), 
    (25, 2, 'epub'), (26, 2, 'xps'), (27, 2, 'xls'), (28, 2, 'xlsx'), 
    (29, 2, 'xlsm'), (30, 2, 'xlt'), (31, 2, 'xltx'), (32, 2, 'xltm'), 
    (33, 2, 'ods'), (34, 2, 'fods'), (35, 2, 'ots'), (36, 2, 'csv'), 
    (37, 2, 'pps'), (38, 2, 'ppsx'), (39, 2, 'ppsm'), (40, 2, 'ppt'), 
    (41, 2, 'pptx'), (42, 2, 'pptm'), (43, 2, 'pot'), (44, 2, 'potx'), 
    (45, 2, 'potm'), (46, 2, 'odp'), (47, 2, 'fodp'), (48, 2, 'otp'), 
    (49, 2, 'hlp'), (50, 2, 'wps'), (51, 2, 'java'), (52, 2, 'js'), 
    (53, 2, 'css'), (54, 2, 'json'), (55, 3, 'avi'), (56, 3, 'mp4'), 
    (57, 3, 'mpg'), (58, 3, 'mov'), (59, 3, 'swf'), (60, 4, 'wav'), 
    (61, 4, 'aif'), (62, 4, 'au'), (63, 4, 'mp3'), (64, 4, 'ram'), 
    (65, 4, 'wma'), (66, 4, 'mmf'), (67, 4, 'amr'), (68, 4, 'aac'), 
    (69, 4, 'flac'), (70, 2, 'md'), (71, 2, 'markdown');
