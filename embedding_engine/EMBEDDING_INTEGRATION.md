# Arquitectura del Motor de Embeddings para Búsqueda Semántica

Este documento describe la arquitectura y el plan de integración para un motor de búsqueda semántica local, diseñado como un módulo reutilizable (`embedding_engine`).

## 1. Visión General

El objetivo es crear un sistema que transforme la base de conocimientos en formato Markdown (principalmente en el directorio `/docs`) en una base de datos vectorial consultable. Esto permite realizar búsquedas semánticas (basadas en el significado) en lugar de búsquedas por palabras clave.

Este motor servirá como una "memoria a largo plazo" para agentes de IA, desarrolladores y herramientas de gestión del conocimiento, proporcionando respuestas contextuales y precisas basadas exclusivamente en la documentación del proyecto.

## 2. Arquitectura Técnica

El motor se compone de tres elementos principales, todos diseñados para funcionar localmente, sin dependencias de servicios externos, garantizando la privacidad y el control.

-   **Componente de Generación de Embeddings:**
    -   **Librería:** `sentence-transformers` (Python).
    -   **Modelos:** Se utilizarán modelos pre-entrenados de última generación optimizados para la similitud semántica, como `all-MiniLM-L6-v2` o similar. Estos modelos se descargan y se ejecutan localmente.
    -   **Proceso:** El script leerá los archivos de texto, los dividirá en fragmentos (chunks) y usará el modelo para convertir cada fragmento en un vector numérico (embedding).

-   **Base de Datos Vectorial:**
    -   **Tecnología:** `ChromaDB` (Python).
    -   **Funcionamiento:** ChromaDB almacenará los embeddings junto con el texto original y metadatos (como la ruta del archivo de origen). Se ejecutará en modo "in-memory" o persistente en el disco local.
    -   **Ubicación:** La base de datos se almacenará en un directorio dentro de `embedding_engine/db/` que estará incluido en `.gitignore` para evitar conflictos y mantenerla como un artefacto local de cada usuario.

-   **Scripts de Interfaz:**
    -   `process.py`: Script principal para escanear, procesar y sincronizar la documentación con la base de datos vectorial.
    -   `query.py`: Script para realizar consultas a la base de datos. Recibirá una pregunta en lenguaje natural y devolverá los fragmentos de texto más relevantes.

## 3. Despliegue y Sincronización

La solución está diseñada para ser modular y fácil de integrar en múltiples proyectos.

-   **Estrategia de Submódulo de Git:**
    -   El directorio `embedding_engine/` está diseñado para ser un **submódulo de Git**. Esto permite que su desarrollo sea independiente y que pueda ser reutilizado fácilmente en otros repositorios (`Atheria`, `knowledge_base`, etc.).

-   **Proceso de Sincronización:**
    -   **Automático (Recomendado):** Se configurará un **hook `pre-commit` de Git**. Cada vez que un desarrollador realice un `git commit` con cambios en el directorio de la documentación, el script `process.py` se ejecutará automáticamente para actualizar la base de datos vectorial local.
    -   **Manual:** El desarrollador siempre podrá ejecutar `python embedding_engine/process.py` manualmente para forzar una re-indexación completa.

## 4. Plan de Integración con Herramientas

A continuación, se detalla cómo este motor se integrará con las herramientas de desarrollo y conocimiento.

### Gemini CLI / Chats Web
-   **Modo de Uso:** El agente CLI podrá ejecutar `python embedding_engine/query.py --query "pregunta del usuario"` para buscar en la base de conocimientos.
-   **Beneficio:** Las respuestas estarán fundamentadas en la documentación específica del proyecto, aumentando la precisión y relevancia. El agente podrá citar las fuentes exactas de sus respuestas.

### Google Antigravity
-   **Modo de Uso:** Los agentes de IA que operan dentro de Antigravity podrán usar el script de consulta como una herramienta fundamental para obtener contexto. Antes de implementar una nueva funcionalidad o corregir un bug, el agente consultará la base de datos para entender los requisitos, las arquitecturas existentes y las convenciones del proyecto.
-   **Beneficio:** Aumenta drásticamente la autonomía y la calidad del trabajo de los agentes de IA, ya que operan con un conocimiento profundo y específico del proyecto.

### Jules de Google
-   **Modo de Uso:** Para tareas de refactorización a gran escala, Jules puede usar el motor para realizar un **análisis de impacto en la documentación**. Antes de aplicar un cambio de código masivo (ej: renombrar una clase), consultará la base de datos para encontrar todas las menciones semánticas de esa clase en la documentación.
-   **Beneficio:** Asegura la consistencia entre el código y la documentación, una tarea que a menudo se pasa por alto en refactorizaciones complejas.

### Cursor
-   **Modo de Uso:** Se puede integrar directamente en el flujo de trabajo del desarrollador. A través de la terminal integrada de Cursor, el desarrollador puede ejecutar `python embedding_engine/query.py --query "cómo funciona el módulo de autenticación"` y recibir instantáneamente los documentos relevantes.
-   **Beneficio:** Reduce el cambio de contexto y acelera el desarrollo al llevar la documentación directamente al editor.

### Obsidian
-   **Modo de Uso:** La integración más profunda. Se puede desarrollar un plugin simple de Obsidian o usar un plugin de ejecución de comandos existente para:
    1.  Crear un comando "Encontrar Notas Relacionadas" que ejecute `query.py` con el contenido de la nota actual como consulta.
    2.  Mostrar los resultados en un panel lateral, con enlaces directos a las notas encontradas.
-   **Beneficio:** Transforma Obsidian de un simple almacén de notas a una herramienta de descubrimiento de conocimiento, ayudando a encontrar conexiones inesperadas entre ideas.
