
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/27/2021 10:45:32
-- Generated from EDMX file: C:\Users\yqfu\Resource\Programing\C#\Project\MyBusiness\Models\MyBusinessModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MyBusiness];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PurchaseContractPurchaseTarget]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseTargetSet] DROP CONSTRAINT [FK_PurchaseContractPurchaseTarget];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseContractPartner]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseContractSet] DROP CONSTRAINT [FK_PurchaseContractPartner];
GO
IF OBJECT_ID(N'[dbo].[FK_PurchaseContractPurchaseDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseDeliverySet] DROP CONSTRAINT [FK_PurchaseContractPurchaseDelivery];
GO
IF OBJECT_ID(N'[dbo].[FK_DeliveryPurchaseDelivery]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PurchaseDeliverySet] DROP CONSTRAINT [FK_DeliveryPurchaseDelivery];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[PurchaseContractSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseContractSet];
GO
IF OBJECT_ID(N'[dbo].[PartnerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartnerSet];
GO
IF OBJECT_ID(N'[dbo].[DeliverySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeliverySet];
GO
IF OBJECT_ID(N'[dbo].[PurchaseTargetSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseTargetSet];
GO
IF OBJECT_ID(N'[dbo].[PurchaseDeliverySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PurchaseDeliverySet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'PurchaseContractSet'
CREATE TABLE [dbo].[PurchaseContractSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(50)  NOT NULL,
    [SignDate] datetime  NOT NULL,
    [PartnerId] int  NOT NULL,
    [DeliveryEndDate] datetime  NULL,
    [Document1] nvarchar(256)  NULL,
    [Document2] nvarchar(256)  NULL
);
GO

-- Creating table 'PartnerSet'
CREATE TABLE [dbo].[PartnerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(40)  NOT NULL,
    [Contact] nvarchar(10)  NULL,
    [Phone] nvarchar(16)  NULL
);
GO

-- Creating table 'DeliverySet'
CREATE TABLE [dbo].[DeliverySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CarriageCode] nvarchar(20)  NOT NULL,
    [BillCode] nvarchar(20)  NULL,
    [GoodsName] nvarchar(10)  NOT NULL,
    [Quantity] real  NOT NULL,
    [Source] nvarchar(50)  NOT NULL,
    [Destination] nvarchar(50)  NOT NULL,
    [Provider] nvarchar(40)  NOT NULL,
    [LeaveDate] datetime  NOT NULL,
    [ArriveDate] datetime  NULL,
    [Receiver] nvarchar(40)  NOT NULL,
    [Picture] nvarchar(256)  NULL
);
GO

-- Creating table 'PurchaseTargetSet'
CREATE TABLE [dbo].[PurchaseTargetSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [PurchaseContractId] int  NOT NULL,
    [Quantity] real  NOT NULL,
    [Price] real  NOT NULL,
    [Quality] nvarchar(800)  NOT NULL,
    [DeliveryWay] nvarchar(10)  NOT NULL,
    [Place] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'PurchaseDeliverySet'
CREATE TABLE [dbo].[PurchaseDeliverySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantity] real  NOT NULL,
    [PurchaseContractId] int  NOT NULL,
    [DeliveryId] int  NOT NULL,
    [ReceiveQuantity] real  NULL
);
GO

-- Creating table 'PartnerDocuments'
CREATE TABLE [dbo].[PartnerDocuments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PartnerId] int  NOT NULL,
    [PathName] nvarchar(256)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'PurchaseContractSet'
ALTER TABLE [dbo].[PurchaseContractSet]
ADD CONSTRAINT [PK_PurchaseContractSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PartnerSet'
ALTER TABLE [dbo].[PartnerSet]
ADD CONSTRAINT [PK_PartnerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DeliverySet'
ALTER TABLE [dbo].[DeliverySet]
ADD CONSTRAINT [PK_DeliverySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [PurchaseContractId] in table 'PurchaseTargetSet'
ALTER TABLE [dbo].[PurchaseTargetSet]
ADD CONSTRAINT [PK_PurchaseTargetSet]
    PRIMARY KEY CLUSTERED ([Id], [PurchaseContractId] ASC);
GO

-- Creating primary key on [Id] in table 'PurchaseDeliverySet'
ALTER TABLE [dbo].[PurchaseDeliverySet]
ADD CONSTRAINT [PK_PurchaseDeliverySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [PartnerId] in table 'PartnerDocuments'
ALTER TABLE [dbo].[PartnerDocuments]
ADD CONSTRAINT [PK_PartnerDocuments]
    PRIMARY KEY CLUSTERED ([Id], [PartnerId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PurchaseContractId] in table 'PurchaseTargetSet'
ALTER TABLE [dbo].[PurchaseTargetSet]
ADD CONSTRAINT [FK_PurchaseContractPurchaseTarget]
    FOREIGN KEY ([PurchaseContractId])
    REFERENCES [dbo].[PurchaseContractSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseContractPurchaseTarget'
CREATE INDEX [IX_FK_PurchaseContractPurchaseTarget]
ON [dbo].[PurchaseTargetSet]
    ([PurchaseContractId]);
GO

-- Creating foreign key on [PartnerId] in table 'PurchaseContractSet'
ALTER TABLE [dbo].[PurchaseContractSet]
ADD CONSTRAINT [FK_PurchaseContractPartner]
    FOREIGN KEY ([PartnerId])
    REFERENCES [dbo].[PartnerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseContractPartner'
CREATE INDEX [IX_FK_PurchaseContractPartner]
ON [dbo].[PurchaseContractSet]
    ([PartnerId]);
GO

-- Creating foreign key on [PurchaseContractId] in table 'PurchaseDeliverySet'
ALTER TABLE [dbo].[PurchaseDeliverySet]
ADD CONSTRAINT [FK_PurchaseContractPurchaseDelivery]
    FOREIGN KEY ([PurchaseContractId])
    REFERENCES [dbo].[PurchaseContractSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseContractPurchaseDelivery'
CREATE INDEX [IX_FK_PurchaseContractPurchaseDelivery]
ON [dbo].[PurchaseDeliverySet]
    ([PurchaseContractId]);
GO

-- Creating foreign key on [DeliveryId] in table 'PurchaseDeliverySet'
ALTER TABLE [dbo].[PurchaseDeliverySet]
ADD CONSTRAINT [FK_DeliveryPurchaseDelivery]
    FOREIGN KEY ([DeliveryId])
    REFERENCES [dbo].[DeliverySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DeliveryPurchaseDelivery'
CREATE INDEX [IX_FK_DeliveryPurchaseDelivery]
ON [dbo].[PurchaseDeliverySet]
    ([DeliveryId]);
GO

-- Creating foreign key on [PartnerId] in table 'PartnerDocuments'
ALTER TABLE [dbo].[PartnerDocuments]
ADD CONSTRAINT [FK_PartnerPartnerDocument]
    FOREIGN KEY ([PartnerId])
    REFERENCES [dbo].[PartnerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartnerPartnerDocument'
CREATE INDEX [IX_FK_PartnerPartnerDocument]
ON [dbo].[PartnerDocuments]
    ([PartnerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------