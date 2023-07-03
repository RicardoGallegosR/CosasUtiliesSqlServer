USE BDD
GO

--/*
ALTER PROC SCHEMA.spTABLE1Desactivar 
	@Id1 INT, 
	@Id2 INT
	AS
		DECLARE
		@ErrorMessage NVARCHAR(4000),
		@ErrorSeverity INT,
		@ErrorState INT,
		@Respuesta INT = 1
			/*
			Los siguientes valores son los significados de respuesta
			0 registro no encontrado
			1 Mensaje de error 
			2 Previamente DESACTIVADO
			3 REGISTRO DESACTIVADO
			*/
		IF EXISTS (
			SELECT Id1,Id2
			FROM SCHEMA.TABLE1
			WHERE Activo = 1
			AND Id1 = @Id1
			AND Id2 = @Id2
		)
			BEGIN
				BEGIN TRY
					BEGIN TRANSACTION
						UPDATE SCHEMA.TABLE1
						SET Activo = 0
						WHERE Activo = 1
						AND Id1 = @Id1
						AND Id2 = @Id2

						UPDATE SCHEMA.TABLE2
						SET Activo = 0
						WHERE Activo = 1
						AND Id1 = @Id1
					COMMIT TRANSACTION;
					SET @Respuesta = 3
				END TRY
				BEGIN CATCH
					SELECT 
						@ErrorMessage = ERROR_MESSAGE(),
						@ErrorSeverity = ERROR_SEVERITY(),
						@ErrorState = ERROR_STATE();
					RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
					ROLLBACK TRANSACTION;
				END CATCH
			END
		ELSE IF EXISTS (
			SELECT Id1,Id2
			FROM SCHEMA.TABLE1
			WHERE Activo = 0
			AND Id1 = @Id1
			AND Id2 = @Id2
		)
			BEGIN
				SET @Respuesta = 2
			END
		ELSE IF NOT EXISTS (
			SELECT Id1,Id2
			FROM SCHEMA.TABLE1
			WHERE Activo = 1
			AND Id1 = @Id1
			AND Id2 = @Id2
		)
			BEGIN
				SET @Respuesta = 0
			END
		SELECT @Respuesta AS Respuesta, 
		@ErrorMessage AS ErrorMessage, 
		@ErrorSeverity AS ErrorSeverity, 
		@ErrorState AS ErrorState
----*/
GO
DECLARE 
	@Id1 INT = 0, 
	@Id2 INT = 0;
/*
SELECT *
FROM SCHEMA.TABLE1
WHERE Id1 = @Id1
AND Id2 = @Id2
--*/
--EXEC SCHEMA.spTABLE1Desactivar  @Id1, @Id2



--/*
UPDATE SCHEMA.TABLE1
SET Activo = 1
WHERE Activo = 0
AND Id1 = @Id1
AND Id2 = @Id2

UPDATE SCHEMA.TABLE2
SET Activo = 1
WHERE Activo = 0
AND Id1 = @Id1
--*/