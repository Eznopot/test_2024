package main

import (
	"fmt"
	"log"
	"test1/utils"
)

// fonction a implémenter
func FolderFilesFinder(folderpath string) ([]utils.BoxFile, error) {
	var res []utils.BoxFile
	return res, nil
}

func main() {
	files, err := FolderFilesFinder("./utils/")
	if err != nil {
		log.Fatalf("Error: %v", err)
	}

	for _, file := range files {
		fmt.Printf("File: %s, Checksum: %s, Last Updated: %s\n", file.PathBox, file.Checksum, file.UpdatedAt)
	}
}
