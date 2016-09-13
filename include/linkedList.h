typedef struct {
	char *name;
    int length;
    struct dataString *next;
} dataHeader;

typedef struct {
    char *string;
    struct dataString *next;
} dataString;

/* Preconditions: None.

Postconditions: Returns a pointer to a struct of type dataHeader.
It dynamically allocates the structure and sets the initial values of the variables. */
dataHeader *buildHeader();


/* Preconditions: An initalized dataHeader is available. The name as the parameter is of correct type.
Postconditions: Allocates and sets the name string in a dataHeader structure. */
void setName(dataHeader *header, char *name);


/* Preconditions: An initalized dataHeader is available.
Postconditions: Returns a pointer to the name string in the dataHeader structure. */
char *getName(dataHeader *header);


/* Preconditions: An initalized dataHeader is available.
Postconditions: Returns the integer value stored in the length variable in the dataHeader structure. */
int getLength(dataHeader *header);
