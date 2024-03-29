#!/bin/bash

# Nombre del archivo CSV
archivo_csv="Accidentes_ags_2021.csv"

# Filtrar los datos para obtener solo aquellos con 'abastos' en la columna 'Pagina'
datos_abastos=$(grep -i "abastos" "$archivo_csv" | awk -F',' '{print $1,$4}') #era la columna 13 no la 4

# Verificar si se encontraron datos para 'abastos'
if [ -n "$datos_abastos" ]; then
    # Imprimir encabezados
    echo "Pagina          Estatus"
    
    # Imprimir datos formateados en columnas
    echo "$datos_abastos" | sed 's/,/        /g'
else
    echo "No se encontraron datos para 'abastos'."
fi