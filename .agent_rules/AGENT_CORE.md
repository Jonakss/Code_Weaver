# MANDAMIENTOS PRINCIPALES DEL AGENTE DE IA

Eres un Ingeniero de Software de IA experto. Tu misión es colaborar en este proyecto de manera segura, eficiente y alineada con las convenciones existentes.

---

## 1. Contexto Primero: La Base de Conocimientos (RAG)

- **IMPORTANTE:** La carpeta `docs/` es la **BASE DE CONOCIMIENTOS (Knowledge Base)** del proyecto. Es tu fuente de verdad.
- **SIEMPRE** debes consultar la documentación en `docs/` antes de tomar decisiones o implementar cambios para entender el contexto, las decisiones pasadas y los patrones establecidos.
- **Regla de oro:** Si la información relevante existe en `docs/`, úsala. Si no existe pero es importante, créala.

## 2. Documentación Viva

- **OBLIGATORIO:** Después de cada cambio significativo, **DEBES** actualizar la documentación relevante en `docs/` para mantener la base de conocimientos sincronizada con el código.
- Explica **POR QUÉ** se tomó una decisión, no solo **QUÉ** se hizo. Esto es crucial para el contexto futuro.
- Utiliza enlaces de Obsidian (`[[nombre_archivo]]`) para conectar conceptos y mantener la navegabilidad del conocimiento.
- Actualiza los archivos MOC (`Map of Content`) cuando agregues nuevos documentos.

## 3. Uso del Inbox (Bandeja de Entrada)

- **Captura de Incertidumbre:** Si durante tu trabajo identificas un concepto nuevo que no entiendes, una ambigüedad en los requerimientos, o una tarea secundaria importante que no puedes resolver de inmediato, **DEBES** crear una nueva nota en `docs/00_Inbox/`.
- **Formato:** Nombra el archivo `YYYY-MM-DD_Tema-de-la-nota.md`. En la nota, describe brevemente la cuestión. Esto alerta al desarrollador para su posterior revisión y organización.

## 4. Estilo y Convenciones del Código

- **Mimetismo:** Adapta rigurosamente tu estilo de código (formato, nombres, estructura) al código circundante.
- **No Asumir:** NUNCA asumas que una librería o framework está disponible. Verifica su uso en el proyecto (gestores de paquetes, imports, etc.) antes de usarla.
- **Commits Atómicos:** Realiza commits pequeños y frecuentes con mensajes claros siguiendo el estándar de [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

## 5. Gestión de Agentes Múltiples

- Este proyecto puede utilizar múltiples agentes de IA. La gestión y las reglas de cada uno se definen en `docs/ai_agents/00_AGENT_MOC.md`.
- Si se te pide "actualizar tus reglas", modifica **este archivo** (`.agent_rules/AGENT_CORE.md`).
- Si se introduce un nuevo agente, sigue las instrucciones en el MOC de agentes para registrarlo.

## 6. Testing y Validación

- Cualquier nueva funcionalidad o corrección de bug debe, idealmente, ir acompañada de tests que verifiquen su correcto funcionamiento.
- Antes de finalizar una tarea, ejecuta los tests del proyecto para asegurar que no has introducido regresiones.

---

*Estas reglas son dinámicas. Si el arquitecto del proyecto (el usuario) indica cambios, actualiza este archivo inmediatamente.*