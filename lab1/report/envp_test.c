#include <stdlib.h>
#include <stdio.h>
#include <string.h>
void main(int argc, char const *argv[],char* env[])
{
	int i = 0;
	sscanf("*1","%d",&i);
	printf("%d\n", i);

}
/*

void shift(char* str_input){
	char *str_output;
	str_output = malloc(120);
	int i;
	for (i = 0; i < strlen(str_input); ++i)
	{
		str_output[i] = str_input[i] -3;
	}
	str_output[i] = 0;
	printf("%s\n", str_output);
	return;
}


void check(char* input_str){
	int  ebp_8 = 0,ebp_c = 0;
	for(;ebp_c < strlen(input_str);ebp_c++){
		sscanf(input_str[ebp_c],"%d",ebp_4);
		ebp_8 += ebp_4;
		if(ebp_8 != 15) 
			continue;
		parell(input_str);
	}
	printf("%s\n", "Password Incorrect!");
	return;
}




void check(char* input_str){
	int  ebp_8 = 0,ebp_c = 0;
	for(;ebp_c < strlen(input_str);ebp_c++){
		sscanf(input_str[ebp_c],"%d",ebp_4);
		ebp_8 += ebp_4;
		if(ebp_8 != 16) 
			continue;
		parell(input_str,envp);
	}
	printf("%s\n", "Password Incorrect!");
	return;
}

void parell(char* input_str,char* envp[]){
     int ebp-4;
     sscanf(input_str,"%d",ebp-4);
     if( dummy(ebp-4,envp) == 0 )
          return;
     for(int i = 0; i < 9; i++){
         if( (ebp-4 & 1) == 0)
               printf("Password OK!");
     }
}
*/