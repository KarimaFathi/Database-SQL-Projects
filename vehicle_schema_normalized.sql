USE [CarData]
GO
/****** Object:  Table [dbo].[Bodies]    Script Date: 12/25/2025 12:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodies](
	[BodyID] [int] IDENTITY(1,1) NOT NULL,
	[BodyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bodies] PRIMARY KEY CLUSTERED 
(
	[BodyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriveTypes]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriveTypes](
	[DriveTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DriveTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_DriveTypes] PRIMARY KEY CLUSTERED 
(
	[DriveTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelTypes]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelTypes](
	[FuelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FuelTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_FuelTypes] PRIMARY KEY CLUSTERED 
(
	[FuelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MakeModels]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MakeModels](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[MakeID] [int] NULL,
	[ModelName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MakeModels] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makes]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makes](
	[MakeID] [int] IDENTITY(1,1) NOT NULL,
	[MakeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Makes] PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubModels]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubModels](
	[SubModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NULL,
	[SubModelName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubModels] PRIMARY KEY CLUSTERED 
(
	[SubModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehiculeDetails]    Script Date: 12/25/2025 12:48:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehiculeDetails](
	[id] [smallint] NOT NULL,
	[modelID] [int] NULL,
	[subModelID] [int] NULL,
	[bodyID] [int] NULL,
	[Vehicule_Display_Name] [nvarchar](50) NULL,
	[DriveTypeID] [int] NULL,
	[Engine] [nvarchar](50) NULL,
	[Engine_CC] [smallint] NULL,
	[Engine_Cylinders] [tinyint] NULL,
	[Engine_liter_Display] [money] NULL,
	[FuelTypeID] [int] NULL,
	[makeID] [int] NULL,
	[NumDoors] [tinyint] NULL,
	[year] [smallint] NULL,
 CONSTRAINT [PK_VehiculeDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_Bodies] FOREIGN KEY([bodyID])
REFERENCES [dbo].[Bodies] ([BodyID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_Bodies]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_DriveTypes] FOREIGN KEY([DriveTypeID])
REFERENCES [dbo].[DriveTypes] ([DriveTypeID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_DriveTypes]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_FuelTypes] FOREIGN KEY([FuelTypeID])
REFERENCES [dbo].[FuelTypes] ([FuelTypeID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_FuelTypes]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_MakeModels] FOREIGN KEY([modelID])
REFERENCES [dbo].[MakeModels] ([ModelID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_MakeModels]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_Makes] FOREIGN KEY([makeID])
REFERENCES [dbo].[Makes] ([MakeID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_Makes]
GO
ALTER TABLE [dbo].[VehiculeDetails]  WITH CHECK ADD  CONSTRAINT [FK_VehiculeDetails_SubModels] FOREIGN KEY([subModelID])
REFERENCES [dbo].[SubModels] ([SubModelID])
GO
ALTER TABLE [dbo].[VehiculeDetails] CHECK CONSTRAINT [FK_VehiculeDetails_SubModels]
GO
