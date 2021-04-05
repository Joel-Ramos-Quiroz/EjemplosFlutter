USE [BDAPPOPERATIONS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[pa_cons_programacion_labores](
@fecha1 date,@fecha2 date,@estado varchar(1),@ubicacion varchar(20)
)
as
begin

DECLARE @dml AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
DECLARE @f1 as varchar
DECLARE @f2 as varchar

SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(fecha)
FROM (SELECT distinct convert(date, FECHA, 1) AS fecha
         FROM [tbprogramacion_labores] where estado=@estado and ubicacion=CASE WHEN @ubicacion='TODOS' then ubicacion else @ubicacion end and CAST(fecha AS DATE) between CAST(@fecha1 AS DATE) and CAST(@fecha2 AS DATE)) AS fecha

SET @f1=CAST(@fecha1 AS DATE)
SET @f2=CAST(@fecha2 AS DATE)
SET @dml = 
  N'SELECT * FROM 
(
SELECT p.estado,f.CodFundo,p.codact,p.codlab,p.codcult,p.ubicacion,f.descripcion as fundo,c.descripcion as cultivo,a.descripcion as actividad,l.descripcion as labor ,CAST(p.fecha AS DATE) as SalesYear,
        case when p.cantidad is null then 0 else p.cantidad end as TotalSales
FROM tbprogramacion_labores p 
inner join tbfundo f on p.codfundo=f.CodFundo
inner join tbactividad_rrhh a on p.codact=a.codact
inner join tblabor_rrhh l on p.codlab=l.codlab
inner join [tbcultivo] c on p.codcult=c.codcult
inner join [tblabor] c on c.cod=l.cod
inner join tbpersona pp on pp.codigo=ppp.cod
where p.estado='''+ @estado+''' and p.ubicacion=CASE WHEN '''+ @ubicacion+'''=''TODOS'' then p.ubicacion else '''+ @ubicacion+''' end  --and CAST(p.fecha AS DATE) between '''+@f1+''' and '''+@f2+'''
) AS Sales
PIVOT (SUM(TotalSales)
FOR SalesYear IN (' + @ColumnName + '))
as PVT';
EXEC sp_executesql @dml;
end
