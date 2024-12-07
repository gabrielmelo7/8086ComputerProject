#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* command_converter(char *buffer){
    char *word;
    if(strcmp(buffer, "add\n") == 0){
        //add = 0001
        word = "0001\n";
    }

    else if(strcmp(buffer, "sub\n") == 0){
        //sub = 0010
        word = "0010\n";
    }

    else if(strcmp(buffer, "not\n") == 0){
        //not = 1111
        word = "1111\n";
    }

    else{
        //binary command
        word = buffer;
    }

    printf("%s is now %s\n", buffer, word);

    return word;
}

int main(){

    FILE *command_file = fopen("commands.txt", "r");
    FILE *binary_file = fopen("binary_commands.exe", "wb");
    char buffer;
    char *word_to_convert;
    char *word;

    if(command_file != NULL){
        word_to_convert = (char*)malloc(sizeof(char));
        int word_size = 0;
        int ptr_position = 0;
        while(fread(&buffer, sizeof(char), 1, command_file) != 0){
                word_size++;
                word_to_convert = (char*)realloc(word_to_convert, sizeof(char)*word_size);
                word_to_convert[ptr_position] = buffer;
                ptr_position++;

                if(buffer == '\n'){
                    word_to_convert[ptr_position] = '\0';
                    word_size = 0;
                    ptr_position = 0;
                    word = command_converter(word_to_convert);
                    word_to_convert = (char*)realloc(word_to_convert, sizeof(char));
                    if(binary_file != NULL){
                        fwrite(word, sizeof(char), strlen(word), binary_file);
                    }

                    else{
                        printf("Erro ao abrir binary file");
                    }

                }

        }

        word_to_convert[ptr_position] = '\0';
        word_size = 0;
        ptr_position = 0;
        word = command_converter(word_to_convert);
        word_to_convert = (char*)realloc(word_to_convert, sizeof(char));
        fputs(word, binary_file);   


        printf("Command converting finished");
     
            

        }

    else{
        printf("Couldn´t open commands.txt\n");
    }

    free(word_to_convert);
    fclose(command_file);
    fclose(binary_file);

    return 0;
}