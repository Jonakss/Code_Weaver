# 🧶 Code_Weaver: Un Framework para Proyectos Impulsados por IA

**Code_Weaver** es un repositorio de plantilla y una metodología para construir software donde los agentes de IA son colaboradores de primera clase. Su filosofía es que para que la IA actúe eficazmente, el código (`src/`) y el conocimiento (`docs/`) deben estar intrínsecamente entrelazados.

Este repositorio es un **ejemplo vivo** de la estructura final. Puedes clonarlo y empezar a trabajar directamente.

---

## ✨ Filosofía

1.  **Conocimiento como Ciudadano de Primera Clase:** La documentación (`docs/`) es una **Base de Conocimientos (Knowledge Base)** activa que la IA utiliza para entender el contexto, las decisiones y los objetivos del proyecto.
2.  **Reglas Explícitas:** Los agentes de IA operan bajo "mandamientos" en `.agent_rules/AGENT_CORE.md`, asegurando consistencia y alineación con los estándares del proyecto.
3.  **Simbiosis Código-Conocimiento:** Un cambio en el código se refleja en la base de conocimientos, y las decisiones documentadas guían la implementación.
4.  **Obsidian & Markdown:** La base de conocimientos está diseñada como un [Vault de Obsidian](https://obsidian.md/), permitiendo la navegación del conocimiento a través de enlaces (`[[wikilinks]]`).

## 🚀 Cómo Empezar

Este repositorio ya contiene la estructura de directorios y archivos base. Puedes empezar de dos maneras:

**Opción 1: Usar como Plantilla (Recomendado)**

1.  Haz clic en el botón **"Use this template"** en la página de GitHub para crear un nuevo repositorio basado en este.
2.  Clona tu nuevo repositorio.
3.  Comienza a personalizar los archivos en `.agent_rules/` y `docs/` para tu proyecto.

**Opción 2: Regenerar la Estructura (Uso Avanzado)**

Si deseas regenerar la estructura base o utilizar el generador en un proyecto existente, puedes usar el script de bootstrapping.

```bash
# 1. Asegúrate de que el script sea ejecutable
chmod +x bootstrap.sh

# 2. Ejecuta el script para generar (o sobreescribir si ya existen) los archivos base
./bootstrap.sh
```

## 📂 Estructura Incluida

Este repositorio ya incluye la siguiente estructura generada:

```
.
├── .agent_rules/
│   └── AGENT_CORE.md         # Mandamientos y reglas para tu agente de IA.
├── docs/
│   ├── 00_KNOWLEDGE_BASE_MOC.md # MOC principal de la Knowledge Base.
│   ├── DEV_LOG.md               # Log de decisiones de desarrollo.
│   ├── VERSIONING_GUIDE.md      # Guía para el versionado semántico automático.
│   ├── ai_agents/
│   │   ├── 00_AGENT_MOC.md      # MOC para listar y gestionar agentes de IA.
│   │   └── AGENT_EXAMPLE.md     # Ejemplo de definición de un agente.
│   ├── components/              # Documentación de componentes técnicos.
│   │   └── 00_COMPONENTS_MOC.md # MOC de componentes.
│   ├── concepts/                # Definiciones de conceptos clave del proyecto.
│   │   └── 00_CONCEPTS_MOC.md   # MOC de conceptos.
│   ├── core/                    # Visión, arquitectura y principios fundamentales.
│   │   └── 00_CORE_MOC.md       # MOC del core.
│   ├── experiments/             # Registro de experimentos y sus resultados.
│   │   └── 00_EXPERIMENTS_MOC.md# MOC de experimentos.
│   └── templates/
│       └── COMPONENT_TEMPLATE.md  # Plantilla para documentar nuevos componentes.
├── templates/                  # Plantillas internas usadas por bootstrap.sh
│   └── ...
└── bootstrap.sh                # Script para (re)generar la estructura.
```

### Descripción de Archivos Clave

*   `.agent_rules/AGENT_CORE.md`: **El Corazón del Sistema.** El archivo que tu agente de IA principal debe "leer" al inicio de cada sesión. Contiene las directivas que guían sus acciones.
*   `docs/DEV_LOG.md`: Un diario donde todos los colaboradores (humanos y IA) registran el **"porqué"** detrás de los cambios.
*   `docs/VERSIONING_GUIDE.md`: Instrucciones para que los commits activen el versionado automático.
*   `docs/core/`: Guarda la visión, misión y arquitectura principal del proyecto.
*   `docs/concepts/`: Define los conceptos fundamentales y la terminología.
*   `docs/components/`: Detalla cada componente técnico del sistema.
*   `docs/experiments/`: Registra la metodología y resultados de los experimentos.

## 🎨 Personalización

1.  **Edita `.agent_rules/AGENT_CORE.md`**: Adapta las reglas a tu stack tecnológico y convenciones.
2.  **Limpia y Adapta `docs/`**: Modifica el `DEV_LOG.md`, el `00_KNOWLEDGE_BASE_MOC.md` y los demás archivos para que se ajusten a la visión de tu nuevo proyecto.
3.  **Enseña a tu Agente:** En tu primera interacción con tu IA, indícale que su "fuente de verdad" y reglas residen en `.agent_rules/AGENT_CORE.md`.

---
*Hecho con la colaboración de IA, para una mejor colaboración con la IA.*
