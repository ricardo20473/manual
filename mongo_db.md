# Mongo DB

## Listar todas las base de datos creadas

    show dbs
    use data_example // seleccionar BD existentes 

## Crear base de datos

    use data_example

    Crear usuario y roles
    db.createUser({
        user: "user", 
        pwd: "constraseña", 
        roles: ["readWrite", "dbAdmin"]
    })
