package driver

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

var MysqlDb *sql.DB
var MysqlDbErr error

type MysqlConfiguration struct {
	MysqlUserName string
	MysqlPassword string
	MysqlHost     string
	MysqlPort     int
	MysqlDatabase string
	MysqlCharset  string
}

var config MysqlConfiguration

// 初始化链接
func init() {
	loadConfig()
	dbDSN := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=%s", config.MysqlUserName, config.MysqlPassword, config.MysqlHost, config.MysqlPort, config.MysqlDatabase, config.MysqlCharset)
	fmt.Println(dbDSN)
	// 打开连接失败
	MysqlDb, MysqlDbErr = sql.Open("mysql", dbDSN)
	//defer MysqlDb.Close();
	if MysqlDbErr != nil {
		log.Println("dbDSN: " + dbDSN)
		panic("数据源配置不正确: " + MysqlDbErr.Error())
	}

	// 最大连接数
	MysqlDb.SetMaxOpenConns(100)
	// 闲置连接数
	MysqlDb.SetMaxIdleConns(20)
	// 最大连接周期
	MysqlDb.SetConnMaxLifetime(100 * time.Second)

	if MysqlDbErr = MysqlDb.Ping(); nil != MysqlDbErr {
		panic("数据库链接失败: " + MysqlDbErr.Error())
	}

}

func loadConfig() {
	file, err := os.Open("mysqlconfig.json")
	if err != nil {
		log.Fatalln("Cannot open mysqlconfig file", err)
	}
	decoder := json.NewDecoder(file)
	config = MysqlConfiguration{}
	err = decoder.Decode(&config)
	if err != nil {
		log.Fatalln("Cannot get mysqlconfiguration from file", err)
	}
}
