CREATE DATABASE Pixel_Admin;
USE Pixel_Admin;

CREATE TABLE [Role] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(20),
  [description] varchar(200)
)
GO

CREATE TABLE [User] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [fullname] varchar(250),
  [email] varchar(250),
  [password] varchar(250),
  [address] varchar(250),
  [role_id] int,
  [avartar] varchar(250),	
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int
)
GO

GO
CREATE TABLE [Project] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(250),
  [description] text,
  [created_at] datetime,
  [updated_at] datetime
)
GO

CREATE TABLE [Task] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] varchar(100),
  [project_id] int,
  [user_id] int,
  [created_at] datetime,
  [updated_at] datetime,
  [status]  TINYINT
)
GO

ALTER TABLE [User] ADD FOREIGN KEY ([role_id]) REFERENCES [Role] ([id])
GO

ALTER TABLE [Task] ADD FOREIGN KEY ([project_id]) REFERENCES [Project] ([id])
GO

ALTER TABLE [Task] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])
GO

-- Thêm dữ liệu vào bảng Role
INSERT INTO [Role] ([name], [description])
VALUES ('Admin', 'Quản Trị Viên'), ('User', 'Khách Hàng'), ('Manager','Quản Lý'), ('Staff', 'Nhân Viên');

-- Thêm dữ liệu vào bảng User
INSERT INTO [User] ([fullname], [email], [password], [address], [role_id], [avartar], [created_at], [updated_at], [deleted])
VALUES ('Le Tran Quang Huy', 'ltqhuy.th0112@gmail.com', '1234', '123 Main Street', 1, 'https://i.pravatar.cc/99', GETDATE(), GETDATE(), 0),
       ('Nguyen Nhat Minh', 'jane.smith@example.com', '1234', '456 Elm Avenue', 1, 'https://i.pravatar.cc/1', GETDATE(), GETDATE(), 0),
       ('Pham Gia Huy', 'mike.johnson@example.com', '1234', '789 Oak Road', 4, 'https://i.pravatar.cc/4', GETDATE(), GETDATE(), 0);

-- Thêm dữ liệu vào bảng Project
INSERT INTO [Project] ([name], [description], [created_at], [updated_at])
VALUES ('Thiết Kế Web', 'Xây dựng website quảng cáo', GETDATE(), GETDATE()),
       ('Thiết Kế Database', 'Vẽ mô hình erd và phát triển database', GETDATE(), GETDATE());

-- Thêm dữ liệu vào bảng Task
INSERT INTO [Task] ([name], [project_id], [user_id], [created_at], [updated_at], [status])
VALUES ('Front end developer', 1, 1, GETDATE(), GETDATE(), 0);

SELECT [User].[id], [User].[fullname], [User].[email], [User].[password], [User].[address], [Role].[name] AS [role_name], [User].[avartar], [User].[created_at],[User].[updated_at], [User].[deleted] FROM [User] INNER JOIN [Role] ON [User].[role_id] = [Role].[id]


SELECT [Task].[id], [Task].[name], [User].fullname AS user_id, [Project].[name] AS project_id, [Task].[status] FROM Task INNER JOIN [User] ON Task.user_id = [User].[id] INNER JOIN Project ON Task.project_id = Project.id;

SELECT [User].id, [User].fullname, [User].email, [User].password, [User].address, Role.name as role_id, [User].avartar FROM [User] INNER JOIN Role ON [User].role_id = Role.id