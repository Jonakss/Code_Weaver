# 🧶 Code_Weaver: Un Framework para Proyectos Impulsados por IA

**Code_Weaver** es una plantilla de repositorio y una metodología diseñada para construir proyectos de software donde los agentes de IA no son solo herramientas, sino colaboradores de primera clase. La filosofía central es que para que la IA actúe de manera efectiva, el código (`src/`) y el conocimiento (`docs/`) deben estar intrínsecamente entrelazados, como los hilos de un tapiz.

Este framework transforma un repositorio estándar en un **"Ágora Digital"** o una **"Memoria Extendida"** para el proyecto. Es el lugar donde los desarrolladores humanos y los agentes de IA se encuentran, se comunican y colaboran, guiados por una base de conocimientos compartida y explícita.

---

## ✨ Filosofía

1.  **El Conocimiento como Ciudadano de Primera Clase:** La documentación (`docs/`) no es un producto secundario del código; es un componente activo y esencial. Se trata como una **Base de Conocimientos (Knowledge Base)** que la IA utiliza para entender el contexto, las decisiones de diseño y los objetivos del proyecto.
2.  **Reglas Explícitas:** Los agentes de IA operan bajo un conjunto de "mandamientos" o reglas (`.agent_rules/AGENT_CORE.md`) que definen su comportamiento, estilo de codificación y responsabilidades. Esto asegura consistencia y alineación con los estándares del proyecto.
3.  **Simbiosis Código-Conocimiento:** Un cambio en el código debe reflejarse en la base de conocimientos, y las decisiones documentadas en la base de conocimientos deben guiar la implementación del código. Son dos caras de la misma moneda.
4.  **Obsidian & Markdown:** La base de conocimientos está diseñada para ser un [Vault de Obsidian](https://obsidian.md/), permitiendo la navegación y el descubrimiento de conocimiento a través de una red de enlaces (`[[wikilinks]]`).

## 🚀 Cómo Empezar

Para inicializar un nuevo proyecto utilizando la metodología `Code_Weaver`, simplemente copia el contenido de este repositorio en la raíz de tu nuevo proyecto y ejecuta el script de bootstrapping.

```bash
# 1. Asegúrate de que el script sea ejecutable
chmod +x bootstrap.sh

# 2. Ejecuta el script para generar la estructura de la base de conocimientos
./bootstrap.sh

# 3. ¡Listo! Revisa los archivos generados y comienza a personalizarlos.
```

## 📂 Estructura Generada

El script `bootstrap.sh` creará la siguiente estructura en tu proyecto:

```
.
├── .agent_rules/
│   └── AGENT_CORE.md         # Mandamientos y reglas fundamentales para tu agente de IA.
└── docs/
    ├── 00_KNOWLEDGE_BASE_MOC.md  # Map of Content (MOC) principal de la Knowledge Base.
    └── ai_agents/
        ├── 00_AGENT_MOC.md       # MOC para listar y gestionar todos los agentes de IA.
        └── AGENT_EXAMPLE.md      # Un ejemplo de cómo definir un agente específico.
```

### Descripción de Archivos Clave

*   `.agent_rules/AGENT_CORE.md`: **El Corazón del Sistema.** Este es el archivo que tu agente de IA principal debe "leer" al inicio de cada sesión. Contiene las reglas de alto nivel, los mandamientos y las directivas que guían todas sus acciones. Debes personalizarlo para definir el "carácter" de tu colaborador de IA.
*   `docs/00_KNOWLEDGE_BASE_MOC.md`: La página de inicio de tu base de conocimientos. Desde aquí, enlazarás a conceptos, componentes, decisiones de arquitectura y más.
*   `docs/ai_agents/00_AGENT_MOC.md`: Un directorio central para todos los agentes que trabajan en tu proyecto. Si usas múltiples IAs (como Gemini, Claude, Copilot, etc.), puedes definir el rol y las responsabilidades de cada uno aquí.

## 🎨 Personalización

1.  **Edita `.agent_rules/AGENT_CORE.md`**: Este es el paso más importante. Adapta las reglas a tu stack tecnológico, tus convenciones de codificación y la filosofía de tu proyecto.
2.  **Comienza a Poblar `docs/`**: Crea notas para los componentes principales de tu aplicación, las decisiones de arquitectura y los conceptos clave.
3.  **Enseña a tu Agente:** En tu primera interacción con tu agente de IA, indícale que su "fuente de verdad" y sus reglas principales residen en el archivo `.agent_rules/AGENT_CORE.md`.

---
*Hecho con la colaboración de IA, para una mejor colaboración con la IA.*
