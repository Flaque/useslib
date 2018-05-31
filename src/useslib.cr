require "./useslib/*"

# Checks `pkg-config` for the existance of a C library
# on a user's system before they compile the code.
#  
# ```
# useslib imagemagick 
#
# puts "This runs if imagemagick is installed"
# ```
macro useslib(name)
  # Wraps pkg-config in an if statement so we don't exit if we hit a non-zero 
  # exit code.
  {% if `if pkg-config #{name}; then echo true; else echo false; fi` == "false\n" %}
  {% raise "Unable to find c library '#{name}' on your system. Are you sure you installed it?" %}
  {% skip_file %}
  {% end %}
end
