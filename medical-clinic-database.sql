CREATE TABLE [Clients] (
	[client_id] int NOT NULL,
	[name] nvarchar(max) DEFAULT '255',
	[address] nvarchar(max) DEFAULT '255',
	[date_of_birth] date,
	[date_assigned] date,
	[phone_number] nvarchar(max) DEFAULT '20',
	PRIMARY KEY ([client_id])
);

CREATE TABLE [Admins] (
	[admin_id] int NOT NULL,
	[name] nvarchar(max) DEFAULT '255',
	[address] nvarchar(max) DEFAULT '255',
	[date_of_birth] date,
	[date_hired] date,
	[phone_number] nvarchar(max) DEFAULT '20',
	PRIMARY KEY ([admin_id])
);

CREATE TABLE [Doctors] (
	[doctor_id] int NOT NULL,
	[name] nvarchar(max) DEFAULT '255',
	[address] nvarchar(max) DEFAULT '255',
	[date_of_birth] date,
	[date_hired] date,
	[phone_number] nvarchar(max) DEFAULT '20',
	PRIMARY KEY ([doctor_id])
);

CREATE TABLE [ClientBase] (
	[client_id] int NOT NULL,
	[doctor_id] int NOT NULL,
	[date_assigned] date,
	PRIMARY KEY ([client_id])
);

CREATE TABLE [ChangeLog] (
	[log_id] int NOT NULL,
	[timestamp] rowversion,
	[description] nvarchar(max),
	PRIMARY KEY ([log_id])
);

CREATE TABLE [Appointments] (
	[appointment_id] int NOT NULL,
	[doctor_id] int NOT NULL,
	[client_id] int NOT NULL,
	[date_time] datetime,
	[notes] nvarchar(max),
	PRIMARY KEY ([appointment_id])
);




ALTER TABLE [ClientBase] ADD CONSTRAINT [ClientBase_fk1] FOREIGN KEY ([doctor_id]) REFERENCES [Doctors]([doctor_id]);

ALTER TABLE [Appointments] ADD CONSTRAINT [Appointments_fk1] FOREIGN KEY ([doctor_id]) REFERENCES [Doctors]([doctor_id]);

ALTER TABLE [Appointments] ADD CONSTRAINT [Appointments_fk2] FOREIGN KEY ([client_id]) REFERENCES [Clients]([client_id]);