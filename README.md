# 📊 Modelamiento — Actividad Autónoma 1

> **Unidad 1:** Introducción al modelado de datos y predicción  
> **Tema 1:** Introducción al modelado en ciencia de datos

**Autores:**  
Camilo Enrique Morocho Vinueza · Leandre Jeshua Luzuriaga Chaves · Víctor Erick Acaro Bustos  
*Abril 2026*

---

##  Descripción

Este proyecto aplica un modelo de **regresión lineal simple** sobre el dataset `women` de R, con el objetivo de evaluar si la **altura** es un predictor estadísticamente significativo del **peso corporal** en mujeres, y de estimar el peso esperado para la estatura mínima del conjunto de datos.

---

##  Hipótesis

> *"La altura influye directamente en el peso corporal: a mayor estatura, mayor peso esperado."*

---

##  Estructura del análisis

```
├── 1. Exploración y análisis descriptivo
├── 2. Visualización de datos (dispersión, boxplots, histogramas)
├── 3. Correlación de Pearson
├── 4. Ajuste del modelo de regresión lineal simple
├── 5. Interpretación de coeficientes
├── 6. Análisis de residuos (validación de supuestos)
└── 7. Predicción puntual
```

---

##  Dataset

Se utiliza el dataset integrado en R: **`women`**

| Variable | Tipo | Descripción |
|----------|------|-------------|
| `height` | Numérica continua | Altura en pulgadas (rango: 58–72) |
| `weight` | Numérica continua | Peso en libras (rango: 115–164) |

- **Observaciones:** 15 filas
- **Sin valores faltantes**
- Distribución relativamente uniforme en ambas variables

---

##  Resultados principales

### Correlación de Pearson

```
cor(women$height, women$weight)
# [1] 0.9954948
```

Correlación **muy fuerte y positiva** entre altura y peso.

---

### Ecuación del modelo

$$\hat{weight} = -87.52 + 3.45 \times height$$

### Interpretación de coeficientes

| Parámetro | Valor | Significado |
|-----------|-------|-------------|
| **Intercepto (β₀)** | −87.52 | Anclaje matemático de la recta (sin interpretación física real) |
| **Pendiente (β₁)** | 3.45 | Por cada pulgada adicional de altura, el peso aumenta **3.45 libras** en promedio |
| **R²** | 0.991 | El modelo explica el **99.1%** de la variabilidad del peso |
| **p-value** | 1.09e-14 | Relación **altamente significativa** (se rechaza H₀) |
| **Error estándar residual** | ±1.525 libras | Margen de error promedio de las predicciones |

---

### Diagnóstico de residuos

| Gráfico | Supuesto evaluado | Resultado |
|---------|-------------------|-----------|
| Residuals vs Fitted | Linealidad |  Ligera curvatura en "U" → posible componente cuadrática |
| Normal Q-Q | Normalidad de errores |  Cumplido |
| Scale-Location | Homocedasticidad |  Cumplido |
| Residuals vs Leverage | Valores influyentes |  Sin outliers críticos |

---

### Predicción

Para la altura mínima observada (**58 pulgadas**):

```r
predict(modelo, newdata = data.frame(height = 58))
# [1] 112.58 libras
```

Rango estimado considerando el error estándar: **~111 a ~114 libras**

---

## Conclusión

El análisis confirma estadística y empíricamente la hipótesis planteada:

- Existe una relación **directa, positiva y altamente significativa** entre la altura y el peso corporal (R² = 99.1%).
- La regresión lineal simple es una herramienta confiable para **interpolaciones dentro del rango observado** (58–72 pulgadas).
- Sin embargo, el análisis de residuos revela una **ligera no linealidad**, lo que sugiere que un modelo cuadrático podría mejorar el ajuste, ya que el peso (magnitud tridimensional) no escala perfectamente de forma lineal con la altura (magnitud unidimensional).

---

## Tecnologías utilizadas

![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)

- **Lenguaje:** R
- **Paquetes:** `base`, `stats`, `graphics`, `equatiomatic`
- **Dataset:** `women` (integrado en R base)

---

## Archivos del repositorio

```
📂 repositorio/
 ├── 📄 README.md
 └── 📄 actividad_autonoma1.Rmd   # Código fuente del análisis
```
