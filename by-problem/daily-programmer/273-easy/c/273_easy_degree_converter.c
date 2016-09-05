/*
 * Inspired by Reddit's r/dailyprogrammer. User types input as follows:
 * NUMBER(UNIT SOURCE)(UNIT TARGET)
 * For example, 
 * 100cf to convert from 100 degrees celsius to farenheit.
 * #273 - Easy
 */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

//#define EXIT_SUCCESS return 0
#define CHAR_BUFFER 100
#define PI 3.14159
#define SET_TO_FROM(code,val_type) if(str[i] == code) {\
                                       if(*from == -1) {\
                                           *from = val_type; }\
                                       else { *to = val_type; }}

#define ELSE_SET_TO_FROM(code,val_type) else if(str[i] == code) {\
                                       if(*from == -1) {\
                                           *from = val_type; }\
                                       else { *to = val_type; }}

#define IF_FROM_TO(from_type,to_type) if(from == from_type && to == to_type)

#define ELSE_IF_FROM_TO(from_type,to_type) if(from == from_type && to == to_type)

                                       

typedef enum {DEGREES,RADIANS,CELSIUS,FARENHEIT,KELVIN} unit;

void scan_unit_and_value(char str[],unit* from, unit* to, double* val) {
    *from = -1;
    *to = -1;
    int i;
    int len = CHAR_BUFFER;
    char val_str[CHAR_BUFFER] = {0};
    
    for(i = 0; i<len; i++)
    {
        if(str[i] == ' ')
            continue;
        else if( (str[i] >= '0' && str[i] <= '9') || (str[i] == '.'))
        {
            char c[2] = {str[i],'\0'};
            strcat(val_str,c);
        }
        else if(str[i] == 'd' || str[i] == 'r' || str[i] == 'c' ||
                str[i] == 'k' || str[i] == 'f')
        {
            SET_TO_FROM('d',DEGREES)
            ELSE_SET_TO_FROM('r',RADIANS)
            ELSE_SET_TO_FROM('c',CELSIUS)
            ELSE_SET_TO_FROM('k',KELVIN)
            ELSE_SET_TO_FROM('f',FARENHEIT)
        }
    }
    *val = atof(val_str);
}

double convert_unit(double value, unit from, unit to) {
    IF_FROM_TO(RADIANS,DEGREES)
        return (value * (180.0 / PI)) / 2;
    ELSE_IF_FROM_TO(DEGREES,RADIANS)
        return value * (PI / 180.0);
    ELSE_IF_FROM_TO(CELSIUS,KELVIN)
        return value + 273;
    ELSE_IF_FROM_TO(KELVIN,CELSIUS)
        return value - 273;
    ELSE_IF_FROM_TO(CELSIUS,FARENHEIT)
        return (value * 9 / 5) + 32;
    ELSE_IF_FROM_TO(FARENHEIT,CELSIUS)
        return (value - 32) * 5 / 9;
    ELSE_IF_FROM_TO(FARENHEIT,KELVIN)
        return (value + 459.67) * 5 / 9;
    ELSE_IF_FROM_TO(KELVIN,FARENHEIT)
        return 9 / 5 * (value - 273) + 32;
    printf("Bad unit settings. Cannot convert.\n");
    exit(1);
    return -1;
}

main() {
    // To make sure we don't get given already-existing data... ={0}
    char str[CHAR_BUFFER] = {0};
    scanf("%s",str);

    unit from;
    unit to;

    double value;
    scan_unit_and_value(str, &from, &to, &value);

    printf("%f\n",value);
    printf("RESULT: %f\n",convert_unit(value,from,to));

    EXIT_SUCCESS;
}
