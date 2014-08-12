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
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
