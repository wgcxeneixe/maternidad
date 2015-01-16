dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "postgres"

    // Agregamos esta configuración para que el plugin datasources no cree tablas en blanco
    // de las clases maenjadas por el plugion en el DS principal de la aplicación...
    configClass = 'com.my.custom.MyConfiguration'
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
////    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
//    singleSession = true // configure OSIV singleSession mode
//    flush.mode = 'manual' // OSIV session flush mode outside of transactional context

    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    dialect = 'com.my.custom.TableNameSequencePostgresDialect'

    // Usamos un schema específico para la aplicación así evitamos que se
    // mezclen las tablas con las de otros paquetes
    default_schema = 'sami'
    // Recordar crear el schema 'sami' en la base de datos!!!
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql:sami_dev"
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql:sami_dev"
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql:sami_dev"
        }
    }
}
