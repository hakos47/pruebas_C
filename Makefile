# Definición de variables
BUILDDIR = build
SRCDIR = src

# Lista de archivos fuente
SOURCE = $(wildcard $(SRCDIR)/*.c)

# Objetos correspondientes a los archivos fuente
OBJECTS = $(SOURCE:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Nombre del ejecutable final
EXECUTABLE = $(BUILDDIR)/pruebas

# Regla principal
all: $(EXECUTABLE)

# Regla para construir el ejecutable
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

# Regla para construir archivos objeto
$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)   # Asegura que el directorio de construcción exista
	$(CC) $(CFLAGS) -c $< -o $@

# Regla para limpiar archivos generados
clean:
	rm -f $(BUILDDIR)/*.o $(EXECUTABLE)
