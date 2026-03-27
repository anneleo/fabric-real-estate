CREATE TABLE [dbo].[Dim_Federal_State] (
    [Federal State Key]     NVARCHAR (3)   NOT NULL,
    [Federal State Name]    NVARCHAR (100) NOT NULL,
    [Federal State Capital] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Federal State Key] ASC)
);


GO

