
#!/bin/bash

# Nombre del archivo CSV
archivo_csv="Accidentes_ags_2021.csv"

# Filtrar los datos para obtener solo aquellos con 'constitucion' en la columna 'Pagina'
datos_constitucion=$(grep -i "constitucion" "$archivo_csv" | awk -F',' '{print $1,$3}') #era la columna 22 no la 3

# Verificar si se encontraron datos para 'constitucion'
if [ -n "$datos_constitucion" ]; then
    # Imprimir encabezados
    echo "Pagina          Estatus"
    
    # Imprimir datos formateados en columnas
    echo "$datos_constitucion" | sed 's/,/        /g'
else
    echo "No se encontraron datos para 'constitucion'."
fi