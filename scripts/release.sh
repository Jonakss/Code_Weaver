#!/bin/bash

# --- release.sh ---
# Un script para automatizar el proceso de creación de releases semánticas.

set -e

# Función para mostrar mensajes de color
echo_color() {
    case "$1" in
        "green") echo -e "\033[32m$2\033[0m" ;; 
        "yellow") echo -e "\033[33m$2\033[0m" ;; 
        "red") echo -e "\033[31m$2\033[0m" ;; 
    esac
}

# 1. Verificar que el directorio de trabajo esté limpio
if ! git diff-index --quiet HEAD --; then
    echo_color "red" "Error: Tienes cambios sin commitear. Por favor, haz commit o stash antes de crear un release."
    exit 1
fi

echo_color "green" "✔ Directorio de trabajo limpio."

# 2. Obtener el último tag de versión
LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo_color "green" "Última versión detectada: $LATEST_TAG"

# Eliminar el prefijo 'v' para el procesamiento
LATEST_VERSION=${LATEST_TAG#v}

# 3. Preguntar al usuario por el tipo de release
echo_color "yellow" "¿Qué tipo de release es este? (major, minor, patch)"
read BUMP_TYPE

# Validar la entrada
if [[ "$BUMP_TYPE" != "major" && "$BUMP_TYPE" != "minor" && "$BUMP_TYPE" != "patch" ]]; then
    echo_color "red" "Error: Tipo de release inválido. Debe ser 'major', 'minor' o 'patch'."
    exit 1
fi

# Incrementar la versión
IFS='.' read -r -a VERSION_PARTS <<< "$LATEST_VERSION"
MAJOR=${VERSION_PARTS[0]}
MINOR=${VERSION_PARTS[1]}
PATCH=${VERSION_PARTS[2]}

case "$BUMP_TYPE" in
    "major") MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0 ;; 
    "minor") MINOR=$((MINOR + 1)); PATCH=0 ;; 
    "patch") PATCH=$((PATCH + 1)) ;; 
esac

NEW_VERSION="v$MAJOR.$MINOR.$PATCH"
echo_color "green" "La nueva versión será: $NEW_VERSION"

# 4. Crear el mensaje de commit
COMMIT_MSG="chore(release): version $NEW_VERSION [version:bump:$BUMP_TYPE]"

# 5. Crear un commit vacío para el release
# Usamos --allow-empty para poder crear un commit que solo representa el release
git commit --allow-empty -m "$COMMIT_MSG"
echo_color "green" "✔ Commit de release creado."

# 6. Crear el tag de Git
git tag -a "$NEW_VERSION" -m "Release $NEW_VERSION"
echo_color "green" "✔ Tag de Git '$NEW_VERSION' creado."

# 7. Instrucciones finales
echo_color "yellow" "\n¡Proceso de release completado!"
echo "Para publicar los cambios, ejecuta el siguiente comando:"
echo_color "green" "git push --follow-tags"

exit 0
