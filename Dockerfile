# Use an image with OpenJDK and Python pre-installed
FROM openjdk:11

# Set the working directory
WORKDIR /app

# Create a symbolic link for 'python' to 'python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

# Create a simple Python script named 'script.py'
RUN echo 'print("Hello from Python!")' > main.py


# Create a simple Java program
RUN echo 'public class Main { public static void main(String[] args) { System.out.println("Hello from Java!"); } }' > Main.java

# Compile the Java program
RUN javac Main.java

# Use a shell script as the entry point to run both Python and Java
CMD ["sh", "-c", "java Main & python main.py"]
