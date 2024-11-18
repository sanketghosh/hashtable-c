# Ensure the build directory exists
build_dir := build

# Name of the executable
exe := $(build_dir)/hash_table

# Compile flags (if needed)
CFLAGS := -Wall -Wextra

# Source files
src_files := src/hash_table.c

# Object files
obj_files := $(patsubst src/%.c, $(build_dir)/%.o, $(src_files))

# Targets
all: build run

# Build target: creates the object file and the executable
build: $(exe)

# Create the build directory if it doesn't exist
$(build_dir):
	@mkdir -p $(build_dir)

# Compile the source code to an object file
# $(build_dir)/%.o: src/%.c | $(build_dir)
# 	@gcc $(CFLAGS) -c $< -o $@

# Link the object file to an executable
$(exe): $(obj_files)
	@gcc $(CFLAGS) $^ -o $@

# Run the program
run: $(exe)
	@./$(exe)

# Clean up generated files
clean:
	@rm -rf $(build_dir)
