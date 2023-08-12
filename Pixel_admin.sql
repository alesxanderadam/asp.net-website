USE Pixel_Admin;

CREATE TABLE [Role] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(20),
  [description] nvarchar(200)
)
GO

CREATE TABLE [User] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [fullname] nvarchar(250),
  [email] nvarchar(250),
  [password] nvarchar(250),
  [address] nvarchar(250),
  [role_id] int,
  [avartar] nvarchar(250),	
  [created_at] datetime,
  [updated_at] datetime,
  [deleted] int
)

GO
CREATE TABLE [Blog] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(250),
  [description] ntext,
  [title] nvarchar(250),
  [image] varchar(250),
  [category_id] int,
  [user_id] int,
  [views] int default 1,
  [created_at] datetime,
  [updated_at] datetime,
)


--GO
--CREATE TABLE [Project] (
--  [id] int PRIMARY KEY IDENTITY(1, 1),
--  [name] nvarchar(250),
--  [description] ntext,
--  [created_at] datetime,
--  [updated_at] datetime
--)

CREATE TABLE [Status] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(50) NOT NULL
);

CREATE TABLE [Task] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(100) NOT NULL,
  [blog_id] int,
  [user_id] int,
  [status_id] int,
  [created_at] datetime,
  [updated_at] datetime,
  FOREIGN KEY ([blog_id]) REFERENCES [Blog]([id]) ON DELETE CASCADE,
  FOREIGN KEY ([user_id]) REFERENCES [User]([id]) ON DELETE CASCADE,
  FOREIGN KEY ([status_id]) REFERENCES [Status]([id]) ON DELETE CASCADE
);

GO
CREATE TABLE [Category] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(250),
  [created_at] datetime,
  [updated_at] datetime
)

GO
ALTER TABLE [User] ADD FOREIGN KEY ([role_id]) REFERENCES [Role] ([id])

GO
ALTER TABLE [Blog] ADD FOREIGN KEY ([user_id]) REFERENCES [User] ([id])

GO
INSERT INTO [Role] ([name], [description])
VALUES (N'Admin', N'Quản Trị Viên'), (N'User', N'Khách Hàng'), (N'Manager', N'Quản Lý'), (N'Staff', N'Nhân Viên');

INSERT INTO [User] ([fullname], [email], [password], [address], [role_id], [avartar], [created_at], [updated_at], [deleted])
VALUES (N'Le Tran Quang Huy', N'ltqhuy.th0112@gmail.com', N'1234', N'123 Main Street', 1, N'https://i.pravatar.cc/99', GETDATE(), GETDATE(), 0),
       (N'Nguyen Nhat Minh', N'jane.smith@example.com', N'1234', N'456 Elm Avenue', 1, N'https://i.pravatar.cc/1', GETDATE(), GETDATE(), 0),
       (N'Pham Gia Huy', N'mike.johnson@example.com', N'1234', N'789 Oak Road', 4, N'https://i.pravatar.cc/4', GETDATE(), GETDATE(), 0);

INSERT INTO [Project] ([name], [description], [created_at], [updated_at])
VALUES (N'Thiết Kế Web', N'Xây dựng website quảng cáo', GETDATE(), GETDATE()),
       (N'Thiết Kế Database', N'Vẽ mô hình erd và phát triển database', GETDATE(), GETDATE());

INSERT INTO [Status] ([name])
VALUES (N'Hoàn thành'),
       (N'Chưa hoàn thành');

INSERT INTO [Task] ([name], [project_id], [user_id], [status_id], [created_at], [updated_at])
VALUES (N'Front end developer', 1, 1, 1, GETDATE(), GETDATE());

SELECT
  [Task].[id],
  [Task].[name],
  [Project].[name] AS [Dự án],
  [User].[fullname] AS [Người thực hiện], -- Thêm cột tên người dùng
  [Status].[name] as [Trạng thái],
  [Task].[created_at],
  [Task].[updated_at]
FROM [Task]
INNER JOIN [Project] ON [Task].[project_id] = [Project].[id]
INNER JOIN [User] ON [Task].[user_id] = [User].[id]
INNER JOIN [Status] ON [Task].[status_id] = [Status].[id];



SELECT * FROM [User] WHERE [email] = 'ltqhuy.th0112@gmail.com' and [password] = '1234'