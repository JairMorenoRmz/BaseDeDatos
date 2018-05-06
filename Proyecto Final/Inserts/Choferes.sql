USE ProyectoFinal;

INSERT INTO Choferes (idChofer, idEmpleado, SueldoHoras, Horas)
VALUES (NEWID(), '750f9376-d2e5-4a78-9db1-036aee6fcd60', '20', '8'), (NEWID(), 'fa9fbdf4-2763-4786-8eb4-13002fe95263', '20', '5'),
(NEWID(), '6a8f801e-5ac8-4a8e-9f27-236d5b76a10f', '20', '20'), (NEWID(), '5e357f4e-11d4-424e-8fdb-3f20a5736e63', '20', '10'),
(NEWID(), '4d70e7a3-fc2d-49de-9a6f-665c1ac9ce3e', '20', '15'), (NEWID(), 'c32df1fa-4579-4a47-a9ca-63c80813c4b1', '20', '8'),
(NEWID(), '8740dcd5-fe4f-4262-ac87-8236dfaf1b10', '20', '13'), (NEWID(), '8f22d104-1e9e-492f-a3c5-acad61816566', '20', '17'),
(NEWID(), '074c7b73-9840-4ae7-b5f2-fe7e360c0e6c', '20', '9'), (NEWID(), '43e90c70-ec4c-4995-9a37-ec88b2b6c6f0', '20', '11')

delete from Choferes;