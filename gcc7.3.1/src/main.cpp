#include "core.h"
#include <iostream>

int main(int argc, char *argv[])
{
	Data d = buildData(2018, "Valladolid");

	std::cout << "Year: " << d.year << ", City: " << d.city << std::endl;

	Core core("first str");
	core.m_vals.push_back("last one");

	for (std::vector<std::string>::iterator itVals = core.m_vals.begin(); itVals != core.m_vals.end(); itVals++)
		std::cout << "Val = " << *itVals << std::endl;

	return 0;
}
