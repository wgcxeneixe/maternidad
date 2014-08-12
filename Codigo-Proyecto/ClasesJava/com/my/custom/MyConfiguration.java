package com.my.custom;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsAnnotationConfiguration;
import org.hibernate.HibernateException;
import org.hibernate.dialect.Dialect;
import org.hibernate.tool.hbm2ddl.DatabaseMetadata;

/**
 * Sobreescribe la creación, modificación o eliminación al inicio de la aplicación para
 * ciertas tablas con determinado nombre o que pertezcan a un schema determinado.
 *
 * Este comportamiento es necesario para que el plugin datasources no cree tablas en blanco
 * de las clases maenjadas por el plugion en el DS principal de la aplicación.
 *
 * From <a href='http://stackoverflow.com/questions/3935088/grails-limited-table-creation'>http://stackoverflow.com/questions/3935088/grails-limited-table-creation</a>
 * @author Burt Beckwith
 */

public class MyConfiguration extends GrailsAnnotationConfiguration {

    // Lista de schemas que no queremos crear automaticamente
    private static final String[] IGNORE_SCHEMAS = { "public" };

    // Lista de tablas que no queremos crear automaticamente, p.e.: "public.persona"
    private static final String[] IGNORE_TABLES = { };

    @Override
    public String[] generateDropSchemaScript(Dialect dialect) throws HibernateException {
        return prune(super.generateDropSchemaScript(dialect));
    }

    @Override
    public String[] generateSchemaCreationScript(Dialect dialect) throws HibernateException {
        return prune(super.generateSchemaCreationScript(dialect));
    }

    @Override
    public String[] generateSchemaUpdateScript(Dialect dialect, DatabaseMetadata databaseMetadata)
            throws HibernateException {
        return prune(super.generateSchemaUpdateScript(dialect, databaseMetadata));
    }

    private String[] prune(String[] script) {
        List<String> pruned = new ArrayList<String>();
        for (String command : script) {

            boolean ignore = false;

            for (String ignoreSchema : IGNORE_SCHEMAS) {
                if (command.toLowerCase().contains(" table " + ignoreSchema.toLowerCase() + ".")) {
                    ignore = true;
                    break;
                }
            }

            for (String ignoreTable : IGNORE_TABLES) {
                if (command.toLowerCase().contains(" table " + ignoreTable.toLowerCase() + " ")) {
                    ignore = true;
                    break;
                }
            }

            if (!ignore) {
                pruned.add(command);
            }
        }
        return pruned.toArray(new String[pruned.size()]);
    }
}