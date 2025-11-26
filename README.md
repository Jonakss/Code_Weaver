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

Este repositorio ya contiene la estructura de directorios y archivos base.

1.  Usa este repositorio como plantilla (**"Use this template"** en GitHub) para crear tu nuevo proyecto.
2.  Clona tu nuevo repositorio.
3.  Comienza a personalizar los archivos en `.agent_rules/` y `docs/`.

---

## ⚠️ Puntos Débiles y Cómo Mitigarlos

Este sistema es poderoso, pero no es mágico. Su éxito depende de la disciplina y la conciencia de sus limitaciones.

| Punto Débil | Descripción | Mitigación |
| :--- | :--- | :--- |
| **Disciplina Requerida** | El sistema falla si el desarrollador o la IA no siguen la regla de mantener sincronizados el código y los `docs`. La IA puede operar con información desactualizada si el humano no documenta, y el humano puede perder contexto si la IA no registra sus decisiones. | **Hábito y Consistencia.** Trata la actualización de `docs/` como tratas a los tests: una parte no negociable del `Definition of Done`. Usa el `docs/00_Inbox` para capturar ideas rápidamente y reducir la fricción. |
| **Riesgo de Ruido** | Existe la tentación de documentar en exceso, creando una base de conocimientos desordenada y difícil de navegar. El objetivo es tener un "cerebro" curado, no un vertedero de información. | **Rol de "Jardinero Digital".** El desarrollador debe actuar como el curador principal. Revisa periódicamente el `Inbox` y refactoriza las notas para asegurar que sean claras, concisas y estén bien enlazadas. La calidad es más importante que la cantidad. |
| **Curva de Aprendizaje** | Requiere un cambio de mentalidad. El tiempo invertido en documentar una decisión (el "porqué") puede parecer un coste inicial, pero ahorra horas de re-contextualización e ingeniería inversa más adelante. | **Empezar Pequeño.** Comienza documentando solo las decisiones de arquitectura más críticas. A medida que veas los beneficios (ej. la IA entendiendo un concepto complejo sin tu ayuda), el hábito se reforzará. |
| **Dependencia del Agente** | La efectividad del sistema depende de la calidad del agente de IA. Un agente menos capaz podría tener dificultades para seguir las reglas, consultar archivos o generar documentación útil. | **Reglas Claras y Simples.** El archivo `.agent_rules/AGENT_CORE.md` debe ser lo más claro y directo posible. Audita periódicamente el trabajo de la IA (ej. revisando sus commits y las notas que genera) para asegurar que se está adhiriendo al pacto. |

---

## 📂 Estructura Incluida

Este repositorio ya incluye la siguiente estructura generada:

```
.
├── .agent_rules/
│   └── AGENT_CORE.md         # Mandamientos y reglas para tu agente de IA.
├── docs/
│   ├── 00_Inbox/                # Bandeja de entrada para ideas y notas rápidas.
│   │   └── README.md
│   ├── 00_KNOWLEDGE_BASE_MOC.md # MOC principal de la Knowledge Base.
│   ├── DEV_LOG.md               # Log de decisiones de desarrollo.
│   ├── VERSIONING_GUIDE.md      # Guía para el versionado semántico automático.
│   ├── ai_agents/               # Gestión y definición de los agentes de IA.
│   ├── components/              # Documentación de componentes técnicos.
│   ├── concepts/                # Definiciones de conceptos clave del proyecto.
│   ├── core/                    # Visión, arquitectura y principios fundamentales.
│   ├── experiments/             # Registro de experimentos y sus resultados.
│   └── templates/
│       └── COMPONENT_TEMPLATE.md  # Plantilla para documentar nuevos componentes.
├── templates/                  # Plantillas internas usadas por bootstrap.sh
└── bootstrap.sh                # Script para (re)generar la estructura.
```

---
*Hecho con la colaboración de IA, para una mejor colaboración con la IA.*