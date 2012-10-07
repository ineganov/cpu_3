char * x = "Hello";
char * y = "M";
char * z = "Goodbye";
int global_i = 0xABCD1234;



int mad(int a, int b)
{	static int c = 2;
//	z[0]++;
	c += a * b;
	return c; }