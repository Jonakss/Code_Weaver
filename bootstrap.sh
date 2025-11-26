#!/bin/bash
# ==============================================================================
# Code_Weaver Bootstrap Script v2.3
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
TEMPLATES_DIR_INTERNAL="templates"
DOCS_TEMPLATES_DIR="$DOCS_DIR/templates"

# Directorios de documentación
DOCS_INBOX_DIR="$DOCS_DIR/00_Inbox"
DOCS_CORE_DIR="$DOCS_DIR/core"
DOCS_CONCEPTS_DIR="$DOCS_DIR/concepts"
DOCS_COMPONENTS_DIR="$DOCS_DIR/components"
DOCS_EXPERIMENTS_DIR="$DOCS_DIR/experiments"

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

echo "🚀 Iniciando bootstrapping de Code_Weaver (v2.3)..."

# 1. Verificar que las plantillas existen
if [ ! -d "$TEMPLATES_DIR_INTERNAL" ]; then
    error "El directorio '$TEMPLATES_DIR_INTERNAL/' no fue encontrado."
fi

# 2. Crear directorios
create_dir_if_not_exists "$AGENT_RULES_DIR"
create_dir_if_not_exists "$DOCS_DIR"
create_dir_if_not_exists "$DOCS_INBOX_DIR"
create_dir_if_not_exists "$AI_AGENTS_DIR"
create_dir_if_not_exists "$DOCS_TEMPLATES_DIR"
create_dir_if_not_exists "$DOCS_CORE_DIR"
create_dir_if_not_exists "$DOCS_CONCEPTS_DIR"
create_dir_if_not_exists "$DOCS_COMPONENTS_DIR"
create_dir_if_not_exists "$DOCS_EXPERIMENTS_DIR"

# 3. Crear archivos core desde las plantillas
create_file_from_template "AGENT_CORE.md" "$AGENT_RULES_DIR/AGENT_CORE.md"
create_file_from_template "KNOWLEDGE_BASE_MOC.md" "$DOCS_DIR/00_KNOWLEDGE_BASE_MOC.md"
create_file_from_template "INBOX_README.md" "$DOCS_INBOX_DIR/README.md"
create_file_from_template "VERSIONING_GUIDE.md" "$DOCS_DIR/VERSIONING_GUIDE.md"
create_file_from_template "DEV_LOG.md" "$DOCS_DIR/DEV_LOG.md"

# 4. Crear MOCs para las secciones de docs
create_file_from_template "CORE_MOC.md" "$DOCS_CORE_DIR/00_CORE_MOC.md"
create_file_from_template "CONCEPTS_MOC.md" "$DOCS_CONCEPTS_DIR/00_CONCEPTS_MOC.md"
create_file_from_template "COMPONENTS_MOC.md" "$DOCS_COMPONENTS_DIR/00_COMPONENTS_MOC.md"
create_file_from_template "EXPERIMENTS_MOC.md" "$DOCS_EXPERIMENTS_DIR/00_EXPERIMENTS_MOC.md"

# 5. Crear archivos de gestión de agentes y ejemplos
create_file_from_template "AGENT_MOC.md" "$AI_AGENTS_DIR/00_AGENT_MOC.md"
create_file_from_template "AGENT_GEMINI_CLI.md" "$AI_AGENTS_DIR/AGENT_GEMINI_CLI.md"
create_file_from_template "AGENT_CURSOR.md" "$AI_AGENTS_DIR/AGENT_CURSOR.md"
create_file_from_template "AGENT_CLAUDE.md" "$AI_AGENTS_DIR/AGENT_CLAUDE.md"

# 6. Crear plantillas para el usuario
create_file_from_template "COMPONENT_TEMPLATE.md" "$DOCS_TEMPLATES_DIR/COMPONENT_TEMPLATE.md"

echo "🎉 ¡Bootstrapping completado! Tu proyecto está listo para tejer código y conocimiento."
echo "👉 Próximos pasos recomendados:"
echo "   1. Lee el 'README.md' para entender la filosofía y los puntos débiles."
echo "   2. Personaliza '.agent_rules/AGENT_CORE.md' con las reglas de tu IA."
echo "   3. Empieza a usar 'docs/00_Inbox/' para capturar tus ideas."

exit 0
