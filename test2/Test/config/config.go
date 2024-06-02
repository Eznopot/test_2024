package config

import (
	"log"
	"sync"

	"github.com/ilyakaznacheev/cleanenv"
)

var once sync.Once
var configInstance *Config

type (
	Config struct {
		HTTP     `yaml:"http"`
		DataBase `yaml:"db"`
	}
	DataBase struct {
		Username string `env-required:"true" yaml:"username" env:"DATABASE_USERNAME"`
		Password string `env-required:"true" yaml:"password" env:"DATABASE_PASSWORD"`
		PortDB   string `env-required:"true" yaml:"port" env:"DATABASE_PORT"`
		DBName   string `env-required:"true" yaml:"db_name" env:"DATABASE_NAME"`
		Host     string `env-required:"true" yaml:"host" env:"DATABASE_HOST"`
	}

	HTTP struct {
		Port string `env-required:"true" yaml:"port" env:"CORE_HTTP_PORT"`
	}
)

func GetConfig() *Config {
	if configInstance == nil {
		log.Println("Eoor: Config not loaded")
	}
	return configInstance
}

func InitConfig(p string) *Config {
	once.Do(func() {
		cfg := &Config{}

		err := cleanenv.ReadConfig(p, cfg)
		if err != nil {
			log.Fatal("Config error: ", err)
		}

		err = cleanenv.ReadEnv(cfg)
		if err != nil {
			log.Fatal("Config error: ", err)
		}
		configInstance = cfg
	})

	return configInstance
}
