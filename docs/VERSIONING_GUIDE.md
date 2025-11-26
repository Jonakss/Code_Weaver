# Guía de Versionado Automático

Este documento describe el sistema de versionado semántico automatizado. Para que funcione, los mensajes de commit (o las etiquetas de PR en GitHub) deben seguir un formato específico.

---

## Formato del Mensaje de Commit

Para activar un incremento de versión automático al hacer push a la rama principal, incluye una de las siguientes etiquetas en tu mensaje de commit.

**Sintaxis:** `tipo(scope): descripción [version:bump:TIPO]`

### Tipos de Incremento

-   **`[version:bump:patch]`**
    -   **Cuándo usar:** Para correcciones de bugs retrocompatibles, hotfixes, o mejoras menores que no añaden funcionalidad.
    -   **Ejemplo:** `fix(api): corregir error de null pointer en endpoint [version:bump:patch]`

-   **`[version:bump:minor]`**
    -   **Cuándo usar:** Para nuevas funcionalidades que son retrocompatibles, mejoras de rendimiento significativas o nuevas características.
    -   **Ejemplo:** `feat(ui): añadir modo oscuro al dashboard [version:bump:minor]`

-   **`[version:bump:major]`**
    -   **Cuándo usar:** Para cambios que rompen la retrocompatibilidad (breaking changes), refactorizaciones mayores de la arquitectura, o cambios en el contrato de la API.
    -   **Ejemplo:** `refactor(auth): cambiar sistema de JWT a OAuth2 (breaking) [version:bump:major]`

**IMPORTANTE:** Si **NO** incluyes ninguna de estas etiquetas, el sistema de CI/CD **NO** incrementará la versión. Esto es útil para commits que no afectan al producto final (ej. `docs:`, `chore:`).
