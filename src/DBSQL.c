#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <sys/types.h>

typedef struct
{
    char *buffer;
    size_t buffer_length;
    ssize_t input_length;
} InputBuffer;

InputBuffer *new_input_buffer()
{
    InputBuffer *input_buffer = (InputBuffer *)calloc(1, sizeof(InputBuffer));
    return input_buffer;
}

void print_prompt()
{
    printf("CDB-SQL > ");
}

/**
 * @brief Wrapper for libc's get_line()
 *
 */
void read_input(InputBuffer *input_buffer)
{
    ssize_t bytes_read = getline(&(input_buffer->buffer), &(input_buffer->buffer_length), stdin);
    if (bytes_read <=0) 
    {
        printf("Error reading input\n");
        exit(EXIT_FAILURE);
    }

    input_buffer->input_length=bytes_read-1; // ignore trailing newline
    input_buffer->buffer[bytes_read - 1] = 0;// strip newline
}

void close_input_buffer(InputBuffer* input_buffer){
    free (input_buffer->buffer);
    free(input_buffer);
}

int main(int argc, char *arg[])
{
    InputBuffer *input_buffer = new_input_buffer();
    while (true)
    {
        print_prompt();
        read_input(input_buffer);

        if (strcmp(input_buffer->buffer, ".exit") == 0)
        {
            close_input_buffer(input_buffer);
            printf("Hello");
            exit(EXIT_SUCCESS);
        }
        else
            printf("Unrecognized command '%s'.\n", input_buffer->buffer);
    }
}