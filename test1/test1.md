Objectif :
 
Le but de cet exercice est d'implémenter une fonction en Go qui trouve récursivement des fichiers dans un répertoire donné, les traite pour calculer leur checksum, et retourne des informations pertinentes sur les fichiers.
 
Cette fonction sera utile dans le cadre d'Epseed pour synchroniser les fichiers avec un serveur en identifiant quels fichiers doivent être téléchargés ou téléversés en fonction de leur date de dernière modification.
 
Exigences :
- Fonctionnalité :
  Implémenter une fonction `FolderFilesFinder` qui :
  - Prend un chemin de répertoire et trouve récursivement tous les fichiers qu'il contient.
  - Retourne une liste de fichiers qui doivent être synchronisés, incluant leur chemin, checksum, et date de dernière modification.
  - Faire une gestion d'erreur solide
 
- Entrées :
  `folderpath` (string) : Le chemin du répertoire pour démarrer la recherche.
 
- Sorties :
  Une liste de structs `BoxFile`, chacun contenant :
  - `PathBox` (string) : Le chemin relatif du fichier.
  - `Checksum` (string) : Le checksum du fichier.
  - `UpdatedAt` (time.Time) : La date de dernière modification du fichier.
  Un objet d'erreur en cas de problème lors du processus.
 
Bonus :
  - Gérer l'ignorance des fichiers basée sur des motifs.
  - Concurrence :
    Utiliser des goroutines pour traiter les fichiers en parallèle afin d'accélérer l'opération.
    Utiliser des canaux(chan) pour collecter les résultats des goroutines.
 
Structs et Méthodes :
 
`BoxFile` :
```go
type BoxFile struct {
    PathBox   string
    Checksum  string
    UpdatedAt time.Time
}
```
 
Fonctions données :
 
```go
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
```
 
```go
func getLastTimeOfFile(file fs.FileInfo) time.Time {
    modTime := file.ModTime()
    return modTime
}
```
 
```go
func getFilesinFolder(folderpath string) ([]fs.FileInfo, error) {
    files, err := ioutil.ReadDir(folderpath)
    if err != nil {
        return nil, fmt.Errorf("FolderFilesFinder : error reading directory : %v", err)
    }
 
    return files, nil
}
```
 
```go
func isFileADir(file fs.FileInfo) bool {
    isDir := file.IsDir()
    return isDir
}
```
 
Signature de la Fonction :
```go
func FolderFilesFinder(folderpath string) ([]BoxFile, error)
```
Vous pouvez modifier les fonctions comme vous le souhaitez tant qu'elles remplissent leur fonction désirée.

Fonction de Go qui pourrais vous etre utile:
```go
func append(slice []Type, elems ...Type) []Type
```
 
Exemple d'utilisation :
```go
files, err := FolderFilesFinder("/path/to/start/")
if err != nil {
    log.Fatalf("Error: %v", err)
}
 
for _, file := range files {
    fmt.Printf("File: %s, Checksum: %s, Last Updated: %s\n", file.PathBox, file.Checksum, file.UpdatedAt)
}
```
 
Bonus :
- Assurez-vous que votre implémentation est robuste et gère les erreurs proprement.
- Écrivez du code Go propre et idiomatique, avec des commentaires et de la documentation appropriés.
- La gestion de la concurrence et des motifs à ignorer.