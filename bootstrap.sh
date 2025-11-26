#!/bin/bash
# ==============================================================================
# Code_Weaver Bootstrap Script v2.0
#
# Este script inicializa un nuevo proyecto con una estructura de directorios
# y archivos enriquecida para una colaboración efectiva con agentes de IA.
#
# Uso: ./bootstrap.sh
# ==============================================================================

# --- Configuración ---
AGENT_RULES_DIR=".agent_rules"
DOCS_DIR="docs"
AI_AGENTS_DIR="$DOCS_DIR/ai_agents"
TEMPLATES_DIR_INTERNAL="templates" # Directorio donde residen las plantillas del kit
DOCS_TEMPLATES_DIR="$DOCS_DIR/templates" # Directorio de plantillas para el usuario

# --- Funciones ---

log() {
    echo "✅ [Code_Weaver] $1"
}

error() {
    echo "❌ [Code_Weaver] ERROR: $1" >&2
    exit 1
}

create_dir_if_not_exists() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        log "Directorio creado: $1"
    else
        log "Directorio ya existe: $1"
    fi
}

create_file_from_template() {
    local template_name=$1
    local destination_path=$2
    local template_path="$TEMPLATES_DIR_INTERNAL/$template_name.template"

    if [ ! -f "$template_path" ]; then
        error "La plantilla '$template_path' no fue encontrada."
    fi

    if [ ! -f "$destination_path" ]; then
        sed 's/{{FECHA_ACTUAL}}/'"$(date '+%Y-%m-%d')"'/' "$template_path" > "$destination_path"
        log "Archivo creado: $destination_path"
    else
        log "Archivo ya existe, no se sobreescribe: $destination_path"
    fi
}

# --- Script Principal ---

echo "🚀 Iniciando bootstrapping de Code_Weaver (v2.0)..."

# 1. Verificar que las plantillas existen
if [ ! -d "$TEMPLATES_DIR_INTERNAL" ]; then
    error "El directorio '$TEMPLATES_DIR_INTERNAL/' no fue encontrado. Asegúrate de que el script se ejecuta desde la raíz de Code_Weaver."
fi

# 2. Crear directorios
create_dir_if_not_exists "$AGENT_RULES_DIR"
create_dir_if_not_exists "$DOCS_DIR"
create_dir_if_not_exists "$AI_AGENTS_DIR"
create_dir_if_not_exists "$DOCS_TEMPLATES_DIR"

# 3. Crear archivos core desde las plantillas
create_file_from_template "AGENT_CORE.md" "$AGENT_RULES_DIR/AGENT_CORE.md"
create_file_from_template "KNOWLEDGE_BASE_MOC.md" "$DOCS_DIR/00_KNOWLEDGE_BASE_MOC.md"
create_file_from_template "VERSIONING_GUIDE.md" "$DOCS_DIR/VERSIONING_GUIDE.md"
create_file_from_template "DEV_LOG.md" "$DOCS_DIR/DEV_LOG.md"

# 4. Crear archivos de gestión de agentes
create_file_from_template "AGENT_MOC.md" "$AI_AGENTS_DIR/00_AGENT_MOC.md"
create_file_from_template "AGENT_EXAMPLE.md" "$AI_AGENTS_DIR/AGENT_EXAMPLE.md"

# 5. Crear plantillas para el usuario
create_file_from_template "COMPONENT_TEMPLATE.md" "$DOCS_TEMPLATES_DIR/COMPONENT_TEMPLATE.md"

echo "🎉 ¡Bootstrapping completado! Tu proyecto está listo para tejer código y conocimiento."
echo "👉 Próximos pasos recomendados:"
echo "   1. Lee el 'README.md' para entender la filosofía."
echo "   2. Personaliza '.agent_rules/AGENT_CORE.md' con las reglas de tu IA."
echo "   3. Empieza a poblar 'docs/' usando las plantillas y guías generadas."

exit 0