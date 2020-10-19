package main

import (
	"db/driver"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func main() {
	var f *os.File
	var err error
	if len(os.Args) <= 1 {
		fmt.Println("请输入SQL路径!")
		return
	}

	for index, arg := range os.Args {

		if index == 0 || !strings.Contains(arg, "sql") {
			continue
		}
		fmt.Println("执行第" + strconv.Itoa(index) + "个SQL文件--------")
		f, err = os.Open(arg)
		if err == nil {

			filebyte, _ := ioutil.ReadAll(f)

			// fmt.Println(string(filebyte))

			sqlstrs := strings.Split(string(filebyte), ";")

			// fmt.Println(sqlstrs)

			for _, v := range sqlstrs {
				if v == "" {
					continue
				}
				fmt.Println(string(v))
				if strings.Contains(strings.ToLower(string(v)), "select") {
					rows, err := driver.MysqlDb.Query(string(v))
					if err != nil {
						fmt.Println(err)
						continue
					}
					defer rows.Close()
					columns, err := rows.Columns()
					if err != nil {
						fmt.Println(err)
						continue
					}
					count := len(columns)
					tableData := make([]map[string]interface{}, 0)
					values := make([]interface{}, count)
					valuePtrs := make([]interface{}, count)
					for rows.Next() {
						for i := 0; i < count; i++ {
							valuePtrs[i] = &values[i]
						}
						rows.Scan(valuePtrs...)
						entry := make(map[string]interface{})
						for i, col := range columns {
							var v interface{}
							val := values[i]
							b, ok := val.([]byte)
							if ok {
								v = string(b)
							} else {
								v = val
							}
							entry[col] = v
						}
						tableData = append(tableData, entry)
					}
					jsonData, err := json.Marshal(tableData)
					if err != nil {
						fmt.Println(err)
						continue
					}
					fmt.Println(string(jsonData))

				}
				_, err := driver.MysqlDb.Exec(string(v))
				if err == nil {

					fmt.Println("---------------------------------------success")
				} else {
					fmt.Println(err)
				}

			}

		}
	}

}
