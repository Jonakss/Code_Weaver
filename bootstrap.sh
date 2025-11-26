#!/bin/bash
# ==============================================================================
# Code_Weaver Bootstrap Script
#
# Este script inicializa un nuevo proyecto con la estructura de directorios
# y archivos necesarios para una colaboración efectiva con agentes de IA,
# siguiendo la metodología de Code_Weaver.
#
# Uso: ./bootstrap.sh
# ==============================================================================

# --- Configuración ---
AGENT_RULES_DIR=".agent_rules"
DOCS_DIR="docs"
AI_AGENTS_DIR="$DOCS_DIR/ai_agents"
TEMPLATES_DIR="templates" # Directorio donde residen las plantillas

# --- Funciones ---

# Función para imprimir mensajes de estado
log() {
    echo "✅ [Code_Weaver] $1"
}

# Función para imprimir errores
error() {
    echo "❌ [Code_Weaver] ERROR: $1" >&2
    exit 1
}

# Función para crear un directorio si no existe
create_dir_if_not_exists() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        log "Directorio creado: $1"
    else
        log "Directorio ya existe: $1"
    fi
}

# Función para crear un archivo desde una plantilla
create_file_from_template() {
    local template_name=$1
    local destination_path=$2
    local template_path="$TEMPLATES_DIR/$template_name.template"

    if [ ! -f "$template_path" ]; then
        error "La plantilla '$template_path' no fue encontrada."
    fi

    if [ ! -f "$destination_path" ]; then
        # Reemplazar placeholders (si los hubiera en el futuro)
        sed 's/{{FECHA_ACTUAL}}/'"$(date '+%Y-%m-%d')"'/' "$template_path" > "$destination_path"
        log "Archivo creado: $destination_path"
    else
        log "Archivo ya existe, no se sobreescribe: $destination_path"
    fi
}

# --- Script Principal ---

echo "🚀 Iniciando bootstrapping de Code_Weaver..."

# 1. Verificar que las plantillas existen
if [ ! -d "$TEMPLATES_DIR" ]; then
    error "El directorio 'templates/' no fue encontrado. Asegúrate de que el script se ejecuta desde la raíz de Code_Weaver."
fi

# 2. Crear directorios
create_dir_if_not_exists "$AGENT_RULES_DIR"
create_dir_if_not_exists "$DOCS_DIR"
create_dir_if_not_exists "$AI_AGENTS_DIR"

# 3. Crear archivos desde las plantillas
create_file_from_template "AGENT_CORE.md" "$AGENT_RULES_DIR/AGENT_CORE.md"
create_file_from_template "KNOWLEDGE_BASE_MOC.md" "$DOCS_DIR/00_KNOWLEDGE_BASE_MOC.md"
create_file_from_template "AGENT_MOC.md" "$AI_AGENTS_DIR/00_AGENT_MOC.md"
create_file_from_template "AGENT_EXAMPLE.md" "$AI_AGENTS_DIR/AGENT_EXAMPLE.md"

# 4. Hacer el script no ejecutable después de su uso (opcional, como medida de seguridad)
# chmod -x bootstrap.sh
# log "El script bootstrap.sh se ha hecho no ejecutable."

echo "🎉 ¡Bootstrapping completado! Tu proyecto está listo para tejer código y conocimiento."
echo "👉 Próximos pasos recomendados:"
echo "   1. Edita '.agent_rules/AGENT_CORE.md' para definir las reglas de tu IA."
echo "   2. Empieza a poblar 'docs/' con el conocimiento de tu proyecto."
echo "   3. Elimina el directorio 'templates/' y el script 'bootstrap.sh' si ya no los necesitas."

exit 0
