package utils

import (
	"bufio"
	"crypto/sha256"
	"fmt"
	"io"
	"io/fs"
	"io/ioutil"
	"log"
	"os"
	"time"
)

type BoxFile struct {
	PathBox   string
	Checksum  string
	UpdatedAt time.Time
}

func GetChecksum(file string) (string, error) {
	f, err := os.Open(file)
	if err != nil {
		log.Printf("GetChecksum: Failed to open file %s: %v", file, err)
		return "null", err
	}
	defer func() {
		if closeErr := f.Close(); closeErr != nil {
			log.Printf("GetChecksum: Failed to close file %s: %v", file, closeErr)
		}
	}()

	h := sha256.New()
	buf := make([]byte, 32000)
	reader := bufio.NewReader(f)

	for {
		n, err := reader.Read(buf)
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Printf("GetChecksum: Failed to read from file %s: %v", file, err)
			return "null", err
		}
		h.Write(buf[:n])
	}

	return fmt.Sprintf("%x", h.Sum(nil)), nil
}

func GetLastTimeOfFile(file fs.FileInfo) time.Time {
	modTime := file.ModTime()
	return modTime
}

func GetFilesinFolder(folderpath string) ([]fs.FileInfo, error) {
	files, err := ioutil.ReadDir(folderpath)
	if err != nil {
		return nil, fmt.Errorf("FolderFilesFinder : error reading directory : %v", err)
	}

	return files, nil
}

func IsFileADir(file fs.FileInfo) bool {
	isDir := file.IsDir()
	return isDir
}
