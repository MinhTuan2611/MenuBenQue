IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Branches] (
        [BranchId] int NOT NULL IDENTITY,
        [BranchName] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Branches] PRIMARY KEY ([BranchId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Deparments] (
        [DeparmentId] int NOT NULL IDENTITY,
        [DeparmentName] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Deparments] PRIMARY KEY ([DeparmentId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Objects] (
        [ProductId] int NOT NULL IDENTITY,
        [DisplayName] nvarchar(max) NOT NULL,
        [UnitId] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Objects] PRIMARY KEY ([ProductId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Order] (
        [OrderId] int NOT NULL IDENTITY,
        [BranchId] int NOT NULL,
        [WarehouseId] int NOT NULL,
        [EstimateDeliveryDate] datetime2 NOT NULL,
        [RequestId] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Order] PRIMARY KEY ([OrderId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [OrderOperations] (
        [OrderOperationId] int NOT NULL IDENTITY,
        [OrderId] int NOT NULL,
        [OpjectId] int NOT NULL,
        [UnitId] int NOT NULL,
        [CurItemQuantity] int NOT NULL,
        [LowestEntryPrice] float NOT NULL,
        [QuantityRequest] int NOT NULL,
        [QuantityCanDeliver] int NOT NULL,
        [Note] nvarchar(max) NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_OrderOperations] PRIMARY KEY ([OrderOperationId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [RequestOperations] (
        [RequestOperationId] int NOT NULL IDENTITY,
        [RequestId] int NOT NULL,
        [OpjectId] int NOT NULL,
        [UnitId] int NOT NULL,
        [CurItemQuantity] int NOT NULL,
        [LowestEntryPrice] float NOT NULL,
        [QuantityRequest] int NOT NULL,
        [Note] nvarchar(max) NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_RequestOperations] PRIMARY KEY ([RequestOperationId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Requests] (
        [RequestId] int NOT NULL IDENTITY,
        [BranchId] int NOT NULL,
        [UserId] nvarchar(max) NOT NULL,
        [WarehouseId] int NOT NULL,
        [RequestDate] datetime2 NOT NULL,
        [EstimateDeliveryDate] datetime2 NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Requests] PRIMARY KEY ([RequestId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Suppliers] (
        [SupplierId] int NOT NULL IDENTITY,
        [SupplierName] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Suppliers] PRIMARY KEY ([SupplierId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Units] (
        [UnitId] int NOT NULL IDENTITY,
        [UnitName] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Units] PRIMARY KEY ([UnitId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [WarehouseBranches] (
        [WarehouseId] int NOT NULL IDENTITY,
        [BranchId] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_WarehouseBranches] PRIMARY KEY ([WarehouseId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    CREATE TABLE [Warehouses] (
        [WarehouseId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Warehouses] PRIMARY KEY ([WarehouseId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209063112_InnitModel')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209063112_InnitModel', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142427_removeUnitId')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RequestOperations]') AND [c].[name] = N'UnitId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [RequestOperations] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [RequestOperations] DROP COLUMN [UnitId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142427_removeUnitId')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'UnitId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [OrderOperations] DROP COLUMN [UnitId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142427_removeUnitId')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Objects]') AND [c].[name] = N'UnitId');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Objects] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Objects] DROP COLUMN [UnitId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142427_removeUnitId')
BEGIN
    ALTER TABLE [Objects] ADD [Unit] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142427_removeUnitId')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209142427_removeUnitId', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142548_removeUnitTable')
BEGIN
    DROP TABLE [Units];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209142548_removeUnitTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209142548_removeUnitTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    ALTER TABLE [Order] DROP CONSTRAINT [PK_Order];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    ALTER TABLE [Objects] DROP CONSTRAINT [PK_Objects];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    EXEC sp_rename N'[Order]', N'Orders';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    EXEC sp_rename N'[Objects]', N'Products';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    ALTER TABLE [Products] ADD [ProductCode] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    ALTER TABLE [Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209143814_addProductCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209143814_addProductCode', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209162625_updateWarehouseColumn')
BEGIN
    ALTER TABLE [Warehouses] ADD [Address] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209162625_updateWarehouseColumn')
BEGIN
    ALTER TABLE [Warehouses] ADD [Phone] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209162625_updateWarehouseColumn')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Products]') AND [c].[name] = N'Status');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Products] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Products] ALTER COLUMN [Status] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209162625_updateWarehouseColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209162625_updateWarehouseColumn', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    DROP TABLE [Warehouses];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    EXEC sp_rename N'[WarehouseBranches].[WarehouseId]', N'StorageId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    EXEC sp_rename N'[Requests].[WarehouseId]', N'StorageId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    EXEC sp_rename N'[Orders].[WarehouseId]', N'StorageId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    CREATE TABLE [Storages] (
        [StorageId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Address] nvarchar(max) NULL,
        [Phone] nvarchar(max) NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Storages] PRIMARY KEY ([StorageId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209163134_updateTableName')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209163134_updateTableName', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209170102_updateTableName2')
BEGIN
    DROP TABLE [WarehouseBranches];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209170102_updateTableName2')
BEGIN
    CREATE TABLE [StorageBranches] (
        [StorageId] int NOT NULL IDENTITY,
        [BranchId] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_StorageBranches] PRIMARY KEY ([StorageId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209170102_updateTableName2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209170102_updateTableName2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209170306_updateSupplierTable')
BEGIN
    ALTER TABLE [Suppliers] ADD [Phone] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230209170306_updateSupplierTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230209170306_updateSupplierTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210114634_UpdateStorageBranchTable')
BEGIN
    DROP TABLE [StorageBranches];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210114634_UpdateStorageBranchTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230210114634_UpdateStorageBranchTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210114823_UpdateStorageBranchTable_v1')
BEGIN
    CREATE TABLE [StorageBranches] (
        [Id] int NOT NULL IDENTITY,
        [StorageId] int NOT NULL,
        [BranchId] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_StorageBranches] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210114823_UpdateStorageBranchTable_v1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230210114823_UpdateStorageBranchTable_v1', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210173900_createFkRequestTable')
BEGIN
    CREATE INDEX [IX_Requests_BranchId] ON [Requests] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210173900_createFkRequestTable')
BEGIN
    CREATE INDEX [IX_Requests_StorageId] ON [Requests] ([StorageId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210173900_createFkRequestTable')
BEGIN
    ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Branches_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branches] ([BranchId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210173900_createFkRequestTable')
BEGIN
    ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Storages_StorageId] FOREIGN KEY ([StorageId]) REFERENCES [Storages] ([StorageId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230210173900_createFkRequestTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230210173900_createFkRequestTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211023859_updateRequestOperation')
BEGIN
    CREATE INDEX [IX_RequestOperations_RequestId] ON [RequestOperations] ([RequestId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211023859_updateRequestOperation')
BEGIN
    ALTER TABLE [RequestOperations] ADD CONSTRAINT [FK_RequestOperations_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [Requests] ([RequestId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211023859_updateRequestOperation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230211023859_updateRequestOperation', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RequestOperations]') AND [c].[name] = N'LowestEntryPrice');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [RequestOperations] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [RequestOperations] DROP COLUMN [LowestEntryPrice];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'LowestEntryPrice');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [OrderOperations] DROP COLUMN [LowestEntryPrice];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    EXEC sp_rename N'[RequestOperations].[OpjectId]', N'ProductId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    EXEC sp_rename N'[OrderOperations].[OpjectId]', N'ProductId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    ALTER TABLE [Products] ADD [LowestEntryPrice] float NOT NULL DEFAULT 0.0E0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    CREATE INDEX [IX_RequestOperations_ProductId] ON [RequestOperations] ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    ALTER TABLE [RequestOperations] ADD CONSTRAINT [FK_RequestOperations_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211025626_updateModel_v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230211025626_updateModel_v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'UserId');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Requests] ALTER COLUMN [UserId] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    ALTER TABLE [Orders] ADD [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    ALTER TABLE [Branches] ADD [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    CREATE INDEX [IX_Requests_UserId] ON [Requests] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    CREATE INDEX [IX_Orders_UserId] ON [Orders] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    CREATE INDEX [IX_Branches_UserId] ON [Branches] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    ALTER TABLE [Branches] ADD CONSTRAINT [FK_Branches_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211082633_LinkUserToOtherModels')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230211082633_LinkUserToOtherModels', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211091627_addUserBranch')
BEGIN
    CREATE TABLE [UserBranches] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [BranchId] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_UserBranches] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UserBranches_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_UserBranches_Branches_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branches] ([BranchId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211091627_addUserBranch')
BEGIN
    CREATE INDEX [IX_UserBranches_BranchId] ON [UserBranches] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211091627_addUserBranch')
BEGIN
    CREATE INDEX [IX_UserBranches_UserId] ON [UserBranches] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230211091627_addUserBranch')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230211091627_addUserBranch', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Requests] DROP CONSTRAINT [FK_Requests_AspNetUsers_UserId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'UserId');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [Requests] ALTER COLUMN [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Orders] ADD [SupplierId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Branches] ADD [ContactEmployeeName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Branches] ADD [ContactPhone] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    CREATE INDEX [IX_Orders_BranchId] ON [Orders] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    CREATE INDEX [IX_Orders_StorageId] ON [Orders] ([StorageId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    CREATE INDEX [IX_Orders_SupplierId] ON [Orders] ([SupplierId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    CREATE INDEX [IX_OrderOperations_OrderId] ON [OrderOperations] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    CREATE INDEX [IX_OrderOperations_ProductId] ON [OrderOperations] ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [OrderOperations] ADD CONSTRAINT [FK_OrderOperations_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [OrderOperations] ADD CONSTRAINT [FK_OrderOperations_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_Branches_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branches] ([BranchId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_Storages_StorageId] FOREIGN KEY ([StorageId]) REFERENCES [Storages] ([StorageId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Orders] ADD CONSTRAINT [FK_Orders_Suppliers_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Suppliers] ([SupplierId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230213180014_updateOrderTable-BranchTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230213180014_updateOrderTable-BranchTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230214160709_AddColumn-QuantityOrder')
BEGIN
    ALTER TABLE [OrderOperations] ADD [QuantityOrder] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230214160709_AddColumn-QuantityOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230214160709_AddColumn-QuantityOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230215151101_AddReceiptTable')
BEGIN
    ALTER TABLE [OrderOperations] ADD [QuantityActuallyReceived] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230215151101_AddReceiptTable')
BEGIN
    CREATE TABLE [Receipts] (
        [ReceiptId] int NOT NULL IDENTITY,
        [OrderId] int NOT NULL,
        [ReceiverName] nvarchar(max) NOT NULL,
        [ReceiverNumber] nvarchar(max) NOT NULL,
        [ManagerId] nvarchar(450) NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Receipts] PRIMARY KEY ([ReceiptId]),
        CONSTRAINT [FK_Receipts_AspNetUsers_ManagerId] FOREIGN KEY ([ManagerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Receipts_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230215151101_AddReceiptTable')
BEGIN
    CREATE INDEX [IX_Receipts_ManagerId] ON [Receipts] ([ManagerId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230215151101_AddReceiptTable')
BEGIN
    CREATE INDEX [IX_Receipts_OrderId] ON [Receipts] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230215151101_AddReceiptTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230215151101_AddReceiptTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216124311_addColumnPrice')
BEGIN
    ALTER TABLE [Receipts] ADD [ReceiptDate] datetime2 NOT NULL DEFAULT '0001-01-01T00:00:00.0000000';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216124311_addColumnPrice')
BEGIN
    ALTER TABLE [OrderOperations] ADD [Price] float NOT NULL DEFAULT 0.0E0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216124311_addColumnPrice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230216124311_addColumnPrice', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216174719_updateNullColumn')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityActuallyReceived');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityActuallyReceived] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216174719_updateNullColumn')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Price');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Price] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216174719_updateNullColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230216174719_updateNullColumn', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216183715_updateReceiverPhone')
BEGIN
    EXEC sp_rename N'[Receipts].[ReceiverNumber]', N'ReceiverPhone', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230216183715_updateReceiverPhone')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230216183715_updateReceiverPhone', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217003832_ChangeRequestStatusToEnum')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'Status');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [Requests] ALTER COLUMN [Status] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217003832_ChangeRequestStatusToEnum')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityActuallyReceived');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityActuallyReceived] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217003832_ChangeRequestStatusToEnum')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Price');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Price] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217003832_ChangeRequestStatusToEnum')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230217003832_ChangeRequestStatusToEnum', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217182307_updateEnumReceipt')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Receipts]') AND [c].[name] = N'Status');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [Receipts] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [Receipts] ALTER COLUMN [Status] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230217182307_updateEnumReceipt')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230217182307_updateEnumReceipt', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230218015731_updateEnumStatusOrder')
BEGIN
    ALTER TABLE [Receipts] ADD [DeliverName] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230218015731_updateEnumStatusOrder')
BEGIN
    ALTER TABLE [Receipts] ADD [DeliverPhone] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230218015731_updateEnumStatusOrder')
BEGIN
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'Status');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [Status] int NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230218015731_updateEnumStatusOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230218015731_updateEnumStatusOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219071846_updateEstimateDeliveryDate')
BEGIN
    ALTER TABLE [Receipts] DROP CONSTRAINT [FK_Receipts_AspNetUsers_ManagerId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219071846_updateEstimateDeliveryDate')
BEGIN
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Receipts]') AND [c].[name] = N'ManagerId');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [Receipts] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [Receipts] ALTER COLUMN [ManagerId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219071846_updateEstimateDeliveryDate')
BEGIN
    ALTER TABLE [Receipts] ADD CONSTRAINT [FK_Receipts_AspNetUsers_ManagerId] FOREIGN KEY ([ManagerId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219071846_updateEstimateDeliveryDate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230219071846_updateEstimateDeliveryDate', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219073021_updateEstimateDeliveryDate2')
BEGIN
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Requests]') AND [c].[name] = N'EstimateDeliveryDate');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [Requests] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [Requests] DROP COLUMN [EstimateDeliveryDate];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230219073021_updateEstimateDeliveryDate2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230219073021_updateEstimateDeliveryDate2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230220135813_AddNewColumnRequestOperation')
BEGIN
    ALTER TABLE [RequestOperations] ADD [isOrdered] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230220135813_AddNewColumnRequestOperation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230220135813_AddNewColumnRequestOperation', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230220204231_AddColumnToIdentityUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [FirstName] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230220204231_AddColumnToIdentityUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [LastName] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230220204231_AddColumnToIdentityUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230220204231_AddColumnToIdentityUser', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230221190342_updateEstimateDeliveryDateColumn')
BEGIN
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'EstimateDeliveryDate');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [EstimateDeliveryDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230221190342_updateEstimateDeliveryDateColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230221190342_updateEstimateDeliveryDateColumn', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230224155653_updateOrder')
BEGIN
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Orders]') AND [c].[name] = N'EstimateDeliveryDate');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [Orders] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [Orders] ALTER COLUMN [EstimateDeliveryDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230224155653_updateOrder')
BEGIN
    ALTER TABLE [Orders] ADD [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230224155653_updateOrder')
BEGIN
    ALTER TABLE [OrderOperations] ADD [Amount] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230224155653_updateOrder')
BEGIN
    ALTER TABLE [OrderOperations] ADD [Note2] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230224155653_updateOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230224155653_updateOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225073845_tableUserSupplier')
BEGIN
    CREATE TABLE [UserSuppliers] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [SupplierId] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_UserSuppliers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_UserSuppliers_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_UserSuppliers_Suppliers_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Suppliers] ([SupplierId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225073845_tableUserSupplier')
BEGIN
    CREATE INDEX [IX_UserSuppliers_SupplierId] ON [UserSuppliers] ([SupplierId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225073845_tableUserSupplier')
BEGIN
    CREATE INDEX [IX_UserSuppliers_UserId] ON [UserSuppliers] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225073845_tableUserSupplier')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230225073845_tableUserSupplier', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225095801_UpdateType')
BEGIN
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Price');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Price] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225095801_UpdateType')
BEGIN
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Amount');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Amount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225095801_UpdateType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230225095801_UpdateType', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225160603_updateTypeColumn')
BEGIN
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Products]') AND [c].[name] = N'LowestEntryPrice');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [Products] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [Products] ALTER COLUMN [LowestEntryPrice] decimal(18,2) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230225160603_updateTypeColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230225160603_updateTypeColumn', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Suppliers]') AND [c].[name] = N'Address');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [Suppliers] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [Suppliers] ALTER COLUMN [Address] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    ALTER TABLE [Suppliers] ADD [DisplayName] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    ALTER TABLE [Suppliers] ADD [SupplierCode] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    ALTER TABLE [Products] ADD [ProductTypeId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    CREATE TABLE [ProductTypes] (
        [TypeId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NULL,
        [UpdateDate] datetime2 NULL,
        CONSTRAINT [PK_ProductTypes] PRIMARY KEY ([TypeId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    CREATE TABLE [ProductTypeSuppliers] (
        [Id] int NOT NULL IDENTITY,
        [TypeId] int NOT NULL,
        [SupplierId] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        [ProductTypeTypeId] int NOT NULL,
        CONSTRAINT [PK_ProductTypeSuppliers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ProductTypeSuppliers_ProductTypes_ProductTypeTypeId] FOREIGN KEY ([ProductTypeTypeId]) REFERENCES [ProductTypes] ([TypeId]) ON DELETE CASCADE,
        CONSTRAINT [FK_ProductTypeSuppliers_Suppliers_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Suppliers] ([SupplierId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    CREATE INDEX [IX_Products_ProductTypeId] ON [Products] ([ProductTypeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    CREATE INDEX [IX_ProductTypeSuppliers_ProductTypeTypeId] ON [ProductTypeSuppliers] ([ProductTypeTypeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    CREATE INDEX [IX_ProductTypeSuppliers_SupplierId] ON [ProductTypeSuppliers] ([SupplierId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    ALTER TABLE [Products] ADD CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY ([ProductTypeId]) REFERENCES [ProductTypes] ([TypeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230227170654_updateTable_v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230227170654_updateTable_v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301144626_UpdateReceiptTable')
BEGIN
    ALTER TABLE [Receipts] ADD [InvoiceNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301144626_UpdateReceiptTable')
BEGIN
    ALTER TABLE [Receipts] ADD [Payments] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301144626_UpdateReceiptTable')
BEGIN
    ALTER TABLE [Receipts] ADD [VoucherNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230301144626_UpdateReceiptTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230301144626_UpdateReceiptTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    ALTER TABLE [Products] DROP CONSTRAINT [FK_Products_ProductTypes_ProductTypeId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    DROP TABLE [ProductTypeSuppliers];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    DROP TABLE [ProductTypes];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    DROP INDEX [IX_Products_ProductTypeId] ON [Products];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    ALTER TABLE [Requests] ADD [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230308150546_UpdateNoteColumn')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230308150546_UpdateNoteColumn', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE TABLE [QuoteOperations] (
        [Id] int NOT NULL IDENTITY,
        [QuoteId] int NOT NULL,
        [ProductId] int NOT NULL,
        [Price] decimal(18,2) NOT NULL,
        [SupplierId] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NULL,
        [CreateById] nvarchar(450) NULL,
        [UpdateById] nvarchar(450) NULL,
        CONSTRAINT [PK_QuoteOperations] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_QuoteOperations_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_QuoteOperations_AspNetUsers_UpdateById] FOREIGN KEY ([UpdateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_QuoteOperations_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE,
        CONSTRAINT [FK_QuoteOperations_Suppliers_SupplierId] FOREIGN KEY ([SupplierId]) REFERENCES [Suppliers] ([SupplierId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE TABLE [Quotes] (
        [QuoteId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [StartDate] datetime2 NOT NULL,
        [EndDate] datetime2 NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NULL,
        [CreateById] nvarchar(450) NULL,
        [UpdateById] nvarchar(450) NULL,
        CONSTRAINT [PK_Quotes] PRIMARY KEY ([QuoteId]),
        CONSTRAINT [FK_Quotes_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_Quotes_AspNetUsers_UpdateById] FOREIGN KEY ([UpdateById]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_QuoteOperations_CreateById] ON [QuoteOperations] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_QuoteOperations_ProductId] ON [QuoteOperations] ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_QuoteOperations_SupplierId] ON [QuoteOperations] ([SupplierId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_QuoteOperations_UpdateById] ON [QuoteOperations] ([UpdateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_Quotes_CreateById] ON [Quotes] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    CREATE INDEX [IX_Quotes_UpdateById] ON [Quotes] ([UpdateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230309164212_AddTableQuotes')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230309164212_AddTableQuotes', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230314180620_UpdateTableQuote')
BEGIN
    CREATE INDEX [IX_QuoteOperations_QuoteId] ON [QuoteOperations] ([QuoteId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230314180620_UpdateTableQuote')
BEGIN
    ALTER TABLE [QuoteOperations] ADD CONSTRAINT [FK_QuoteOperations_Quotes_QuoteId] FOREIGN KEY ([QuoteId]) REFERENCES [Quotes] ([QuoteId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230314180620_UpdateTableQuote')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230314180620_UpdateTableQuote', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315174536_UpdateQuoteStatus')
BEGIN
    ALTER TABLE [Quotes] ADD [status] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315174536_UpdateQuoteStatus')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230315174536_UpdateQuoteStatus', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315175303_UpdateQuoteStatus_v2')
BEGIN
    EXEC sp_rename N'[Quotes].[status]', N'Status', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315175303_UpdateQuoteStatus_v2')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Quotes]') AND [c].[name] = N'Status');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [Quotes] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [Quotes] ALTER COLUMN [Status] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315175303_UpdateQuoteStatus_v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230315175303_UpdateQuoteStatus_v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE TABLE [TransferStorages] (
        [TransferId] int NOT NULL IDENTITY,
        [ExportStorageId] int NOT NULL,
        [ReceivedStorageId] int NOT NULL,
        [TransferDate] datetime2 NOT NULL,
        [ReceivedDate] datetime2 NOT NULL,
        [Status] int NOT NULL,
        [ReceiverName] nvarchar(max) NULL,
        [ReceiverPhone] nvarchar(max) NULL,
        [DeliverName] nvarchar(max) NULL,
        [DeliverPhone] nvarchar(max) NULL,
        [Note] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NULL,
        [CreateById] nvarchar(450) NULL,
        [UpdateById] nvarchar(450) NULL,
        CONSTRAINT [PK_TransferStorages] PRIMARY KEY ([TransferId]),
        CONSTRAINT [FK_TransferStorages_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_TransferStorages_AspNetUsers_UpdateById] FOREIGN KEY ([UpdateById]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE TABLE [TransferStorageOperations] (
        [TransferOperationId] int NOT NULL IDENTITY,
        [ProductId] int NOT NULL,
        [Quantity] int NOT NULL,
        [Note] nvarchar(max) NULL,
        [TransferStorageTransferId] int NOT NULL,
        CONSTRAINT [PK_TransferStorageOperations] PRIMARY KEY ([TransferOperationId]),
        CONSTRAINT [FK_TransferStorageOperations_Products_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Products] ([ProductId]) ON DELETE CASCADE,
        CONSTRAINT [FK_TransferStorageOperations_TransferStorages_TransferStorageTransferId] FOREIGN KEY ([TransferStorageTransferId]) REFERENCES [TransferStorages] ([TransferId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE INDEX [IX_TransferStorageOperations_ProductId] ON [TransferStorageOperations] ([ProductId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE INDEX [IX_TransferStorageOperations_TransferStorageTransferId] ON [TransferStorageOperations] ([TransferStorageTransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE INDEX [IX_TransferStorages_CreateById] ON [TransferStorages] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    CREATE INDEX [IX_TransferStorages_UpdateById] ON [TransferStorages] ([UpdateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323081403_UpdateTransferStorage')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230323081403_UpdateTransferStorage', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323180159_updateTransferStorageTable')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorages]') AND [c].[name] = N'TransferDate');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorages] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [TransferStorages] ALTER COLUMN [TransferDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323180159_updateTransferStorageTable')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorages]') AND [c].[name] = N'ReceivedDate');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorages] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [TransferStorages] ALTER COLUMN [ReceivedDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323180159_updateTransferStorageTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230323180159_updateTransferStorageTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323180320_updateTransferStorageTable_2')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorages]') AND [c].[name] = N'Note');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorages] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [TransferStorages] ALTER COLUMN [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230323180320_updateTransferStorageTable_2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230323180320_updateTransferStorageTable_2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327131758_updateTransferStorageOperation')
BEGIN
    ALTER TABLE [TransferStorageOperations] DROP CONSTRAINT [FK_TransferStorageOperations_TransferStorages_TransferStorageTransferId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327131758_updateTransferStorageOperation')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorageOperations]') AND [c].[name] = N'TransferStorageTransferId');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorageOperations] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [TransferStorageOperations] ALTER COLUMN [TransferStorageTransferId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327131758_updateTransferStorageOperation')
BEGIN
    ALTER TABLE [TransferStorageOperations] ADD [QuantityActuallyReceived] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327131758_updateTransferStorageOperation')
BEGIN
    ALTER TABLE [TransferStorageOperations] ADD CONSTRAINT [FK_TransferStorageOperations_TransferStorages_TransferStorageTransferId] FOREIGN KEY ([TransferStorageTransferId]) REFERENCES [TransferStorages] ([TransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230327131758_updateTransferStorageOperation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230327131758_updateTransferStorageOperation', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230401091254_updateTaxProduct')
BEGIN
    ALTER TABLE [Products] ADD [Tax] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230401091254_updateTaxProduct')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230401091254_updateTaxProduct', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402025505_updateTaxOrderOperation')
BEGIN
    ALTER TABLE [OrderOperations] ADD [Fax] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402025505_updateTaxOrderOperation')
BEGIN
    ALTER TABLE [OrderOperations] ADD [FaxAmount] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402025505_updateTaxOrderOperation')
BEGIN
    ALTER TABLE [OrderOperations] ADD [ProductAmount] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402025505_updateTaxOrderOperation')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230402025505_updateTaxOrderOperation', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402031319_UpdateColumnType')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'ProductAmount');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [ProductAmount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402031319_UpdateColumnType')
BEGIN
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'FaxAmount');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [FaxAmount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402031319_UpdateColumnType')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230402031319_UpdateColumnType', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402032037_UpdateColumnName')
BEGIN
    EXEC sp_rename N'[OrderOperations].[FaxAmount]', N'TaxAmount', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402032037_UpdateColumnName')
BEGIN
    EXEC sp_rename N'[OrderOperations].[Fax]', N'Tax', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402032037_UpdateColumnName')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230402032037_UpdateColumnName', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402033109_UpdateColumnName_v2')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Tax');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Tax] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230402033109_UpdateColumnName_v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230402033109_UpdateColumnName_v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406021531_updateProductSalePrice')
BEGIN
    ALTER TABLE [Products] ADD [SalePrice] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406021531_updateProductSalePrice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230406021531_updateProductSalePrice', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406084244_updateQuoteNote')
BEGIN
    ALTER TABLE [QuoteOperations] ADD [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230406084244_updateQuoteNote')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230406084244_updateQuoteNote', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230417185330_addConfiguationsTable')
BEGIN
    CREATE TABLE [Configuations] (
        [Name] nvarchar(450) NOT NULL,
        [ValueString] nvarchar(max) NULL,
        [ValueInt] int NULL,
        [ValueDateTime] datetime2 NULL,
        CONSTRAINT [PK_Configuations] PRIMARY KEY ([Name])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230417185330_addConfiguationsTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230417185330_addConfiguationsTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230419154411_addReceiptNote')
BEGIN
    ALTER TABLE [Receipts] ADD [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230419154411_addReceiptNote')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230419154411_addReceiptNote', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230420144253_updateSupplierCode')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Suppliers]') AND [c].[name] = N'SupplierCode');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [Suppliers] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [Suppliers] ALTER COLUMN [SupplierCode] nvarchar(max) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230420144253_updateSupplierCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230420144253_updateSupplierCode', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422045401_addNoteNccToOrder')
BEGIN
    ALTER TABLE [Orders] ADD [NoteNcc] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422045401_addNoteNccToOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230422045401_addNoteNccToOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422053409_createTableLogOrder')
BEGIN
    CREATE TABLE [LogOrders] (
        [Id] int NOT NULL IDENTITY,
        [Orderd] int NOT NULL,
        [Status] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [CreateById] nvarchar(450) NULL,
        [OrderId] int NULL,
        CONSTRAINT [PK_LogOrders] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_LogOrders_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_LogOrders_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422053409_createTableLogOrder')
BEGIN
    CREATE INDEX [IX_LogOrders_CreateById] ON [LogOrders] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422053409_createTableLogOrder')
BEGIN
    CREATE INDEX [IX_LogOrders_OrderId] ON [LogOrders] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422053409_createTableLogOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230422053409_createTableLogOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422060632_updateLogOrder')
BEGIN
    ALTER TABLE [LogOrders] DROP CONSTRAINT [FK_LogOrders_Orders_OrderId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422060632_updateLogOrder')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogOrders]') AND [c].[name] = N'Orderd');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [LogOrders] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [LogOrders] DROP COLUMN [Orderd];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422060632_updateLogOrder')
BEGIN
    DROP INDEX [IX_LogOrders_OrderId] ON [LogOrders];
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogOrders]') AND [c].[name] = N'OrderId');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [LogOrders] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [LogOrders] ALTER COLUMN [OrderId] int NOT NULL;
    ALTER TABLE [LogOrders] ADD DEFAULT 0 FOR [OrderId];
    CREATE INDEX [IX_LogOrders_OrderId] ON [LogOrders] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422060632_updateLogOrder')
BEGIN
    ALTER TABLE [LogOrders] ADD CONSTRAINT [FK_LogOrders_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230422060632_updateLogOrder')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230422060632_updateLogOrder', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423032359_CreateLogRequest')
BEGIN
    CREATE TABLE [LogRequest] (
        [Id] int NOT NULL IDENTITY,
        [RequestId] int NOT NULL,
        [Status] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [CreateById] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_LogRequest] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_LogRequest_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_LogRequest_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [Requests] ([RequestId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423032359_CreateLogRequest')
BEGIN
    CREATE INDEX [IX_LogRequest_CreateById] ON [LogRequest] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423032359_CreateLogRequest')
BEGIN
    CREATE UNIQUE INDEX [IX_LogRequest_RequestId] ON [LogRequest] ([RequestId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423032359_CreateLogRequest')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230423032359_CreateLogRequest', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423035821_CreateLogRequest_v2')
BEGIN
    DROP INDEX [IX_LogRequest_RequestId] ON [LogRequest];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423035821_CreateLogRequest_v2')
BEGIN
    CREATE INDEX [IX_LogRequest_RequestId] ON [LogRequest] ([RequestId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423035821_CreateLogRequest_v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230423035821_CreateLogRequest_v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequest] DROP CONSTRAINT [FK_LogRequest_AspNetUsers_CreateById];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequest] DROP CONSTRAINT [FK_LogRequest_Requests_RequestId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequest] DROP CONSTRAINT [PK_LogRequest];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    EXEC sp_rename N'[LogRequest]', N'LogRequests';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    EXEC sp_rename N'[LogRequests].[IX_LogRequest_RequestId]', N'IX_LogRequests_RequestId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    EXEC sp_rename N'[LogRequests].[IX_LogRequest_CreateById]', N'IX_LogRequests_CreateById', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogRequests]') AND [c].[name] = N'CreateById');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [LogRequests] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [LogRequests] ALTER COLUMN [CreateById] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequests] ADD CONSTRAINT [PK_LogRequests] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequests] ADD CONSTRAINT [FK_LogRequests_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    ALTER TABLE [LogRequests] ADD CONSTRAINT [FK_LogRequests_Requests_RequestId] FOREIGN KEY ([RequestId]) REFERENCES [Requests] ([RequestId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230423041515_CreateLogRequest_v3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230423041515_CreateLogRequest_v3', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230428164329_CreateLogReceipt')
BEGIN
    CREATE TABLE [LogReceipts] (
        [Id] int NOT NULL IDENTITY,
        [ReceiptId] int NOT NULL,
        [Status] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [CreateById] nvarchar(450) NULL,
        CONSTRAINT [PK_LogReceipts] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_LogReceipts_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_LogReceipts_Receipts_ReceiptId] FOREIGN KEY ([ReceiptId]) REFERENCES [Receipts] ([ReceiptId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230428164329_CreateLogReceipt')
BEGIN
    CREATE INDEX [IX_LogReceipts_CreateById] ON [LogReceipts] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230428164329_CreateLogReceipt')
BEGIN
    CREATE INDEX [IX_LogReceipts_ReceiptId] ON [LogReceipts] ([ReceiptId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230428164329_CreateLogReceipt')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230428164329_CreateLogReceipt', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorageOperations]') AND [c].[name] = N'QuantityActuallyReceived');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorageOperations] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [TransferStorageOperations] ALTER COLUMN [QuantityActuallyReceived] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var36 sysname;
    SELECT @var36 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorageOperations]') AND [c].[name] = N'Quantity');
    IF @var36 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorageOperations] DROP CONSTRAINT [' + @var36 + '];');
    ALTER TABLE [TransferStorageOperations] ALTER COLUMN [Quantity] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var37 sysname;
    SELECT @var37 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RequestOperations]') AND [c].[name] = N'QuantityRequest');
    IF @var37 IS NOT NULL EXEC(N'ALTER TABLE [RequestOperations] DROP CONSTRAINT [' + @var37 + '];');
    ALTER TABLE [RequestOperations] ALTER COLUMN [QuantityRequest] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var38 sysname;
    SELECT @var38 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[RequestOperations]') AND [c].[name] = N'CurItemQuantity');
    IF @var38 IS NOT NULL EXEC(N'ALTER TABLE [RequestOperations] DROP CONSTRAINT [' + @var38 + '];');
    ALTER TABLE [RequestOperations] ALTER COLUMN [CurItemQuantity] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var39 sysname;
    SELECT @var39 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityRequest');
    IF @var39 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var39 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityRequest] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var40 sysname;
    SELECT @var40 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityOrder');
    IF @var40 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var40 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityOrder] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var41 sysname;
    SELECT @var41 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityCanDeliver');
    IF @var41 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var41 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityCanDeliver] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var42 sysname;
    SELECT @var42 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'QuantityActuallyReceived');
    IF @var42 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var42 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [QuantityActuallyReceived] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    DECLARE @var43 sysname;
    SELECT @var43 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'CurItemQuantity');
    IF @var43 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var43 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [CurItemQuantity] real NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230501175416_updateDataTypeQuantity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230501175416_updateDataTypeQuantity', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230504182759_AddTempReceiptTable')
BEGIN
    CREATE TABLE [TempReceipts] (
        [TempId] int NOT NULL IDENTITY,
        [TempName] nvarchar(max) NOT NULL,
        [Note] nvarchar(max) NULL,
        [OrderId] int NULL,
        [CreatedDate] datetime2 NOT NULL,
        [UpdatedDate] datetime2 NOT NULL,
        [CreateById] nvarchar(450) NULL,
        [UpdateById] nvarchar(450) NULL,
        CONSTRAINT [PK_TempReceipts] PRIMARY KEY ([TempId]),
        CONSTRAINT [FK_TempReceipts_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_TempReceipts_AspNetUsers_UpdateById] FOREIGN KEY ([UpdateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_TempReceipts_Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Orders] ([OrderId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230504182759_AddTempReceiptTable')
BEGIN
    CREATE INDEX [IX_TempReceipts_CreateById] ON [TempReceipts] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230504182759_AddTempReceiptTable')
BEGIN
    CREATE INDEX [IX_TempReceipts_OrderId] ON [TempReceipts] ([OrderId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230504182759_AddTempReceiptTable')
BEGIN
    CREATE INDEX [IX_TempReceipts_UpdateById] ON [TempReceipts] ([UpdateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230504182759_AddTempReceiptTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230504182759_AddTempReceiptTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    DECLARE @var44 sysname;
    SELECT @var44 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Products]') AND [c].[name] = N'SalePrice');
    IF @var44 IS NOT NULL EXEC(N'ALTER TABLE [Products] DROP CONSTRAINT [' + @var44 + '];');
    ALTER TABLE [Products] ALTER COLUMN [SalePrice] decimal(18,3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    DECLARE @var45 sysname;
    SELECT @var45 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'TaxAmount');
    IF @var45 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var45 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [TaxAmount] decimal(18,3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    DECLARE @var46 sysname;
    SELECT @var46 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'ProductAmount');
    IF @var46 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var46 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [ProductAmount] decimal(18,3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    DECLARE @var47 sysname;
    SELECT @var47 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Price');
    IF @var47 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var47 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Price] decimal(18,3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    DECLARE @var48 sysname;
    SELECT @var48 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[OrderOperations]') AND [c].[name] = N'Amount');
    IF @var48 IS NOT NULL EXEC(N'ALTER TABLE [OrderOperations] DROP CONSTRAINT [' + @var48 + '];');
    ALTER TABLE [OrderOperations] ALTER COLUMN [Amount] decimal(18,3) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230511150844_updateDecimal')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230511150844_updateDecimal', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230519202708_updateStorageBranchCode')
BEGIN
    ALTER TABLE [Storages] ADD [StorageCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230519202708_updateStorageBranchCode')
BEGIN
    ALTER TABLE [Branches] ADD [BranchCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230519202708_updateStorageBranchCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230519202708_updateStorageBranchCode', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522155041_updateReceipt')
BEGIN
    ALTER TABLE [Receipts] ADD [TiHaVoucherNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230522155041_updateReceipt')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230522155041_updateReceipt', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230527023630_updateTransfer')
BEGIN
    ALTER TABLE [TransferStorages] ADD [TiHaVoucherNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230527023630_updateTransfer')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230527023630_updateTransfer', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180222_CreateTransferLog')
BEGIN
    CREATE TABLE [LogTransferStorages] (
        [Id] int NOT NULL IDENTITY,
        [TransferId] int NOT NULL,
        [Status] int NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [CreateById] nvarchar(450) NULL,
        [TransferStorageTransferId] int NULL,
        CONSTRAINT [PK_LogTransferStorages] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_LogTransferStorages_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_LogTransferStorages_TransferStorages_TransferStorageTransferId] FOREIGN KEY ([TransferStorageTransferId]) REFERENCES [TransferStorages] ([TransferId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180222_CreateTransferLog')
BEGIN
    CREATE INDEX [IX_LogTransferStorages_CreateById] ON [LogTransferStorages] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180222_CreateTransferLog')
BEGIN
    CREATE INDEX [IX_LogTransferStorages_TransferStorageTransferId] ON [LogTransferStorages] ([TransferStorageTransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180222_CreateTransferLog')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230528180222_CreateTransferLog', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [FK_LogTransferStorages_AspNetUsers_CreateById];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [FK_LogTransferStorages_TransferStorages_TransferStorageTransferId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [PK_LogTransferStorages];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    EXEC sp_rename N'[LogTransferStorages]', N'LogTransferStorage';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    EXEC sp_rename N'[LogTransferStorage].[IX_LogTransferStorages_TransferStorageTransferId]', N'IX_LogTransferStorage_TransferStorageTransferId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    EXEC sp_rename N'[LogTransferStorage].[IX_LogTransferStorages_CreateById]', N'IX_LogTransferStorage_CreateById', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    DROP INDEX [IX_LogTransferStorage_CreateById] ON [LogTransferStorage];
    DECLARE @var49 sysname;
    SELECT @var49 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogTransferStorage]') AND [c].[name] = N'CreateById');
    IF @var49 IS NOT NULL EXEC(N'ALTER TABLE [LogTransferStorage] DROP CONSTRAINT [' + @var49 + '];');
    ALTER TABLE [LogTransferStorage] ALTER COLUMN [CreateById] nvarchar(450) NOT NULL;
    ALTER TABLE [LogTransferStorage] ADD DEFAULT N'' FOR [CreateById];
    CREATE INDEX [IX_LogTransferStorage_CreateById] ON [LogTransferStorage] ([CreateById]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorage] ADD CONSTRAINT [PK_LogTransferStorage] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorage] ADD CONSTRAINT [FK_LogTransferStorage_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    ALTER TABLE [LogTransferStorage] ADD CONSTRAINT [FK_LogTransferStorage_TransferStorages_TransferStorageTransferId] FOREIGN KEY ([TransferStorageTransferId]) REFERENCES [TransferStorages] ([TransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180743_CreateTransferLog1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230528180743_CreateTransferLog1', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorage] DROP CONSTRAINT [FK_LogTransferStorage_AspNetUsers_CreateById];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorage] DROP CONSTRAINT [FK_LogTransferStorage_TransferStorages_TransferStorageTransferId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorage] DROP CONSTRAINT [PK_LogTransferStorage];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    EXEC sp_rename N'[LogTransferStorage]', N'LogTransferStorages';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    EXEC sp_rename N'[LogTransferStorages].[IX_LogTransferStorage_TransferStorageTransferId]', N'IX_LogTransferStorages_TransferStorageTransferId', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    EXEC sp_rename N'[LogTransferStorages].[IX_LogTransferStorage_CreateById]', N'IX_LogTransferStorages_CreateById', N'INDEX';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    DECLARE @var50 sysname;
    SELECT @var50 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogTransferStorages]') AND [c].[name] = N'CreateById');
    IF @var50 IS NOT NULL EXEC(N'ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [' + @var50 + '];');
    ALTER TABLE [LogTransferStorages] ALTER COLUMN [CreateById] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorages] ADD CONSTRAINT [PK_LogTransferStorages] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorages] ADD CONSTRAINT [FK_LogTransferStorages_AspNetUsers_CreateById] FOREIGN KEY ([CreateById]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    ALTER TABLE [LogTransferStorages] ADD CONSTRAINT [FK_LogTransferStorages_TransferStorages_TransferStorageTransferId] FOREIGN KEY ([TransferStorageTransferId]) REFERENCES [TransferStorages] ([TransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528180949_CreateTransferLog2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230528180949_CreateTransferLog2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [FK_LogTransferStorages_TransferStorages_TransferStorageTransferId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    DROP INDEX [IX_LogTransferStorages_TransferStorageTransferId] ON [LogTransferStorages];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    DECLARE @var51 sysname;
    SELECT @var51 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[LogTransferStorages]') AND [c].[name] = N'TransferStorageTransferId');
    IF @var51 IS NOT NULL EXEC(N'ALTER TABLE [LogTransferStorages] DROP CONSTRAINT [' + @var51 + '];');
    ALTER TABLE [LogTransferStorages] DROP COLUMN [TransferStorageTransferId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    CREATE INDEX [IX_LogTransferStorages_TransferId] ON [LogTransferStorages] ([TransferId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    ALTER TABLE [LogTransferStorages] ADD CONSTRAINT [FK_LogTransferStorages_TransferStorages_TransferId] FOREIGN KEY ([TransferId]) REFERENCES [TransferStorages] ([TransferId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230528181317_CreateTransferLog3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230528181317_CreateTransferLog3', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531054500_userStatus')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Status] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230531054500_userStatus')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230531054500_userStatus', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230724032235_TihaJson')
BEGIN
    ALTER TABLE [Receipts] ADD [TiHaJson] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230724032235_TihaJson')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230724032235_TihaJson', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929175034_add-stored')
BEGIN
    CREATE TABLE [ReceiptViewModels] (
        [ReceiptId] int NOT NULL IDENTITY,
        [VoucherNo] nvarchar(max) NOT NULL,
        [InvoiceNo] nvarchar(max) NOT NULL,
        [BranchName] nvarchar(max) NOT NULL,
        [ReceiverName] nvarchar(max) NOT NULL,
        [ReceiptDate] datetime2 NOT NULL,
        [DisplayName] nvarchar(max) NOT NULL,
        [TotalAmount] decimal(18,2) NOT NULL,
        [Status] int NOT NULL,
        CONSTRAINT [PK_ReceiptViewModels] PRIMARY KEY ([ReceiptId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929175034_add-stored')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230929175034_add-stored', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929180839_add-stored-v2')
BEGIN
    DECLARE @var52 sysname;
    SELECT @var52 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ReceiptViewModels]') AND [c].[name] = N'VoucherNo');
    IF @var52 IS NOT NULL EXEC(N'ALTER TABLE [ReceiptViewModels] DROP CONSTRAINT [' + @var52 + '];');
    ALTER TABLE [ReceiptViewModels] ALTER COLUMN [VoucherNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929180839_add-stored-v2')
BEGIN
    DECLARE @var53 sysname;
    SELECT @var53 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ReceiptViewModels]') AND [c].[name] = N'TotalAmount');
    IF @var53 IS NOT NULL EXEC(N'ALTER TABLE [ReceiptViewModels] DROP CONSTRAINT [' + @var53 + '];');
    ALTER TABLE [ReceiptViewModels] ALTER COLUMN [TotalAmount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929180839_add-stored-v2')
BEGIN
    DECLARE @var54 sysname;
    SELECT @var54 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ReceiptViewModels]') AND [c].[name] = N'ReceiptDate');
    IF @var54 IS NOT NULL EXEC(N'ALTER TABLE [ReceiptViewModels] DROP CONSTRAINT [' + @var54 + '];');
    ALTER TABLE [ReceiptViewModels] ALTER COLUMN [ReceiptDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929180839_add-stored-v2')
BEGIN
    DECLARE @var55 sysname;
    SELECT @var55 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ReceiptViewModels]') AND [c].[name] = N'InvoiceNo');
    IF @var55 IS NOT NULL EXEC(N'ALTER TABLE [ReceiptViewModels] DROP CONSTRAINT [' + @var55 + '];');
    ALTER TABLE [ReceiptViewModels] ALTER COLUMN [InvoiceNo] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230929180839_add-stored-v2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230929180839_add-stored-v2', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230930085005_update_stored_record_count')
BEGIN
    CREATE TABLE [ReceiptTotalRecordsViewModels] (
        [TotalRecords] int NOT NULL IDENTITY,
        CONSTRAINT [PK_ReceiptTotalRecordsViewModels] PRIMARY KEY ([TotalRecords])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230930085005_update_stored_record_count')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230930085005_update_stored_record_count', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240522133832_update-minQuantity')
BEGIN
    ALTER TABLE [RequestOperations] ADD [MinQuantity] real NOT NULL DEFAULT CAST(0 AS real);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240522133832_update-minQuantity')
BEGIN
    ALTER TABLE [OrderOperations] ADD [MinQuantity] real NOT NULL DEFAULT CAST(0 AS real);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240522133832_update-minQuantity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240522133832_update-minQuantity', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240612171007_addStatusTransfer')
BEGIN
    ALTER TABLE [RequestOperations] ADD [isTransfered] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240612171007_addStatusTransfer')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240612171007_addStatusTransfer', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240616191103_Add-Column-Is-Request-To-Temp-Table')
BEGIN
    ALTER TABLE [TempReceipts] ADD [isRequest] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240616191103_Add-Column-Is-Request-To-Temp-Table')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240616191103_Add-Column-Is-Request-To-Temp-Table', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240618115738_addRefId')
BEGIN
    ALTER TABLE [Products] ADD [RefId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240618115738_addRefId')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240618115738_addRefId', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    ALTER TABLE [Products] ADD [CategoryId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    ALTER TABLE [Products] ADD [CategoryId1] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    CREATE TABLE [Category] (
        [CategoryId] int NOT NULL IDENTITY,
        [CategoryName] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NOT NULL,
        [ParentId] int NOT NULL,
        [CategoryRefCode] int NOT NULL,
        [Status] nvarchar(max) NOT NULL,
        [CreateDate] datetime2 NOT NULL,
        [UpdateDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    CREATE INDEX [IX_Products_CategoryId1] ON [Products] ([CategoryId1]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    ALTER TABLE [Products] ADD CONSTRAINT [FK_Products_Category_CategoryId1] FOREIGN KEY ([CategoryId1]) REFERENCES [Category] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708172651_AddCategory')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240708172651_AddCategory', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    ALTER TABLE [Products] DROP CONSTRAINT [FK_Products_Category_CategoryId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    DROP INDEX [IX_Products_CategoryId1] ON [Products];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    DECLARE @var56 sysname;
    SELECT @var56 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Products]') AND [c].[name] = N'CategoryId1');
    IF @var56 IS NOT NULL EXEC(N'ALTER TABLE [Products] DROP CONSTRAINT [' + @var56 + '];');
    ALTER TABLE [Products] DROP COLUMN [CategoryId1];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    DECLARE @var57 sysname;
    SELECT @var57 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Products]') AND [c].[name] = N'CategoryId');
    IF @var57 IS NOT NULL EXEC(N'ALTER TABLE [Products] DROP CONSTRAINT [' + @var57 + '];');
    ALTER TABLE [Products] ALTER COLUMN [CategoryId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    CREATE INDEX [IX_Products_CategoryId] ON [Products] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    ALTER TABLE [Products] ADD CONSTRAINT [FK_Products_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240708173814_AddCategory1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240708173814_AddCategory1', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240710190505_AddCategoryForRequest')
BEGIN
    ALTER TABLE [Requests] ADD [CategoryId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240710190505_AddCategoryForRequest')
BEGIN
    CREATE INDEX [IX_Requests_CategoryId] ON [Requests] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240710190505_AddCategoryForRequest')
BEGIN
    ALTER TABLE [Requests] ADD CONSTRAINT [FK_Requests_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240710190505_AddCategoryForRequest')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240710190505_AddCategoryForRequest', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240711180938_updateIsNull')
BEGIN
    DECLARE @var58 sysname;
    SELECT @var58 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'ParentId');
    IF @var58 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var58 + '];');
    ALTER TABLE [Category] ALTER COLUMN [ParentId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240711180938_updateIsNull')
BEGIN
    DECLARE @var59 sysname;
    SELECT @var59 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'Description');
    IF @var59 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var59 + '];');
    ALTER TABLE [Category] ALTER COLUMN [Description] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240711180938_updateIsNull')
BEGIN
    DECLARE @var60 sysname;
    SELECT @var60 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Category]') AND [c].[name] = N'CategoryRefCode');
    IF @var60 IS NOT NULL EXEC(N'ALTER TABLE [Category] DROP CONSTRAINT [' + @var60 + '];');
    ALTER TABLE [Category] ALTER COLUMN [CategoryRefCode] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240711180938_updateIsNull')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240711180938_updateIsNull', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719174811_addAmountForTransferStorage')
BEGIN
    ALTER TABLE [TransferStorageOperations] ADD [Amount] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719174811_addAmountForTransferStorage')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240719174811_addAmountForTransferStorage', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719193421_udpateTransferStorageTable')
BEGIN
    ALTER TABLE [TransferStorages] ADD [TotalAmount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719193421_udpateTransferStorageTable')
BEGIN
    ALTER TABLE [TransferStorages] ADD [TotalQuantity] real NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719193421_udpateTransferStorageTable')
BEGIN
    DECLARE @var61 sysname;
    SELECT @var61 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TransferStorageOperations]') AND [c].[name] = N'Amount');
    IF @var61 IS NOT NULL EXEC(N'ALTER TABLE [TransferStorageOperations] DROP CONSTRAINT [' + @var61 + '];');
    ALTER TABLE [TransferStorageOperations] ALTER COLUMN [Amount] decimal(18,2) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240719193421_udpateTransferStorageTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240719193421_udpateTransferStorageTable', N'6.0.32');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240728084826_linkCategoryTemp')
BEGIN
    ALTER TABLE [TempReceipts] ADD [CategoryId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240728084826_linkCategoryTemp')
BEGIN
    CREATE INDEX [IX_TempReceipts_CategoryId] ON [TempReceipts] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240728084826_linkCategoryTemp')
BEGIN
    ALTER TABLE [TempReceipts] ADD CONSTRAINT [FK_TempReceipts_Category_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240728084826_linkCategoryTemp')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240728084826_linkCategoryTemp', N'6.0.32');
END;
GO

COMMIT;
GO

