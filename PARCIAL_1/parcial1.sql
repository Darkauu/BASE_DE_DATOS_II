-- Modulo de autenticación
CREATE DATABASE securityPlatform;
USE securityPlatform;

CREATE TABLE usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre_usuario VARCHAR(255) NOT NULL UNIQUE,
    token_usuario INT NOT NULL,
    constrasena VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255) NOT NULL,
    sexo ENUM('Masculino',  'Femenino') NOT NULL,
    estado_civil ENUM('Soltero', 'Casado') NOT NULL,
    tipo_de_empresa ENUM('Publica', 'Privada') NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('Cliente', 'Administrador', 'Vendedor', 'Ejecutivo', 'Otro') NOT NULL
);

CREATE TABLE dispositivo (
	id_dispositivo INT PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT NOT NULL,
    nombre_dispositivo VARCHAR(255),
    sistema_operativo VARCHAR(255),

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE autenticacion (
	id_autenticacion INT PRIMARY KEY AUTO_INCREMENT,
    id_dispositivo INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    constrasena VARCHAR(255) NOT NULL,
    nombre_dispositivo VARCHAR(255) NOT NULL,
	token INT NOT NULL,

    FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo)
);

CREATE TABLE prueba (
	id_prueba INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    referencia VARCHAR(255) NOT NULL UNIQUE,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado ENUM('Activo', 'Desactivado') DEFAULT 'Activo',

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE metodo_pago (
	id_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    numero_de_tarjeta VARCHAR(255) NOT NULL,
	cvc INT NOT NULL,
    tipo_de_tarjeta VARCHAR(255) NOT NULL,
    fecha_de_expiracion DATE,
    tarjeta_principal BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- INSERSERCIONES

INSERT INTO usuarios (nombre, apellido, nombre_usuario, token_usuario, constrasena, ciudad, sexo, estado_civil, tipo_de_empresa, direccion, tipo_usuario) VALUES
('Juan', 'Perez', 'juan.perez', 12345, 'clave123', 'Ciudad de Panama', 'Masculino', 'Soltero', 'Privada', 'Calle 1, Casa 10', 'Cliente'),
('Maria', 'Gomez', 'maria.gomez', 54321, 'clave456', 'Colon', 'Femenino', 'Casado', 'Publica', 'Avenida Central, Edificio B', 'Administrador'),
('Carlos', 'Rodriguez', 'carlos.r', 67890, 'clave789', 'David', 'Masculino', 'Soltero', 'Privada', 'Barriada San Jose, Lote 5', 'Vendedor'),
('Ana', 'Martinez', 'ana.martinez', 98765, 'clave101', 'Santiago', 'Femenino', 'Soltero', 'Privada', 'Calle 5, Apartamento 3', 'Ejecutivo'),
('Luis', 'Hernandez', 'luis.h', 11223, 'clave202', 'Chitre', 'Masculino', 'Casado', 'Publica', 'Urbanizacion El Sol, #15', 'Cliente'),
('Sofia', 'Lopez', 'sofia.lopez', 33445, 'clave303', 'Penonome', 'Femenino', 'Soltero', 'Privada', 'Via Principal, Casa 22', 'Cliente'),
('Jorge', 'Diaz', 'jorge.diaz', 55667, 'clave404', 'Las Tablas', 'Masculino', 'Casado', 'Privada', 'Calle del Rio, #8', 'Vendedor'),
('Laura', 'Sanchez', 'laura.s', 77889, 'clave505', 'Ciudad de Panama', 'Femenino', 'Soltero', 'Publica', 'Avenida Balboa, PH Waters', 'Otro'),
('Diego', 'Torres', 'diego.torres', 99001, 'clave606', 'David', 'Masculino', 'Soltero', 'Privada', 'Calle F, #12', 'Cliente'),
('Camila', 'Ramirez', 'camila.r', 12121, 'clave707', 'Colon', 'Femenino', 'Casado', 'Publica', 'Zona Libre, Local 30', 'Ejecutivo'),
('Andres', 'Flores', 'andres.f', 34343, 'clave808', 'Santiago', 'Masculino', 'Soltero', 'Privada', 'Barrio Sur, Casa 1', 'Cliente'),
('Valentina', 'Acosta', 'valentina.a', 56565, 'clave909', 'Chitre', 'Femenino', 'Soltero', 'Publica', 'Avenida Herrera, #50', 'Cliente'),
('Javier', 'Benitez', 'javier.b', 78787, 'clave111', 'Ciudad de Panama', 'Masculino', 'Casado', 'Privada', 'Costa del Este, PH Regent', 'Administrador'),
('Isabella', 'Soto', 'isabella.soto', 90909, 'clave222', 'David', 'Femenino', 'Soltero', 'Privada', 'Boquete, Calle Principal', 'Cliente'),
('Ricardo', 'Mendoza', 'ricardo.m', 23232, 'clave333', 'Colon', 'Masculino', 'Soltero', 'Publica', 'Calle 16, Casa 4', 'Vendedor'),
('Gabriela', 'Rojas', 'gabriela.r', 45454, 'clave444', 'Las Tablas', 'Femenino', 'Casado', 'Privada', 'Plaza Central, #2', 'Ejecutivo'),
('Fernando', 'Castillo', 'fernando.c', 67676, 'clave555', 'Penonome', 'Masculino', 'Soltero', 'Privada', 'Carretera Interamericana, Km 150', 'Cliente'),
('Daniela', 'Guerrero', 'daniela.g', 89898, 'clave666', 'Ciudad de Panama', 'Femenino', 'Soltero', 'Publica', 'Via Argentina, El Cangrejo', 'Cliente'),
('Mateo', 'Ortiz', 'mateo.ortiz', 13131, 'clave777', 'David', 'Masculino', 'Casado', 'Privada', 'Cerca del Parque Cervantes', 'Otro'),
('Paula', 'Silva', 'paula.silva', 35353, 'clave888', 'Chitre', 'Femenino', 'Soltero', 'Publica', 'A lado del Hospital, #19', 'Cliente');

SELECT * FROM usuarios;

INSERT INTO dispositivo (id_usuario, nombre_dispositivo, sistema_operativo) VALUES
(1, 'iPhone 13 de Juan', 'iOS'),
(2, 'Galaxy S22 de Maria', 'Android'),
(3, 'Laptop HP de Carlos', 'Windows'),
(4, 'MacBook Pro de Ana', 'macOS'),
(5, 'Tablet Samsung de Luis', 'Android'),
(6, 'iPhone SE de Sofia', 'iOS'),
(7, 'PC de Escritorio de Jorge', 'Windows'),
(8, 'iPad Air de Laura', 'iOS'),
(9, 'Xiaomi Redmi de Diego', 'Android'),
(10, 'Dell XPS de Camila', 'Windows'),
(11, 'Motorola G Power de Andres', 'Android'),
(12, 'iPhone 11 de Valentina', 'iOS'),
(13, 'Surface Pro de Javier', 'Windows'),
(14, 'Galaxy A52 de Isabella', 'Android'),
(15, 'Laptop Lenovo de Ricardo', 'Windows'),
(16, 'MacBook Air de Gabriela', 'macOS'),
(17, 'Huawei P30 de Fernando', 'Android'),
(18, 'iPhone 14 Pro de Daniela', 'iOS'),
(19, 'PC Gamer de Mateo', 'Windows'),
(20, 'Samsung Tablet S7 de Paula', 'Android');

SELECT * FROM dispositivo;

INSERT INTO autenticacion (id_dispositivo, nombre, constrasena, nombre_dispositivo, token) VALUES
(1, 'juan.perez', 'clave123', 'iPhone 13 de Juan', 12345),
(2, 'maria.gomez', 'clave456', 'Galaxy S22 de Maria', 54321),
(3, 'carlos.r', 'clave789', 'Laptop HP de Carlos', 67890),
(4, 'ana.martinez', 'clave101', 'MacBook Pro de Ana', 98765),
(5, 'luis.h', 'clave202', 'Tablet Samsung de Luis', 11223),
(6, 'sofia.lopez', 'clave303', 'iPhone SE de Sofia', 33445),
(7, 'jorge.diaz', 'clave404', 'PC de Escritorio de Jorge', 55667),
(8, 'laura.s', 'clave505', 'iPad Air de Laura', 77889),
(9, 'diego.torres', 'clave606', 'Xiaomi Redmi de Diego', 99001),
(10, 'camila.r', 'clave707', 'Dell XPS de Camila', 12121),
(11, 'andres.f', 'clave808', 'Motorola G Power de Andres', 34343),
(12, 'valentina.a', 'clave909', 'iPhone 11 de Valentina', 56565),
(13, 'javier.b', 'clave111', 'Surface Pro de Javier', 78787),
(14, 'isabella.soto', 'clave222', 'Galaxy A52 de Isabella', 90909),
(15, 'ricardo.m', 'clave333', 'Laptop Lenovo de Ricardo', 23232),
(16, 'gabriela.r', 'clave444', 'MacBook Air de Gabriela', 45454),
(17, 'fernando.c', 'clave555', 'Huawei P30 de Fernando', 67676),
(18, 'daniela.g', 'clave666', 'iPhone 14 Pro de Daniela', 89898),
(19, 'mateo.ortiz', 'clave777', 'PC Gamer de Mateo', 13131),
(20, 'paula.silva', 'clave888', 'Samsung Tablet S7 de Paula', 35353);

-- Datos para la tabla 'prueba' (sin especificar id_prueba)
INSERT INTO prueba (id_usuario, referencia, nombre, descripcion, fecha_ingreso, estado) VALUES
(1, 'REF-001', 'Prueba de Usabilidad', 'Evaluación inicial de la interfaz de usuario.', '2023-10-27 10:00:00', 'Activo'),
(2, 'REF-002', 'Prueba de Carga', 'Simulación de 1000 usuarios concurrentes.', '2023-10-27 11:30:00', 'Activo'),
(3, 'REF-003', 'Prueba de Ventas', 'Verificación del flujo de compra.', '2023-10-28 09:00:00', 'Activo'),
(4, 'REF-004', 'Auditoría de Seguridad', 'Revisión de vulnerabilidades de la aplicación.', '2023-10-28 14:00:00', 'Desactivado'),
(5, 'REF-005', 'Prueba de Compatibilidad', 'Pruebas en diferentes navegadores y dispositivos.', '2023-10-29 10:00:00', 'Activo'),
(6, 'REF-006', 'Prueba de Registro', 'Verificación del proceso de creación de cuentas.', '2023-10-29 12:00:00', 'Activo'),
(7, 'REF-007', 'Demo de Producto', 'Demostración para nuevo cliente potencial.', '2023-10-30 15:00:00', 'Activo'),
(8, 'REF-008', 'Prueba de API', 'Validación de los endpoints del backend.', '2023-10-30 16:30:00', 'Activo'),
(9, 'REF-009', 'Prueba de Contenido', 'Revisión de textos e imágenes del sitio.', '2023-10-31 11:00:00', 'Desactivado'),
(10, 'REF-010', 'Reporte Ejecutivo', 'Prueba para generar reportes mensuales.', '2023-11-01 09:30:00', 'Activo'),
(11, 'REF-011', 'Prueba de Navegación', 'Análisis del flujo de navegación del usuario.', '2023-11-01 13:00:00', 'Activo'),
(12, 'REF-012', 'Feedback de Usuario', 'Recopilación de opiniones sobre nueva funcionalidad.', '2023-11-02 10:00:00', 'Activo'),
(13, 'REF-013', 'Prueba de Integración', 'Verificación de la comunicación entre servicios.', '2023-11-02 15:00:00', 'Activo'),
(14, 'REF-014', 'Test de Interfaz', 'Pruebas A/B en el diseño de la página principal.', '2023-11-03 12:00:00', 'Desactivado'),
(15, 'REF-015', 'Simulación de Venta', 'Caso de prueba para el equipo de ventas.', '2023-11-03 16:00:00', 'Activo'),
(16, 'REF-016', 'Revisión de Métricas', 'Análisis de KPIs de la plataforma.', '2023-11-04 10:30:00', 'Activo'),
(17, 'REF-017', 'Prueba de Recuperación', 'Prueba de recuperación de contraseña.', '2023-11-04 14:00:00', 'Activo'),
(18, 'REF-018', 'Prueba de Rendimiento', 'Medición de tiempos de respuesta.', '2023-11-05 11:00:00', 'Activo'),
(19, 'REF-019', 'Test de Soporte', 'Prueba del sistema de tickets de soporte.', '2023-11-05 15:30:00', 'Desactivado'),
(20, 'REF-020', 'Prueba de Localización', 'Verificación de traducciones y formatos regionales.', '2023-11-06 09:00:00', 'Activo');

INSERT INTO metodo_pago (id_usuario, numero_de_tarjeta, cvc, tipo_de_tarjeta, fecha_de_expiracion, tarjeta_principal) VALUES
(1, '4567890123456789', 123, 'Visa', '2025-12-31', TRUE),
(2, '5555666677778888', 456, 'Mastercard', '2024-11-30', TRUE),
(3, '4111222233334444', 789, 'Visa', '2026-08-31', FALSE),
(4, '370011112222333', 101, 'American Express', '2025-06-30', TRUE),
(5, '5200333344445555', 202, 'Mastercard', '2027-01-31', TRUE),
(6, '4987654321098765', 303, 'Visa', '2024-09-30', FALSE),
(7, '5300987654321098', 404, 'Mastercard', '2025-02-28', TRUE),
(8, '4123456789012345', 505, 'Visa', '2026-04-30', TRUE),
(9, '5454545454545454', 606, 'Mastercard', '2024-07-31', FALSE),
(10, '377788889999000', 707, 'American Express', '2027-03-31', TRUE),
(11, '4001002003004005', 808, 'Visa', '2025-10-31', TRUE),
(12, '4555666677778888', 909, 'Visa', '2026-01-31', FALSE),
(13, '5112233445566778', 111, 'Mastercard', '2024-12-31', TRUE),
(14, '4999888877776666', 222, 'Visa', '2025-05-31', TRUE),
(15, '5221433265548776', 333, 'Mastercard', '2026-11-30', FALSE),
(16, '371234567890123', 444, 'American Express', '2024-10-31', TRUE),
(17, '4765432187654321', 555, 'Visa', '2027-02-28', TRUE),
(18, '5332112233445566', 666, 'Mastercard', '2025-09-30', TRUE),
(19, '4111111111111111', 777, 'Visa', '2026-06-30', FALSE),
(20, '5500000000000000', 888, 'Mastercard', '2024-08-31', TRUE);


-- VISTAS
-- Vista de usuarios en sistema
CREATE OR REPLACE VIEW vista_usuarios_sistema AS
SELECT
    id_usuario,
    nombre,
    apellido,
    nombre_usuario,
    ciudad,
    direccion,
    tipo_usuario
FROM
    usuarios;

SELECT * FROM vista_usuarios_sistema;

-- Vista de Clasificación de Usuarios por Tipo de Empresa
CREATE OR REPLACE VIEW vista_clasificacion_usuarios AS
SELECT
    nombre,
    apellido,
    tipo_de_empresa
FROM
    usuarios;

SELECT * FROM vista_clasificacion_usuarios;

-- Vista de Medios de Pagos
CREATE OR REPLACE VIEW vista_medios_de_pago AS
SELECT
    mp.id_tarjeta,
    mp.tipo_de_tarjeta,
    mp.tarjeta_principal,
    u.nombre,
    u.apellido,
    u.estado_civil,
    u.direccion
FROM
    metodo_pago AS mp
JOIN
    usuarios AS u ON mp.id_usuario = u.id_usuario;

SELECT * FROM vista_medios_de_pago;

-- Vista de Autenticación
CREATE OR REPLACE VIEW vista_autenticacion_usuarios AS
SELECT
    u.nombre AS nombre_usuario,
    u.apellido,
    u.ciudad,
    u.tipo_de_empresa
FROM
    autenticacion AS a
JOIN
    dispositivo AS d ON a.id_dispositivo = d.id_dispositivo
JOIN
    usuarios AS u ON d.id_usuario = u.id_usuario;

SELECT * FROM vista_autenticacion_usuarios;

-- Vista de Reporte de Pruebas Activas
CREATE OR REPLACE VIEW vista_pruebas_activas AS
SELECT
    referencia,
    nombre,
    descripcion,
    fecha_ingreso,
    estado
FROM
    prueba
WHERE
    estado = 'Activo';

SELECT * FROM vista_pruebas_activas;