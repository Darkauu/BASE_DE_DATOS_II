# Paso 1: Crear y ejecutar el contenedor MySQL

```bash
docker run -d --name mysql-container-name
-e MYSQL_ROOT_PASSWORD=mi_contraseña
-e MYSQL_DATABASE=mi_base_de_datos
-p 3306:3319
mysql:8.0
```

# Paso 2: Conectarse usando el cliente MySQL dentro del contenedor

```bash
docker exec -it mysql-cont -u root -p
```

# Paso 3: Asegurarse de que el contenedor esté ejecutándose

```bash
docker ps
```

# Si no se está ejecutanto, iniciarlo revisando el nombre del contenedor

```bash
docker start mysql-containter
```

# Paso 4: Configurar nueva conexión en MySQL Workbench
### 1. Abrir MySQL Workbench
### 2. Hacer click en el "+"
### 3. Configurar parámetros
### 4. Hacer clic en Test Connection
### 5. De tener éxito, continuar.

# Paso 5: Conectarse y ejecutar el código

Algunos comandos importantes son:
``` bash
# Ver logs del contenedor
docker logs mysql-container

# Detener el contenedor
docker stop mysql-container

# Iniciar el contenedor
docker start mysql-container

# Eliminar el contenedor (¡cuidado, se pierden los datos!)
docker rm mysql-container

# Ver contenedores en ejecución
docker ps

# Ver todos los contenedores (incluyendo detenidos)
docker ps -a
```