/**
 * @author Jack Ma, Team Grammers
 * Part of UIS CSC 478 Group Project - Team Grammers
 * Feb 2020 - May 2020
 * 
 */

package edu.uis.csc478.timemanagement;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

/*
 * The SpringBeanConfig file is used to established connection to the database. This is where the database information is stored.
 */

@Configuration
@MapperScan("edu.uis.csc478.timemanagement.repository")
public class SpringBeanConfig {

	@Bean
    public DataSource dataSource() {
		SQLServerDataSource ds = new SQLServerDataSource();
        ds.setUser("jma46");
        ds.setPassword("x^RGM0wc@v7l$&Yd");
        ds.setServerName("jma46.database.windows.net");
        ds.setPortNumber(1433);
        ds.setDatabaseName("timemanagement");
        return ds;
    }
 
    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
        return factoryBean.getObject();
    }
    
}
