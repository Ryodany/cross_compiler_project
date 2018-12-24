#include "core.h"

Data buildData(uint16_t y, const std::string &city)
{
	Data ret;
	ret.year = y;
	ret.city = city;

	return ret;
}
